import '../../domain/entities/question_round.dart';
import '../../domain/repositories/question_round_repository.dart';

class GetActiveQuestionRoundUseCase {
  const GetActiveQuestionRoundUseCase({
    required QuestionRoundRepository questionRoundRepository,
  }) : _questionRoundRepository = questionRoundRepository;

  final QuestionRoundRepository _questionRoundRepository;

  Future<QuestionRound?> call(String sessionId) {
    return _questionRoundRepository.getActiveRoundBySessionId(sessionId);
  }
}