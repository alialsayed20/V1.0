import '../../domain/entities/board.dart';
import '../../domain/entities/board_cell.dart';
import '../../domain/enums/board_cell_state.dart';
import '../models/isar_board_model.dart';

class BoardIsarMapper {
  const BoardIsarMapper();

  IsarBoardModel toIsar({
    required String sessionId,
    required Board board,
  }) {
    return IsarBoardModel()
      ..sessionId = sessionId
      ..cells = board.cells.map(_cellToIsar).toList();
  }

  Board toDomain(IsarBoardModel model) {
    return Board(
      cells: model.cells.map(_cellToDomain).toList(),
    );
  }

  IsarBoardCellModel _cellToIsar(BoardCell cell) {
    return IsarBoardCellModel()
      ..id = cell.id
      ..categoryId = cell.categoryId
      ..points = cell.points
      ..state = _boardCellStateToString(cell.state)
      ..winningTeamId = cell.winningTeamId;
  }

  BoardCell _cellToDomain(IsarBoardCellModel model) {
    return BoardCell(
      id: model.id,
      categoryId: model.categoryId,
      points: model.points,
      state: _boardCellStateFromString(model.state),
      winningTeamId: model.winningTeamId,
    );
  }

  String _boardCellStateToString(BoardCellState state) {
    return state.name;
  }

  BoardCellState _boardCellStateFromString(String value) {
    return BoardCellState.values.firstWhere(
      (e) => e.name == value,
      orElse: () => BoardCellState.available,
    );
  }
}