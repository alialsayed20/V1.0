import '../entities/game_session.dart';
import '../entities/session_score_summary.dart';

abstract class ResultEngine {
  const ResultEngine();

  int calculateAwardedPoints({
    required int basePoints,
    required bool isDoublePointsActive,
  });

  int calculatePenaltyDeduction({
    required int questionPoints,
  });

  List<SessionScoreSummary> buildSessionScoreSummaries({
    required GameSession session,
    required Map<String, int> teamScores,
    required Map<String, int> correctAnswersCountByTeam,
    required Map<String, int> wrongAnswersCountByTeam,
    required Map<String, int> unansweredCellsCountByTeam,
  });

  String? determineWinnerTeamId({
    required List<SessionScoreSummary> summaries,
  });

  bool shouldEndSessionEarly({
    required GameSession session,
  });
}