import '../entities/game_session.dart';

abstract class TurnEngine {
  const TurnEngine();

  String getCurrentTurnTeamId(GameSession session);

  String getNextTurnTeamId(GameSession session);

  GameSession advanceTurn(GameSession session);

  List<String> getEligibleTurnOrder(GameSession session);
}