import '../../domain/entities/penalty_state.dart';
import '../models/isar_penalty_state_model.dart';

class PenaltyStateIsarMapper {
  const PenaltyStateIsarMapper();

  IsarPenaltyStateModel toIsar({
    required String sessionId,
    required PenaltyState state,
  }) {
    return IsarPenaltyStateModel()
      ..sessionId = sessionId
      ..teamId = state.teamId
      ..yellowCardCount = state.yellowCardCount
      ..redCardCount = state.redCardCount
      ..isBlockedFromCurrentQuestion = state.isBlockedFromCurrentQuestion
      ..isEliminated = state.isEliminated;
  }

  PenaltyState toDomain(IsarPenaltyStateModel model) {
    return PenaltyState(
      teamId: model.teamId,
      yellowCardCount: model.yellowCardCount,
      redCardCount: model.redCardCount,
      isBlockedFromCurrentQuestion: model.isBlockedFromCurrentQuestion,
      isEliminated: model.isEliminated,
    );
  }
}