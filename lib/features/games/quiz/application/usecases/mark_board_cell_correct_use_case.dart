import '../../domain/entities/board.dart';
import '../../domain/engines/board_engine.dart';
import '../../domain/repositories/board_repository.dart';

class MarkBoardCellCorrectUseCase {
  const MarkBoardCellCorrectUseCase({
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
    required String winningTeamId,
  }) async {
    final Board updatedBoard = _boardEngine.markCellAsAnsweredCorrectly(
      board: board,
      cellId: cellId,
      winningTeamId: winningTeamId,
    );

    await _boardRepository.saveBoard(
      sessionId: sessionId,
      board: updatedBoard,
    );

    return updatedBoard;
  }
}