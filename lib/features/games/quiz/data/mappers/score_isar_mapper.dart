import '../../domain/entities/session_score_summary.dart';
import '../models/isar_score_model.dart';

class ScoreIsarMapper {
  const ScoreIsarMapper();

  IsarScoreModel toIsar({
    required String sessionId,
    required SessionScoreSummary summary,
  }) {
    return IsarScoreModel()
      ..sessionId = sessionId
      ..teamId = summary.teamId
      ..score = summary.score
      ..correctAnswersCount = summary.correctAnswersCount
      ..wrongAnswersCount = summary.wrongAnswersCount
      ..unansweredCellsCount = summary.unansweredCellsCount
      ..isWinner = summary.isWinner;
  }

  SessionScoreSummary toDomain(IsarScoreModel model) {
    return SessionScoreSummary(
      teamId: model.teamId,
      score: model.score,
      correctAnswersCount: model.correctAnswersCount,
      wrongAnswersCount: model.wrongAnswersCount,
      unansweredCellsCount: model.unansweredCellsCount,
      isWinner: model.isWinner,
    );
  }
}