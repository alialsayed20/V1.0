import '../entities/board.dart';
import '../entities/board_cell.dart';

abstract class BoardEngine {
  const BoardEngine();

  BoardCell getCellById({
    required Board board,
    required String cellId,
  });

  bool canSelectCell({
    required Board board,
    required String cellId,
  });

  Board markCellAsAnsweredCorrectly({
    required Board board,
    required String cellId,
    required String winningTeamId,
  });

  Board markCellAsAnsweredIncorrectly({
    required Board board,
    required String cellId,
  });

  bool isBoardCompleted({
    required Board board,
  });
}