import '../../domain/entities/game_session.dart';
import '../../domain/entities/penalty_state.dart';
import '../../domain/entities/question_round.dart';
import '../../domain/engines/penalty_engine.dart';
import '../../domain/repositories/penalty_repository.dart';
import '../../domain/repositories/question_round_repository.dart';
import '../../domain/repositories/session_repository.dart';

class ApplyCheatingPenaltyUseCase {
  const ApplyCheatingPenaltyUseCase({
    required PenaltyRepository penaltyRepository,
    required QuestionRoundRepository questionRoundRepository,
    required SessionRepository sessionRepository,
    required PenaltyEngine penaltyEngine,
  })  : _penaltyRepository = penaltyRepository,
        _questionRoundRepository = questionRoundRepository,
        _sessionRepository = sessionRepository,
        _penaltyEngine = penaltyEngine;

  final PenaltyRepository _penaltyRepository;
  final QuestionRoundRepository _questionRoundRepository;
  final SessionRepository _sessionRepository;
  final PenaltyEngine _penaltyEngine;

  Future<ApplyCheatingPenaltyResult> call({
    required String sessionId,
    required GameSession session,
    required PenaltyState penaltyState,
    required QuestionRound round,
    required String teamId,
    required int questionPoints,
  }) async {
    final PenaltyState updatedPenaltyState =
        _penaltyEngine.applyCheatingPenalty(
      penaltyState: penaltyState,
      questionPoints: questionPoints,
    );

    final QuestionRound updatedRound =
        _penaltyEngine.blockTeamForCurrentQuestion(
      round: round,
      teamId: teamId,
    );

    GameSession updatedSession = session;

    if (updatedPenaltyState.isEliminated) {
      updatedSession = _penaltyEngine.eliminateTeam(
        session: session,
        teamId: teamId,
      );

      await _sessionRepository.saveSession(updatedSession);
    }

    await _penaltyRepository.savePenaltyState(
      sessionId: sessionId,
      penaltyState: updatedPenaltyState,
    );

    await _questionRoundRepository.saveRound(
      sessionId: sessionId,
      round: updatedRound,
    );

    final bool shouldEndSession =
        _penaltyEngine.shouldEndSessionAfterElimination(
      session: updatedSession,
    );

    return ApplyCheatingPenaltyResult(
      penaltyState: updatedPenaltyState,
      round: updatedRound,
      session: updatedSession,
      shouldEndSession: shouldEndSession,
    );
  }
}

class ApplyCheatingPenaltyResult {
  const ApplyCheatingPenaltyResult({
    required this.penaltyState,
    required this.round,
    required this.session,
    required this.shouldEndSession,
  });

  final PenaltyState penaltyState;
  final QuestionRound round;
  final GameSession session;
  final bool shouldEndSession;
}