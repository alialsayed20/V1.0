import 'package:boode/features/games/quiz/application/controllers/quiz_session_controller.dart';
import 'package:boode/features/games/quiz/domain/entities/game_session.dart';
import 'package:boode/features/games/quiz/domain/entities/team.dart';
import 'package:boode/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class QuizLotteryScreen extends ConsumerWidget {
  const QuizLotteryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    final sessionAsync = ref.watch(quizSessionControllerProvider);
    final sessionController = ref.read(quizSessionControllerProvider.notifier);

    final GameSession? session = sessionAsync.valueOrNull;
    final List<String> orderedTeamNames = _buildOrderedTeamNames(session);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.quizLotteryTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                l10n.quizLotteryTitle,
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                l10n.quizLotterySubtitle,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: orderedTeamNames.isEmpty
                    ? Center(
                        child: Text(
                          l10n.quizLotterySubtitle,
                          style: theme.textTheme.bodyLarge,
                        ),
                      )
                    : ListView.separated(
                        itemCount: orderedTeamNames.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (BuildContext context, int index) {
                          return _LotteryTeamCard(
                            order: index + 1,
                            teamName: orderedTeamNames[index],
                          );
                        },
                      ),
              ),
              SizedBox(
                height: 52,
                child: FilledButton(
                  onPressed: session == null
                      ? null
                      : () async {
                          final List<String> shuffledTeamIds = session.teams
                              .map((Team team) => team.id)
                              .toList()
                            ..shuffle();

                          await sessionController.runLottery(
                            session: session,
                            shuffledTeamIds: shuffledTeamIds,
                          );

                          if (context.mounted) {
                            context.go('/quiz-category-picking');
                          }
                        },
                  child: Text(l10n.quizSetupContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> _buildOrderedTeamNames(GameSession? session) {
    if (session == null) {
      return const <String>[];
    }

    final Map<String, Team> teamsById = <String, Team>{
      for (final Team team in session.teams) team.id: team,
    };

    if (session.turnOrder.isNotEmpty) {
      return session.turnOrder
          .map((String teamId) => teamsById[teamId]?.name ?? teamId)
          .toList();
    }

    return session.teams.map((Team team) => team.name).toList();
  }
}

class _LotteryTeamCard extends StatelessWidget {
  const _LotteryTeamCard({
    required this.order,
    required this.teamName,
  });

  final int order;
  final String teamName;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              child: Text(order.toString()),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                teamName,
                style: theme.textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}