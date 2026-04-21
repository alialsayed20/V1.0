import '../entities/board.dart';

abstract class BoardRepository {
  const BoardRepository();

  Future<Board?> getBoardBySessionId(String sessionId);

  Future<void> saveBoard({
    required String sessionId,
    required Board board,
  });

  Future<void> deleteBoard(String sessionId);
}