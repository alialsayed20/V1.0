import '../entities/game_session.dart';
import '../entities/helper_usage.dart';
import '../entities/question_round.dart';
import '../enums/helper_type.dart';

abstract class HelperEngine {
  const HelperEngine();

  bool canUseHelper({
    required HelperUsage usage,
    required HelperType helperType,
    required QuestionRound? currentRound,
  });

  HelperUsage markHelperAsUsed({
    required HelperUsage usage,
    required HelperType helperType,
  });

  GameSession excludeTeamFromNextTurn({
    required GameSession session,
    required String teamId,
  });

  QuestionRound activateBlockSteal({
    required QuestionRound round,
  });

  QuestionRound stealQuestion({
    required QuestionRound round,
    required String stealingTeamId,
  });

  QuestionRound blockTeamAnswer({
    required QuestionRound round,
    required String teamId,
  });

  int applyDoublePoints({
    required int basePoints,
  });
}