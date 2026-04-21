import 'package:boode/features/games/quiz/application/controllers/quiz_board_controller.dart';
import 'package:boode/features/games/quiz/application/controllers/quiz_question_controller.dart';
import 'package:boode/features/games/quiz/application/controllers/quiz_session_controller.dart';
import 'package:boode/features/games/quiz/application/providers/quiz_board_use_case_providers.dart';
import 'package:boode/features/games/quiz/application/providers/quiz_question_use_case_providers.dart';
import 'package:boode/features/games/quiz/application/providers/quiz_turn_use_case_providers.dart';
import 'package:boode/features/games/quiz/domain/entities/board.dart';
import 'package:boode/features/games/quiz/domain/entities/game_session.dart';
import 'package:boode/features/games/quiz/domain/entities/question_round.dart';
import 'package:boode/features/games/quiz/domain/entities/team.dart';
import 'package:boode/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class QuizResultScreen extends ConsumerWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    final sessionAsync = ref.watch(quizSessionControllerProvider);

    final GameSession? session = sessionAsync.valueOrNull;
    final List<_TeamScoreViewItem> teamScores = _buildTeamScores(session);
    final String winnerTeamName =
        teamScores.isNotEmpty ? teamScores.first.teamName : '';

    final getBoardBySessionIdUseCase =
        ref.read(getBoardBySessionIdUseCaseProvider);
    final getActiveQuestionRoundUseCase =
        ref.read(getActiveQuestionRoundUseCaseProvider);
    final boardController = ref.read(quizBoardControllerProvider.notifier);
    final questionController =
        ref.read(quizQuestionControllerProvider.notifier);
    final advanceTurnUseCase = ref.read(advanceTurnUseCaseProvider);
    final sessionController = ref.read(quizSessionControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.quizResultTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                l10n.quizResultTitle,
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                l10n.quizResultSubtitle,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        l10n.quizResultWinnerLabel,
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        winnerTeamName,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: teamScores.isEmpty
                    ? Center(
                        child: Text(
                          l10n.quizResultSubtitle,
                          style: theme.textTheme.bodyLarge,
                        ),
                      )
                    : ListView.separated(
                        itemCount: teamScores.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (BuildContext context, int index) {
                          final item = teamScores[index];

                          return _ScoreTile(
                            teamName: item.teamName,
                            score: item.score.toString(),
                          );
                        },
                      ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: FilledButton(
                        onPressed: session == null || teamScores.isEmpty
                            ? null
                            : () async {
                                final Board? board =
                                    await getBoardBySessionIdUseCase(session.id);
                                final QuestionRound? round =
                                    await getActiveQuestionRoundUseCase(
                                  session.id,
                                );

                                if (board == null || round == null) {
                                  if (context.mounted) {
                                    context.go('/quiz-board');
                                  }
                                  return;
                                }

                                final Team? winnerTeam = session.teams
                                    .cast<Team?>()
                                    .firstWhere(
                                      (Team? team) =>
                                          team?.name == winnerTeamName,
                                      orElse: () => null,
                                    );

                                if (winnerTeam != null) {
                                  await boardController.markCellCorrect(
                                    sessionId: session.id,
                                    board: board,
                                    cellId: round.boardCellId,
                                    winningTeamId: winnerTeam.id,
                                  );
                                }

                                await questionController.closeRound(
                                  sessionId: session.id,
                                  round: round,
                                );

                                final GameSession updatedSession =
                                    await advanceTurnUseCase(session);

                                sessionController.setSession(updatedSession);

                                if (context.mounted) {
                                  context.go('/quiz-board');
                                }
                              },
                        child: Text(l10n.quizResultCorrect),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: OutlinedButton(
                        onPressed: session == null
                            ? null
                            : () async {
                                final Board? board =
                                    await getBoardBySessionIdUseCase(session.id);
                                final QuestionRound? round =
                                    await getActiveQuestionRoundUseCase(
                                  session.id,
                                );

                                if (board == null || round == null) {
                                  if (context.mounted) {
                                    context.go('/quiz-board');
                                  }
                                  return;
                                }

                                await boardController.markCellIncorrect(
                                  sessionId: session.id,
                                  board: board,
                                  cellId: round.boardCellId,
                                );

                                await questionController.closeRound(
                                  sessionId: session.id,
                                  round: round,
                                );

                                final GameSession updatedSession =
                                    await advanceTurnUseCase(session);

                                sessionController.setSession(updatedSession);

                                if (context.mounted) {
                                  context.go('/quiz-board');
                                }
                              },
                        child: Text(l10n.quizResultIncorrect),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<_TeamScoreViewItem> _buildTeamScores(GameSession? session) {
    if (session == null) {
      return const <_TeamScoreViewItem>[];
    }

    final Map<String, Team> teamsById = <String, Team>{
      for (final Team team in session.teams) team.id: team,
    };

    final List<Team> orderedTeams = session.turnOrder.isNotEmpty
        ? session.turnOrder
            .map((String teamId) => teamsById[teamId])
            .whereType<Team>()
            .toList()
        : session.teams;

    return orderedTeams.asMap().entries.map((entry) {
      return _TeamScoreViewItem(
        teamName: entry.value.name,
        score: entry.key == 0 ? 100 : 50,
      );
    }).toList();
  }
}

class _TeamScoreViewItem {
  const _TeamScoreViewItem({
    required this.teamName,
    required this.score,
  });

  final String teamName;
  final int score;
}

class _ScoreTile extends StatelessWidget {
  const _ScoreTile({
    required this.teamName,
    required this.score,
  });

  final String teamName;
  final String score;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                teamName,
                style: theme.textTheme.titleMedium,
              ),
            ),
            Text(
              score,
              style: theme.textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}