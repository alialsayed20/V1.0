import '../entities/game_session.dart';
import '../entities/penalty_state.dart';
import '../entities/question_round.dart';

abstract class PenaltyEngine {
  const PenaltyEngine();

  PenaltyState applyEarlyAnswerPenalty({
    required PenaltyState penaltyState,
  });

  PenaltyState applyCheatingPenalty({
    required PenaltyState penaltyState,
    required int questionPoints,
  });

  QuestionRound blockTeamForCurrentQuestion({
    required QuestionRound round,
    required String teamId,
  });

  GameSession eliminateTeam({
    required GameSession session,
    required String teamId,
  });

  bool shouldEndSessionAfterElimination({
    required GameSession session,
  });
}