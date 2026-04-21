import '../../domain/entities/question_round.dart';
import '../../domain/enums/question_round_status.dart';
import '../models/isar_question_round_model.dart';

class QuestionRoundIsarMapper {
  const QuestionRoundIsarMapper();

  // ========= Domain -> Isar =========

  IsarQuestionRoundModel toIsar({
    required String sessionId,
    required QuestionRound round,
  }) {
    return IsarQuestionRoundModel()
      ..sessionId = sessionId
      ..questionId = round.questionId
      ..boardCellId = round.boardCellId
      ..status = _statusToString(round.status)
      ..answerOrder = List<String>.from(round.answerOrder)
      ..blockedTeamIds = List<String>.from(round.blockedTeamIds)
      ..isStealBlocked = round.isStealBlocked
      ..stealingTeamId = round.stealingTeamId
      ..winningTeamId = round.winningTeamId;
  }

  // ========= Isar -> Domain =========

  QuestionRound toDomain(IsarQuestionRoundModel model) {
    return QuestionRound(
      questionId: model.questionId,
      boardCellId: model.boardCellId,
      status: _statusFromString(model.status),
      answerOrder: List<String>.from(model.answerOrder),
      blockedTeamIds: List<String>.from(model.blockedTeamIds),
      isStealBlocked: model.isStealBlocked,
      stealingTeamId: model.stealingTeamId,
      winningTeamId: model.winningTeamId,
    );
  }

  // ========= Enum Mapping =========

  String _statusToString(QuestionRoundStatus status) {
    return status.name;
  }

  QuestionRoundStatus _statusFromString(String value) {
    return QuestionRoundStatus.values.firstWhere(
      (e) => e.name == value,
      orElse: () => QuestionRoundStatus.idle,
    );
  }
}