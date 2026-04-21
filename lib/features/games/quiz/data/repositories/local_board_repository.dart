import 'package:isar/isar.dart';

import '../../domain/entities/board.dart';
import '../../domain/repositories/board_repository.dart';
import '../mappers/board_isar_mapper.dart';
import '../models/isar_board_model.dart';

class LocalBoardRepository implements BoardRepository {
  LocalBoardRepository({
    required Isar isar,
    required BoardIsarMapper mapper,
  })  : _isar = isar,
        _mapper = mapper;

  final Isar _isar;
  final BoardIsarMapper _mapper;

  @override
  Future<Board?> getBoardBySessionId(String sessionId) async {
    final IsarBoardModel? model = await _isar.isarBoardModels
        .filter()
        .sessionIdEqualTo(sessionId)
        .findFirst();

    if (model == null) {
      return null;
    }

    return _mapper.toDomain(model);
  }

  @override
  Future<void> saveBoard({
    required String sessionId,
    required Board board,
  }) async {
    final IsarBoardModel model = _mapper.toIsar(
      sessionId: sessionId,
      board: board,
    );

    final IsarBoardModel? existing = await _isar.isarBoardModels
        .filter()
        .sessionIdEqualTo(sessionId)
        .findFirst();

    if (existing != null) {
      model.isarId = existing.isarId;
    }

    await _isar.writeTxn(() async {
      await _isar.isarBoardModels.put(model);
    });
  }

  @override
  Future<void> deleteBoard(String sessionId) async {
    final IsarBoardModel? existing = await _isar.isarBoardModels
        .filter()
        .sessionIdEqualTo(sessionId)
        .findFirst();

    if (existing == null) {
      return;
    }

    await _isar.writeTxn(() async {
      await _isar.isarBoardModels.delete(existing.isarId);
    });
  }
}