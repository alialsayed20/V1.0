import '../../domain/entities/game_session.dart';
import '../../domain/entities/session_score_summary.dart';
import '../../domain/engines/result_engine.dart';
import '../../domain/repositories/score_repository.dart';

class BuildSessionScoreSummariesUseCase {
  const BuildSessionScoreSummariesUseCase({
    required ResultEngine resultEngine,
    required ScoreRepository scoreRepository,
  })  : _resultEngine = resultEngine,
        _scoreRepository = scoreRepository;

  final ResultEngine _resultEngine;
  final ScoreRepository _scoreRepository;

  Future<List<SessionScoreSummary>> call({
    required String sessionId,
    required GameSession session,
    required Map<String, int> teamScores,
    required Map<String, int> correctAnswersCountByTeam,
    required Map<String, int> wrongAnswersCountByTeam,
    required Map<String, int> unansweredCellsCountByTeam,
  }) async {
    final List<SessionScoreSummary> summaries =
        _resultEngine.buildSessionScoreSummaries(
      session: session,
      teamScores: teamScores,
      correctAnswersCountByTeam: correctAnswersCountByTeam,
      wrongAnswersCountByTeam: wrongAnswersCountByTeam,
      unansweredCellsCountByTeam: unansweredCellsCountByTeam,
    );

    for (final SessionScoreSummary summary in summaries) {
      await _scoreRepository.saveScoreSummary(
        sessionId: sessionId,
        summary: summary,
      );
    }

    return summaries;
  }
}