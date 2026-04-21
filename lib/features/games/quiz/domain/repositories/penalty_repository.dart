import '../entities/penalty_state.dart';

abstract class PenaltyRepository {
  const PenaltyRepository();

  Future<List<PenaltyState>> getPenaltyStatesBySessionId(String sessionId);

  Future<void> savePenaltyState({
    required String sessionId,
    required PenaltyState penaltyState,
  });

  Future<void> deletePenaltyStatesBySessionId(String sessionId);
}