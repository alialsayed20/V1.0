import '../entities/question_round.dart';

abstract class QuestionRoundRepository {
  const QuestionRoundRepository();

  Future<QuestionRound?> getActiveRoundBySessionId(String sessionId);

  Future<void> saveRound({
    required String sessionId,
    required QuestionRound round,
  });

  Future<void> deleteRoundBySessionId(String sessionId);
}