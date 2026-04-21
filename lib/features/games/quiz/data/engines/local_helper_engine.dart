import '../../domain/entities/game_session.dart';
import '../../domain/entities/helper_usage.dart';
import '../../domain/entities/question_round.dart';
import '../../domain/entities/team.dart';
import '../../domain/engines/helper_engine.dart';
import '../../domain/enums/helper_type.dart';
import '../../domain/enums/question_round_status.dart';
import '../../domain/enums/team_state.dart';

class LocalHelperEngine implements HelperEngine {
  const LocalHelperEngine();

  @override
  bool canUseHelper({
    required HelperUsage usage,
    required HelperType helperType,
    required QuestionRound? currentRound,
  }) {
    if (usage.hasUsed(helperType)) {
      return false;
    }

    switch (helperType) {
      case HelperType.eliminateOpponent:
      case HelperType.doublePoints:
        return true;

      case HelperType.blockSteal:
        return currentRound != null &&
            currentRound.status == QuestionRoundStatus.answering &&
            !currentRound.isStealBlocked;

      case HelperType.stealQuestion:
        return currentRound != null &&
            currentRound.status == QuestionRoundStatus.answering &&
            !currentRound.isStealBlocked &&
            currentRound.stealingTeamId == null;

      case HelperType.blockAnswer:
        return currentRound != null &&
            currentRound.status == QuestionRoundStatus.answering;
    }
  }

  @override
  HelperUsage markHelperAsUsed({
    required HelperUsage usage,
    required HelperType helperType,
  }) {
    if (usage.usedHelpers.contains(helperType)) {
      return usage;
    }

    return usage.copyWith(
      usedHelpers: <HelperType>[
        ...usage.usedHelpers,
        helperType,
      ],
    );
  }

  @override
  GameSession excludeTeamFromNextTurn({
    required GameSession session,
    required String teamId,
  }) {
    final List<Team> updatedTeams = session.teams.map((Team team) {
      if (team.id != teamId) {
        return team;
      }

      return team.copyWith(
        state: TeamState.blockedNextTurn,
      );
    }).toList();

    return session.copyWith(teams: updatedTeams);
  }

  @override
  QuestionRound activateBlockSteal({
    required QuestionRound round,
  }) {
    return round.copyWith(
      isStealBlocked: true,
    );
  }

  @override
  QuestionRound stealQuestion({
    required QuestionRound round,
    required String stealingTeamId,
  }) {
    return round.copyWith(
      stealingTeamId: stealingTeamId,
    );
  }

  @override
  QuestionRound blockTeamAnswer({
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
  int applyDoublePoints({
    required int basePoints,
  }) {
    return basePoints * 2;
  }
}