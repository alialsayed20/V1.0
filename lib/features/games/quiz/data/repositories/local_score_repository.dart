import 'package:isar/isar.dart';

import '../../domain/entities/session_score_summary.dart';
import '../../domain/repositories/score_repository.dart';
import '../mappers/score_isar_mapper.dart';
import '../models/isar_score_model.dart';

class LocalScoreRepository implements ScoreRepository {
  LocalScoreRepository({
    required Isar isar,
    required ScoreIsarMapper mapper,
  })  : _isar = isar,
        _mapper = mapper;

  final Isar _isar;
  final ScoreIsarMapper _mapper;

  @override
  Future<List<SessionScoreSummary>> getScoresBySessionId(
    String sessionId,
  ) async {
    final List<IsarScoreModel> models =
        await _isar.isarScoreModels
            .filter()
            .sessionIdEqualTo(sessionId)
            .findAll();

    return models.map(_mapper.toDomain).toList();
  }

  @override
  Future<void> saveScoreSummary({
    required String sessionId,
    required SessionScoreSummary summary,
  }) async {
    final IsarScoreModel model = _mapper.toIsar(
      sessionId: sessionId,
      summary: summary,
    );

    final IsarScoreModel? existing =
        await _isar.isarScoreModels
            .filter()
            .sessionIdEqualTo(sessionId)
            .and()
            .teamIdEqualTo(summary.teamId)
            .findFirst();

    if (existing != null) {
      model.isarId = existing.isarId;
    }

    await _isar.writeTxn(() async {
      await _isar.isarScoreModels.put(model);
    });
  }

  @override
  Future<void> deleteScoresBySessionId(String sessionId) async {
    final List<IsarScoreModel> models =
        await _isar.isarScoreModels
            .filter()
            .sessionIdEqualTo(sessionId)
            .findAll();

    if (models.isEmpty) {
      return;
    }

    final List<Id> ids =
        models.map((IsarScoreModel e) => e.isarId).toList();

    await _isar.writeTxn(() async {
      await _isar.isarScoreModels.deleteAll(ids);
    });
  }
}