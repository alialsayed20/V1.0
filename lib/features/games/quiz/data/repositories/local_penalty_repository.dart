import 'package:isar/isar.dart';

import '../../domain/entities/penalty_state.dart';
import '../../domain/repositories/penalty_repository.dart';
import '../mappers/penalty_state_isar_mapper.dart';
import '../models/isar_penalty_state_model.dart';

class LocalPenaltyRepository implements PenaltyRepository {
  LocalPenaltyRepository({
    required Isar isar,
    required PenaltyStateIsarMapper mapper,
  })  : _isar = isar,
        _mapper = mapper;

  final Isar _isar;
  final PenaltyStateIsarMapper _mapper;

  @override
  Future<List<PenaltyState>> getPenaltyStatesBySessionId(
    String sessionId,
  ) async {
    final List<IsarPenaltyStateModel> models =
        await _isar.isarPenaltyStateModels
            .filter()
            .sessionIdEqualTo(sessionId)
            .findAll();

    return models.map(_mapper.toDomain).toList();
  }

@override
Future<void> savePenaltyState({
  required String sessionId,
  required PenaltyState penaltyState,
}) async {
  final IsarPenaltyStateModel model = _mapper.toIsar(
    sessionId: sessionId,
    state: penaltyState,
  );

  final IsarPenaltyStateModel? existing =
      await _isar.isarPenaltyStateModels
          .filter()
          .sessionIdEqualTo(sessionId)
          .and()
          .teamIdEqualTo(penaltyState.teamId)
          .findFirst();

  if (existing != null) {
    model.isarId = existing.isarId;
  }

  await _isar.writeTxn(() async {
    await _isar.isarPenaltyStateModels.put(model);
  });
}

  @override
  Future<void> deletePenaltyStatesBySessionId(String sessionId) async {
    final List<IsarPenaltyStateModel> models =
        await _isar.isarPenaltyStateModels
            .filter()
            .sessionIdEqualTo(sessionId)
            .findAll();

    if (models.isEmpty) {
      return;
    }

    final List<Id> ids =
        models.map((IsarPenaltyStateModel e) => e.isarId).toList();

    await _isar.writeTxn(() async {
      await _isar.isarPenaltyStateModels.deleteAll(ids);
    });
  }
}