import 'package:isar/isar.dart';

import '../../domain/entities/helper_usage.dart';
import '../../domain/repositories/helper_usage_repository.dart';
import '../mappers/helper_usage_isar_mapper.dart';
import '../models/isar_helper_usage_model.dart';

class LocalHelperUsageRepository implements HelperUsageRepository {
  LocalHelperUsageRepository({
    required Isar isar,
    required HelperUsageIsarMapper mapper,
  })  : _isar = isar,
        _mapper = mapper;

  final Isar _isar;
  final HelperUsageIsarMapper _mapper;

  @override
  Future<List<HelperUsage>> getHelperUsagesBySessionId(String sessionId) async {
    final List<IsarHelperUsageModel> models = await _isar.isarHelperUsageModels
        .filter()
        .sessionIdEqualTo(sessionId)
        .findAll();

    return models.map(_mapper.toDomain).toList();
  }

  @override
  Future<void> saveHelperUsage({
    required String sessionId,
    required HelperUsage usage,
  }) async {
    final IsarHelperUsageModel model = _mapper.toIsar(
      sessionId: sessionId,
      usage: usage,
    );

    final IsarHelperUsageModel? existing = await _isar.isarHelperUsageModels
        .filter()
        .sessionIdEqualTo(sessionId)
        .and()
        .teamIdEqualTo(usage.teamId)
        .findFirst();

    if (existing != null) {
      model.isarId = existing.isarId;
    }

    await _isar.writeTxn(() async {
      await _isar.isarHelperUsageModels.put(model);
    });
  }

  @override
  Future<void> deleteHelperUsagesBySessionId(String sessionId) async {
    final List<IsarHelperUsageModel> models = await _isar.isarHelperUsageModels
        .filter()
        .sessionIdEqualTo(sessionId)
        .findAll();

    if (models.isEmpty) {
      return;
    }

    final List<Id> ids = models.map((IsarHelperUsageModel e) => e.isarId).toList();

    await _isar.writeTxn(() async {
      await _isar.isarHelperUsageModels.deleteAll(ids);
    });
  }
}