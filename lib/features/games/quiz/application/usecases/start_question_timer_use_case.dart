import '../../domain/entities/question_round.dart';
import '../../domain/engines/question_engine.dart';
import '../../domain/repositories/question_round_repository.dart';

class StartQuestionTimerUseCase {
  const StartQuestionTimerUseCase({
    required QuestionRoundRepository questionRoundRepository,
    required QuestionEngine questionEngine,
  })  : _questionRoundRepository = questionRoundRepository,
        _questionEngine = questionEngine;

  final QuestionRoundRepository _questionRoundRepository;
  final QuestionEngine _questionEngine;

  Future<QuestionRound> call({
    required String sessionId,
    required QuestionRound round,
  }) async {
    final QuestionRound updatedRound = _questionEngine.startTimer(round);

    await _questionRoundRepository.saveRound(
      sessionId: sessionId,
      round: updatedRound,
    );

    return updatedRound;
  }
}