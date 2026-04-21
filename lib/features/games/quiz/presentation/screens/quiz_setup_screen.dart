import 'package:boode/features/games/quiz/application/controllers/quiz_session_controller.dart';
import 'package:boode/features/games/quiz/application/controllers/quiz_setup_controller.dart';
import 'package:boode/features/games/quiz/domain/entities/player.dart';
import 'package:boode/features/games/quiz/domain/entities/team.dart';
import 'package:boode/features/games/quiz/domain/enums/team_state.dart';
import 'package:boode/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class QuizSetupScreen extends ConsumerWidget {
  const QuizSetupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    final state = ref.watch(quizSetupControllerProvider);
    final controller = ref.read(quizSetupControllerProvider.notifier);
    final sessionController = ref.read(quizSessionControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.quizSetupTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                l10n.quizSetupTitle,
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                l10n.appTitle,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              _SetupNumberCard(
                label: l10n.quizSetupTeamsCount,
                value: state.teamsCount.toString(),
                onIncrement: controller.incrementTeams,
                onDecrement: controller.decrementTeams,
              ),
              const SizedBox(height: 16),
              _SetupNumberCard(
                label: l10n.quizSetupPlayersCount,
                value: state.playersCount.toString(),
                onIncrement: controller.incrementPlayers,
                onDecrement: controller.decrementPlayers,
              ),
              const Spacer(),
              SizedBox(
                height: 52,
                child: FilledButton(
                  onPressed: () async {
                    final List<Team> teams = List<Team>.generate(
                      state.teamsCount,
                      (int index) => Team(
                        id: 'team_${index + 1}',
                        name: state.generatedTeamNames[index],
                        state: TeamState.active,
                      ),
                    );

                    final List<Player> players = List<Player>.generate(
                      state.playersCount,
                      (int index) {
                        final int teamIndex = index % state.teamsCount;

                        return Player(
                          id: 'player_${index + 1}',
                          name: 'Player ${index + 1}',
                          colorCode: 'color_${index + 1}',
                          teamId: teams[teamIndex].id,
                        );
                      },
                    );

                    await sessionController.startSession(
                      sessionId: 'session_1',
                      teams: teams,
                      players: players,
                    );

                    if (context.mounted) {
                      context.go('/quiz-lottery');
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
}

class _SetupNumberCard extends StatelessWidget {
  const _SetupNumberCard({
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  final String label;
  final String value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

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
                label,
                style: theme.textTheme.titleMedium,
              ),
            ),
            IconButton(
              onPressed: onDecrement,
              icon: const Icon(Icons.remove_circle_outline),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                value,
                style: theme.textTheme.titleMedium,
              ),
            ),
            IconButton(
              onPressed: onIncrement,
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ),
    );
  }
}