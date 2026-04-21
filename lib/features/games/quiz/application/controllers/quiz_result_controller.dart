import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/game_session.dart';
import '../../domain/entities/session_score_summary.dart';
import '../providers/quiz_result_use_case_providers.dart';
import '../usecases/build_session_score_summaries_use_case.dart';
import '../usecases/determine_winner_use_case.dart';

final quizResultControllerProvider =
    StateNotifierProvider<QuizResultController, AsyncValue<List<SessionScoreSummary>>>(
  (Ref ref) {
    return QuizResultController(
      buildSessionScoreSummariesUseCase:
          ref.watch(buildSessionScoreSummariesUseCaseProvider),
      determineWinnerUseCase: ref.watch(determineWinnerUseCaseProvider),
    );
  },
);

class QuizResultController
    extends StateNotifier<AsyncValue<List<SessionScoreSummary>>> {
  QuizResultController({
    required BuildSessionScoreSummariesUseCase buildSessionScoreSummariesUseCase,
    required DetermineWinnerUseCase determineWinnerUseCase,
  })  : _buildSessionScoreSummariesUseCase = buildSessionScoreSummariesUseCase,
        _determineWinnerUseCase = determineWinnerUseCase,
        super(const AsyncValue<List<SessionScoreSummary>>.data(<SessionScoreSummary>[]));

  final BuildSessionScoreSummariesUseCase _buildSessionScoreSummariesUseCase;
  final DetermineWinnerUseCase _determineWinnerUseCase;

  Future<List<SessionScoreSummary>> buildSummaries({
    required String sessionId,
    required GameSession session,
    required Map<String, int> teamScores,
    required Map<String, int> correctAnswersCountByTeam,
    required Map<String, int> wrongAnswersCountByTeam,
    required Map<String, int> unansweredCellsCountByTeam,
  }) async {
    state = const AsyncValue<List<SessionScoreSummary>>.loading();

    try {
      final List<SessionScoreSummary> summaries =
          await _buildSessionScoreSummariesUseCase(
        sessionId: sessionId,
        session: session,
        teamScores: teamScores,
        correctAnswersCountByTeam: correctAnswersCountByTeam,
        wrongAnswersCountByTeam: wrongAnswersCountByTeam,
        unansweredCellsCountByTeam: unansweredCellsCountByTeam,
      );

      state = AsyncValue<List<SessionScoreSummary>>.data(summaries);
      return summaries;
    } catch (error, stackTrace) {
      state = AsyncValue<List<SessionScoreSummary>>.error(error, stackTrace);
      rethrow;
    }
  }

  String? determineWinner(List<SessionScoreSummary> summaries) {
    return _determineWinnerUseCase(summaries);
  }

  void setSummaries(List<SessionScoreSummary> summaries) {
    state = AsyncValue<List<SessionScoreSummary>>.data(summaries);
  }

  void clear() {
    state = const AsyncValue<List<SessionScoreSummary>>.data(<SessionScoreSummary>[]);
  }
}