import 'package:isar/isar.dart';

import '../../domain/entities/game_session.dart';
import '../../domain/repositories/session_repository.dart';
import '../mappers/game_session_isar_mapper.dart';
import '../models/isar_game_session_model.dart';

class LocalSessionRepository implements SessionRepository {
  LocalSessionRepository({
    required Isar isar,
    required GameSessionIsarMapper mapper,
  })  : _isar = isar,
        _mapper = mapper;

  final Isar _isar;
  final GameSessionIsarMapper _mapper;

  @override
  Future<GameSession?> getActiveSession() async {
    final IsarGameSessionModel? model =
        await _isar.isarGameSessionModels.where().findFirst();

    if (model == null) {
      return null;
    }

    return _mapper.toDomain(model);
  }

  @override
  Future<void> saveSession(GameSession session) async {
    final IsarGameSessionModel model = _mapper.toIsar(session);

    final IsarGameSessionModel? existing =
        await _isar.isarGameSessionModels
            .filter()
            .sessionIdEqualTo(session.id)
            .findFirst();

    if (existing != null) {
      model.isarId = existing.isarId;
    }

    await _isar.writeTxn(() async {
      await _isar.isarGameSessionModels.put(model);
    });
  }

  @override
  Future<void> deleteSession(String sessionId) async {
    final IsarGameSessionModel? existing =
        await _isar.isarGameSessionModels
            .filter()
            .sessionIdEqualTo(sessionId)
            .findFirst();

    if (existing == null) {
      return;
    }

    await _isar.writeTxn(() async {
      await _isar.isarGameSessionModels.delete(existing.isarId);
    });
  }
}