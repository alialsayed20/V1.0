import '../../domain/entities/session_score_summary.dart';
import '../../domain/engines/result_engine.dart';

class DetermineWinnerUseCase {
  const DetermineWinnerUseCase({
    required ResultEngine resultEngine,
  }) : _resultEngine = resultEngine;

  final ResultEngine _resultEngine;

  String? call(List<SessionScoreSummary> summaries) {
    return _resultEngine.determineWinnerTeamId(
      summaries: summaries,
    );
  }
}