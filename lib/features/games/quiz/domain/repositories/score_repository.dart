import '../entities/session_score_summary.dart';

abstract class ScoreRepository {
  const ScoreRepository();

  Future<List<SessionScoreSummary>> getScoresBySessionId(String sessionId);

  Future<void> saveScoreSummary({
    required String sessionId,
    required SessionScoreSummary summary,
  });

  Future<void> deleteScoresBySessionId(String sessionId);
}