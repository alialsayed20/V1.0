import 'package:boode/features/games/quiz/application/controllers/quiz_helper_controller.dart';
import 'package:boode/features/games/quiz/application/controllers/quiz_session_controller.dart';
import 'package:boode/features/games/quiz/application/providers/quiz_question_use_case_providers.dart';
import 'package:boode/features/games/quiz/domain/entities/game_session.dart';
import 'package:boode/features/games/quiz/domain/entities/helper_usage.dart';
import 'package:boode/features/games/quiz/domain/entities/question.dart';
import 'package:boode/features/games/quiz/domain/entities/question_round.dart';
import 'package:boode/features/games/quiz/domain/entities/team.dart';
import 'package:boode/features/games/quiz/domain/enums/question_content_type.dart';
import 'package:boode/features/games/quiz/domain/enums/question_round_status.dart';
import 'package:boode/features/games/quiz/domain/enums/question_side.dart';
import 'package:boode/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class QuizQuestionScreen extends ConsumerStatefulWidget {
  const QuizQuestionScreen({super.key});

  @override
  ConsumerState<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends ConsumerState<QuizQuestionScreen> {
  int _reloadKey = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final session = ref.watch(quizSessionControllerProvider).valueOrNull;

    final getRound = ref.read(getActiveQuestionRoundUseCaseProvider);
    final getQuestion = ref.read(getQuestionByIdUseCaseProvider);
    final reveal = ref.read(revealQuestionAnswerUseCaseProvider);

    final helper = ref.read(quizHelperControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.quizQuestionTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: session == null
              ? Center(child: Text(l10n.quizQuestionSubtitle))
              : FutureBuilder<QuestionRound?>(
                  key: ValueKey(_reloadKey),
                  future: getRound(session.id),
                  builder: (context, rSnap) {
                    if (rSnap.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final round = rSnap.data;
                    if (round == null) {
                      return Center(child: Text(l10n.quizQuestionPlaceholder));
                    }

                    return FutureBuilder<Question?>(
                      future: getQuestion(round.questionId),
                      builder: (context, qSnap) {
                        if (qSnap.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        final question = qSnap.data;

                        final prompt =
                            _text(question, QuestionSide.prompt) ??
                                l10n.quizQuestionPlaceholder;

                        final answer = _text(question, QuestionSide.answer);

                        final revealed =
                            round.status == QuestionRoundStatus.reveal ||
                                round.status == QuestionRoundStatus.closed;

                        final opening = _openingTeam(session, round);
                        final order = _order(session, round);
                        final blocked = _blocked(session, round);

                        final stealStatus = round.isStealBlocked
                            ? l10n.quizQuestionStealBlocked
                            : l10n.quizQuestionStealAvailable;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              l10n.quizQuestionTitle,
                              style: theme.textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 12),
                            Text(l10n.quizQuestionOpeningTeam(opening)),
                            Text(l10n.quizQuestionAnswerOrder(order)),
                            Text(l10n.quizQuestionBlockedTeams(blocked)),
                            Text(stealStatus),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton.icon(
                                    onPressed: () async {
                                      if (round.answerOrder.length < 2) return;

                                      final target = round.answerOrder[1];

                                      await helper.blockTeamAnswer(
                                        sessionId: session.id,
                                        usage: HelperUsage(
                                          teamId: session.currentTurnTeamId,
                                          usedHelpers: const [],
                                        ),
                                        round: round,
                                        teamId: target,
                                      );

                                      if (!mounted) return;
                                      setState(() => _reloadKey++);
                                    },
                                    icon: const Icon(Icons.block),
                                    label: Text(l10n.quizQuestionBlockAnswer),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: FilledButton.icon(
                                    onPressed: round.isStealBlocked
                                        ? null
                                        : () async {
                                            if (round.answerOrder.length < 2) {
                                              return;
                                            }

                                            final stealTeam = round.answerOrder[1];

                                            await helper.stealQuestion(
                                              sessionId: session.id,
                                              usage: HelperUsage(
                                                teamId: session.currentTurnTeamId,
                                                usedHelpers: const [],
                                              ),
                                              round: round,
                                              stealingTeamId: stealTeam,
                                            );

                                            if (!mounted) return;
                                            setState(() => _reloadKey++);
                                          },
                                    icon: const Icon(Icons.swap_horiz),
                                    label: Text(l10n.quizQuestionSteal),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(
                                      '30',
                                      style: theme.textTheme.displaySmall,
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      prompt,
                                      textAlign: TextAlign.center,
                                    ),
                                    if (revealed && answer != null) ...[
                                      const SizedBox(height: 20),
                                      const Divider(),
                                      Text(
                                        answer,
                                        textAlign: TextAlign.center,
                                      ),
                                    ]
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            FilledButton(
                              onPressed: () async {
                                if (!revealed) {
                                  await reveal(
                                    sessionId: session.id,
                                    round: round,
                                  );

                                  if (!mounted) return;
                                  setState(() => _reloadKey++);
                                  return;
                                }

                                context.go('/quiz-result');
                              },
                              child: Text(
                                revealed
                                    ? l10n.quizResultFinish
                                    : l10n.quizQuestionRevealAnswer,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }

  String? _text(Question? q, QuestionSide side) {
    if (q == null) return null;

    final items = q.items.where(
      (e) => e.side == side && e.type == QuestionContentType.text,
    );

    if (items.isEmpty) return null;

    return items.map((e) => e.value).join('\n');
  }

  String _openingTeam(GameSession s, QuestionRound r) {
    if (r.answerOrder.isEmpty) return '-';

    final id = r.answerOrder.first;
    final t = s.teams.cast<Team?>().firstWhere(
          (e) => e?.id == id,
          orElse: () => null,
        );

    return t?.name ?? id;
  }

  String _order(GameSession s, QuestionRound r) {
    if (r.answerOrder.isEmpty) return '-';

    final map = {for (final t in s.teams) t.id: t};

    return r.answerOrder.map((id) => map[id]?.name ?? id).join(' → ');
  }

  String _blocked(GameSession s, QuestionRound r) {
    if (r.blockedTeamIds.isEmpty) return '-';

    final map = {for (final t in s.teams) t.id: t};

    return r.blockedTeamIds.map((id) => map[id]?.name ?? id).join('، ');
  }
}