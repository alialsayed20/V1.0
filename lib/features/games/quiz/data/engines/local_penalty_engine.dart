import '../../domain/entities/game_session.dart';
import '../../domain/entities/penalty_state.dart';
import '../../domain/entities/question_round.dart';
import '../../domain/entities/team.dart';
import '../../domain/engines/penalty_engine.dart';
import '../../domain/enums/team_state.dart';

class LocalPenaltyEngine implements PenaltyEngine {
  const LocalPenaltyEngine();

  @override
  PenaltyState applyEarlyAnswerPenalty({
    required PenaltyState penaltyState,
  }) {
    return penaltyState.copyWith(
      isBlockedFromCurrentQuestion: true,
    );
  }

  @override
  PenaltyState applyCheatingPenalty({
    required PenaltyState penaltyState,
    required int questionPoints,
  }) {
    final int nextYellowCount = penaltyState.yellowCardCount + 1;

    if (nextYellowCount >= 2) {
      return penaltyState.copyWith(
        yellowCardCount: nextYellowCount,
        redCardCount: penaltyState.redCardCount + 1,
        isBlockedFromCurrentQuestion: true,
        isEliminated: true,
      );
    }

    return penaltyState.copyWith(
      yellowCardCount: nextYellowCount,
      isBlockedFromCurrentQuestion: true,
    );
  }

  @override
  QuestionRound blockTeamForCurrentQuestion({
    required QuestionRound round,
    required String teamId,
  }) {
    if (round.blockedTeamIds.contains(teamId)) {
      return round;
    }

    return round.copyWith(
      blockedTeamIds: <String>[
        ...round.blockedTeamIds,
        teamId,
      ],
    );
  }

  @override
  GameSession eliminateTeam({
    required GameSession session,
    required String teamId,
  }) {
    final List<Team> updatedTeams = session.teams.map((Team team) {
      if (team.id != teamId) {
        return team;
      }

      return team.copyWith(
        state: TeamState.eliminated,
      );
    }).toList();

    final String nextCurrentTurnTeamId =
        session.currentTurnTeamId == teamId ? '' : session.currentTurnTeamId;

    return session.copyWith(
      teams: updatedTeams,
      currentTurnTeamId: nextCurrentTurnTeamId,
    );
  }

  @override
  bool shouldEndSessionAfterElimination({
    required GameSession session,
  }) {
    final int activeTeamsCount = session.teams.where((Team team) {
      return team.state != TeamState.eliminated;
    }).length;

    return activeTeamsCount <= 1;
  }
}