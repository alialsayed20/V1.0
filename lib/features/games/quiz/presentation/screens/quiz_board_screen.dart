import 'package:boode/features/games/quiz/application/controllers/quiz_helper_controller.dart';
import 'package:boode/features/games/quiz/application/controllers/quiz_question_controller.dart';
import 'package:boode/features/games/quiz/application/controllers/quiz_session_controller.dart';
import 'package:boode/features/games/quiz/application/providers/quiz_board_use_case_providers.dart';
import 'package:boode/features/games/quiz/application/providers/quiz_question_use_case_providers.dart';
import 'package:boode/features/games/quiz/domain/entities/board.dart';
import 'package:boode/features/games/quiz/domain/entities/board_cell.dart';
import 'package:boode/features/games/quiz/domain/entities/game_session.dart';
import 'package:boode/features/games/quiz/domain/entities/helper_usage.dart';
import 'package:boode/features/games/quiz/domain/entities/question_round.dart';
import 'package:boode/features/games/quiz/domain/entities/team.dart';
import 'package:boode/features/games/quiz/domain/enums/board_cell_state.dart';
import 'package:boode/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class QuizBoardScreen extends ConsumerWidget {
  const QuizBoardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final sessionAsync = ref.watch(quizSessionControllerProvider);
    final session = sessionAsync.valueOrNull;

    final getBoard = ref.read(getBoardBySessionIdUseCaseProvider);
    final getRound = ref.read(getActiveQuestionRoundUseCaseProvider);
    final questionController = ref.read(quizQuestionControllerProvider.notifier);
    final helperController = ref.read(quizHelperControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.quizBoardTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: session == null
              ? Center(
                  child: Text(
                    l10n.quizBoardSubtitle,
                    style: theme.textTheme.bodyLarge,
                  ),
                )
              : FutureBuilder<Board?>(
                  future: getBoard(session.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final board = snapshot.data;

                    if (board == null || board.cells.isEmpty) {
                      return Center(
                        child: Text(
                          l10n.quizBoardSubtitle,
                          style: theme.textTheme.bodyLarge,
                        ),
                      );
                    }

                    final columnsCount =
                        _calculateColumnsCount(board.cells.length);
                    final currentTurnTeamName =
                        _resolveCurrentTurnTeamName(session);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          l10n.quizBoardTitle,
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          l10n.quizBoardCurrentTurn(currentTurnTeamName),
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.quizBoardSubtitle,
                          style: theme.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: FilledButton.icon(
                                  onPressed: () async {
                                    final QuestionRound? round =
                                        await getRound(session.id);
                                    if (round == null) return;

                                    await helperController.activateBlockSteal(
                                      sessionId: session.id,
                                      usage: HelperUsage(
                                        teamId: session.currentTurnTeamId,
                                        usedHelpers: const [],
                                      ),
                                      round: round,
                                    );
                                  },
                                  icon: const Icon(Icons.shield),
                                  label: Text(l10n.quizBoardBlockSteal),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text(l10n.quizBoardDoublePoints),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.exposure_plus_2),
                                  label: Text(l10n.quizBoardDoublePoints),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: OutlinedButton.icon(
                                  onPressed: () async {
                                    final List<Team> candidates = session.teams
                                        .where(
                                          (team) =>
                                              team.id !=
                                              session.currentTurnTeamId,
                                        )
                                        .toList();

                                    if (candidates.isEmpty) {
                                      return;
                                    }

                                    final Team? selectedTeam =
                                        await showModalBottomSheet<Team>(
                                      context: context,
                                      builder: (context) {
                                        return SafeArea(
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                            itemCount: candidates.length,
                                            separatorBuilder: (_, __) =>
                                                const Divider(height: 1),
                                            itemBuilder: (context, index) {
                                              final team = candidates[index];
                                              return ListTile(
                                                title: Text(team.name),
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pop(team);
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );

                                    if (selectedTeam == null) {
                                      return;
                                    }

                                    await helperController.excludeTeamFromNextTurn(
                                      sessionId: session.id,
                                      usage: HelperUsage(
                                        teamId: session.currentTurnTeamId,
                                        usedHelpers: const [],
                                      ),
                                      session: session,
                                      teamId: selectedTeam.id,
                                    );
                                  },
                                  icon: const Icon(Icons.person_off),
                                  label: Text(l10n.quizBoardExcludeNextTurn),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Expanded(
                          child: GridView.builder(
                            itemCount: board.cells.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: columnsCount,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                            ),
                            itemBuilder: (context, index) {
                              final cell = board.cells[index];
                              final isSelectable =
                                  cell.state == BoardCellState.available;

                              return _BoardCell(
                                points: cell.points.toString(),
                                state: cell.state,
                                onTap: isSelectable
                                    ? () async {
                                        await questionController.openQuestion(
                                          session: session,
                                          boardCellId: cell.id,
                                          categoryId: cell.categoryId,
                                        );

                                        if (context.mounted) {
                                          context.go('/quiz-question');
                                        }
                                      }
                                    : null,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }

  String _resolveCurrentTurnTeamName(GameSession session) {
    if (session.currentTurnTeamId.isEmpty) {
      return '-';
    }

    final Team? team = session.teams.cast<Team?>().firstWhere(
          (item) => item?.id == session.currentTurnTeamId,
          orElse: () => null,
        );

    return team?.name ?? session.currentTurnTeamId;
  }

  int _calculateColumnsCount(int cellsCount) {
    if (cellsCount <= 4) return cellsCount;
    if (cellsCount % 4 == 0) return 4;
    return 3;
  }
}

class _BoardCell extends StatelessWidget {
  const _BoardCell({
    required this.points,
    required this.state,
    required this.onTap,
  });

  final String points;
  final BoardCellState state;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAvailable = state == BoardCellState.available;
    final isCorrect = state == BoardCellState.answeredCorrectly;
    final isIncorrect = state == BoardCellState.answeredIncorrectly;

    final backgroundColor = isAvailable
        ? theme.colorScheme.surfaceContainerHighest
        : isCorrect
            ? theme.colorScheme.primaryContainer
            : theme.colorScheme.errorContainer;

    final textColor = isAvailable
        ? theme.colorScheme.onSurface
        : isCorrect
            ? theme.colorScheme.onPrimaryContainer
            : theme.colorScheme.onErrorContainer;

    return Card(
      color: backgroundColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Center(
          child: Opacity(
            opacity: isAvailable ? 1 : 0.75,
            child: Text(
              isIncorrect ? '—' : points,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}