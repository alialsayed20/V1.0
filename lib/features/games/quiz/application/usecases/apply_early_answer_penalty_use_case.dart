import '../../domain/entities/penalty_state.dart';
import '../../domain/entities/question_round.dart';
import '../../domain/engines/penalty_engine.dart';
import '../../domain/repositories/penalty_repository.dart';
import '../../domain/repositories/question_round_repository.dart';

class ApplyEarlyAnswerPenaltyUseCase {
  const ApplyEarlyAnswerPenaltyUseCase({
    required PenaltyRepository penaltyRepository,
    required QuestionRoundRepository questionRoundRepository,
    required PenaltyEngine penaltyEngine,
  })  : _penaltyRepository = penaltyRepository,
        _questionRoundRepository = questionRoundRepository,
        _penaltyEngine = penaltyEngine;

  final PenaltyRepository _penaltyRepository;
  final QuestionRoundRepository _questionRoundRepository;
  final PenaltyEngine _penaltyEngine;

  Future<ApplyEarlyAnswerPenaltyResult> call({
    required String sessionId,
    required PenaltyState penaltyState,
    required QuestionRound round,
    required String teamId,
  }) async {
    final PenaltyState updatedPenaltyState =
        _penaltyEngine.applyEarlyAnswerPenalty(
      penaltyState: penaltyState,
    );

    final QuestionRound updatedRound =
        _penaltyEngine.blockTeamForCurrentQuestion(
      round: round,
      teamId: teamId,
    );

    await _penaltyRepository.savePenaltyState(
      sessionId: sessionId,
      penaltyState: updatedPenaltyState,
    );

    await _questionRoundRepository.saveRound(
      sessionId: sessionId,
      round: updatedRound,
    );

    return ApplyEarlyAnswerPenaltyResult(
      penaltyState: updatedPenaltyState,
      round: updatedRound,
    );
  }
}

class ApplyEarlyAnswerPenaltyResult {
  const ApplyEarlyAnswerPenaltyResult({
    required this.penaltyState,
    required this.round,
  });

  final PenaltyState penaltyState;
  final QuestionRound round;
}