import 'package:boode/features/games/quiz/application/controllers/quiz_session_controller.dart';
import 'package:boode/features/games/quiz/application/providers/quiz_board_use_case_providers.dart';
import 'package:boode/features/games/quiz/domain/entities/game_session.dart';
import 'package:boode/features/games/quiz/domain/entities/team.dart';
import 'package:boode/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:boode/features/games/quiz/application/providers/quiz_question_use_case_providers.dart';

class QuizCategoryPickingScreen extends ConsumerWidget {
  const QuizCategoryPickingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    final sessionAsync = ref.watch(quizSessionControllerProvider);

    final GameSession? session = sessionAsync.valueOrNull;
    final List<_TeamCategoryViewItem> items = _buildItems(session);
    final createInitialBoardUseCase =
        ref.read(createInitialBoardUseCaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.quizCategoryPickingTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                l10n.quizCategoryPickingTitle,
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                l10n.quizCategoryPickingSubtitle,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: items.isEmpty
                    ? Center(
                        child: Text(
                          l10n.quizCategoryPickingSubtitle,
                          style: theme.textTheme.bodyLarge,
                        ),
                      )
                    : ListView.separated(
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (BuildContext context, int index) {
                          return _TeamCategoryCard(
                            item: items[index],
                            l10n: l10n,
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
                          final List<String> categoryIds = items
                              .expand((item) => item.categoryIds)
                              .toSet()
                              .toList();

                          final seedUseCase =
                              ref.read(seedMockQuestionsUseCaseProvider);

                          await seedUseCase(categoryIds);

                          await createInitialBoardUseCase(
                            sessionId: session.id,
                            categoryIds: categoryIds,
                          );

                          if (context.mounted) {
                            context.go('/quiz-board');
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

  List<_TeamCategoryViewItem> _buildItems(GameSession? session) {
    if (session == null) {
      return const <_TeamCategoryViewItem>[];
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

    return orderedTeams
        .asMap()
        .entries
        .map(
          (entry) => _TeamCategoryViewItem(
            teamName: entry.value.name,
            categoryTitles: const <String>['', '', ''],
            categoryIds: <String>[
              'team_${entry.key + 1}_category_1',
              'team_${entry.key + 1}_category_2',
              'team_${entry.key + 1}_category_3',
            ],
          ),
        )
        .toList();
  }
}

class _TeamCategoryViewItem {
  const _TeamCategoryViewItem({
    required this.teamName,
    required this.categoryTitles,
    required this.categoryIds,
  });

  final String teamName;
  final List<String> categoryTitles;
  final List<String> categoryIds;
}

class _TeamCategoryCard extends StatelessWidget {
  const _TeamCategoryCard({
    required this.item,
    required this.l10n,
  });

  final _TeamCategoryViewItem item;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item.teamName,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ...item.categoryTitles.asMap().entries.map(
              (entry) {
                final int index = entry.key;
                final String title = entry.value;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.category_outlined),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          title.isEmpty
                              ? l10n.quizCategoryPickingCategoryLabel(index + 1)
                              : title,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}