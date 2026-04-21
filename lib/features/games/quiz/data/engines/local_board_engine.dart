import '../../domain/entities/board.dart';
import '../../domain/entities/board_cell.dart';
import '../../domain/engines/board_engine.dart';
import '../../domain/enums/board_cell_state.dart';

class LocalBoardEngine implements BoardEngine {
  const LocalBoardEngine();

  @override
  BoardCell getCellById({
    required Board board,
    required String cellId,
  }) {
    return board.cells.firstWhere(
      (BoardCell cell) => cell.id == cellId,
    );
  }

  @override
  bool canSelectCell({
    required Board board,
    required String cellId,
  }) {
    final BoardCell cell = getCellById(
      board: board,
      cellId: cellId,
    );

    return cell.state == BoardCellState.available;
  }

  @override
  Board markCellAsAnsweredCorrectly({
    required Board board,
    required String cellId,
    required String winningTeamId,
  }) {
    final List<BoardCell> updatedCells = board.cells.map((BoardCell cell) {
      if (cell.id != cellId) {
        return cell;
      }

      return cell.copyWith(
        state: BoardCellState.answeredCorrectly,
        winningTeamId: winningTeamId,
      );
    }).toList();

    return board.copyWith(cells: updatedCells);
  }

  @override
  Board markCellAsAnsweredIncorrectly({
    required Board board,
    required String cellId,
  }) {
    final List<BoardCell> updatedCells = board.cells.map((BoardCell cell) {
      if (cell.id != cellId) {
        return cell;
      }

      return cell.copyWith(
        state: BoardCellState.answeredIncorrectly,
        clearWinningTeamId: true,
      );
    }).toList();

    return board.copyWith(cells: updatedCells);
  }

  @override
  bool isBoardCompleted({
    required Board board,
  }) {
    return board.cells.every(
      (BoardCell cell) => cell.state != BoardCellState.available,
    );
  }
}