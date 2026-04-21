import '../../domain/entities/game_session.dart';
import '../../domain/entities/session_score_summary.dart';
import '../../domain/entities/team.dart';
import '../../domain/engines/result_engine.dart';
import '../../domain/enums/team_state.dart';

class LocalResultEngine implements ResultEngine {
  const LocalResultEngine();

  @override
  int calculateAwardedPoints({
    required int basePoints,
    required bool isDoublePointsActive,
  }) {
    return isDoublePointsActive ? basePoints * 2 : basePoints;
  }

  @override
  int calculatePenaltyDeduction({
    required int questionPoints,
  }) {
    return questionPoints;
  }

  @override
  List<SessionScoreSummary> buildSessionScoreSummaries({
    required GameSession session,
    required Map<String, int> teamScores,
    required Map<String, int> correctAnswersCountByTeam,
    required Map<String, int> wrongAnswersCountByTeam,
    required Map<String, int> unansweredCellsCountByTeam,
  }) {
    final String? winnerTeamId = determineWinnerTeamId(
      summaries: session.teams.map((Team team) {
        return SessionScoreSummary(
          teamId: team.id,
          score: teamScores[team.id] ?? 0,
          correctAnswersCount: correctAnswersCountByTeam[team.id] ?? 0,
          wrongAnswersCount: wrongAnswersCountByTeam[team.id] ?? 0,
          unansweredCellsCount: unansweredCellsCountByTeam[team.id] ?? 0,
          isWinner: false,
        );
      }).toList(),
    );

    return session.teams.map((Team team) {
      return SessionScoreSummary(
        teamId: team.id,
        score: teamScores[team.id] ?? 0,
        correctAnswersCount: correctAnswersCountByTeam[team.id] ?? 0,
        wrongAnswersCount: wrongAnswersCountByTeam[team.id] ?? 0,
        unansweredCellsCount: unansweredCellsCountByTeam[team.id] ?? 0,
        isWinner: team.id == winnerTeamId,
      );
    }).toList();
  }

  @override
  String? determineWinnerTeamId({
    required List<SessionScoreSummary> summaries,
  }) {
    if (summaries.isEmpty) {
      return null;
    }

    SessionScoreSummary currentWinner = summaries.first;

    for (final SessionScoreSummary summary in summaries.skip(1)) {
      if (summary.score > currentWinner.score) {
        currentWinner = summary;
      }
    }

    return currentWinner.teamId;
  }

  @override
  bool shouldEndSessionEarly({
    required GameSession session,
  }) {
    final int activeTeamsCount = session.teams.where((Team team) {
      return team.state != TeamState.eliminated;
    }).length;

    return activeTeamsCount <= 1;
  }
}