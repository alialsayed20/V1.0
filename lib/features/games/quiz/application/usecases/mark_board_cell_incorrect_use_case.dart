import '../../domain/entities/board.dart';
import '../../domain/engines/board_engine.dart';
import '../../domain/repositories/board_repository.dart';

class MarkBoardCellIncorrectUseCase {
  const MarkBoardCellIncorrectUseCase({
    required BoardRepository boardRepository,
    required BoardEngine boardEngine,
  })  : _boardRepository = boardRepository,
        _boardEngine = boardEngine;

  final BoardRepository _boardRepository;
  final BoardEngine _boardEngine;

  Future<Board> call({
    required String sessionId,
    required Board board,
    required String cellId,
  }) async {
    final Board updatedBoard = _boardEngine.markCellAsAnsweredIncorrectly(
      board: board,
      cellId: cellId,
    );

    await _boardRepository.saveBoard(
      sessionId: sessionId,
      board: updatedBoard,
    );

    return updatedBoard;
  }
}