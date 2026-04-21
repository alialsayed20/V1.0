import '../../domain/entities/game_session.dart';
import '../../domain/entities/team.dart';
import '../../domain/engines/turn_engine.dart';
import '../../domain/enums/team_state.dart';

class LocalTurnEngine implements TurnEngine {
  const LocalTurnEngine();

  @override
  String getCurrentTurnTeamId(GameSession session) {
    return session.currentTurnTeamId;
  }

  @override
  String getNextTurnTeamId(GameSession session) {
    final List<String> eligibleOrder = getEligibleTurnOrder(session);

    if (eligibleOrder.isEmpty) {
      return '';
    }

    final int currentIndex = eligibleOrder.indexOf(session.currentTurnTeamId);

    if (currentIndex == -1) {
      return eligibleOrder.first;
    }

    final int nextIndex = (currentIndex + 1) % eligibleOrder.length;
    return eligibleOrder[nextIndex];
  }

  @override
  GameSession advanceTurn(GameSession session) {
    final String nextTurnTeamId = getNextTurnTeamId(session);

    final List<Team> updatedTeams = session.teams.map((Team team) {
      if (team.state == TeamState.blockedNextTurn &&
          team.id == session.currentTurnTeamId) {
        return team.copyWith(state: TeamState.active);
      }

      return team;
    }).toList();

    return session.copyWith(
      teams: updatedTeams,
      currentTurnTeamId: nextTurnTeamId,
    );
  }

  @override
  List<String> getEligibleTurnOrder(GameSession session) {
    final Map<String, Team> teamsById = <String, Team>{
      for (final Team team in session.teams) team.id: team,
    };

    return session.turnOrder.where((String teamId) {
      final Team? team = teamsById[teamId];

      if (team == null) {
        return false;
      }

      return team.state != TeamState.eliminated &&
          team.state != TeamState.blockedNextTurn;
    }).toList();
  }
}