import '../enums/board_cell_state.dart';
import 'board_cell.dart';

class Board {
  const Board({
    required this.cells,
  });

  final List<BoardCell> cells;

  int get totalCells => cells.length;

  int get usedCells => cells
      .where((BoardCell cell) => cell.state != BoardCellState.available)
      .length;

  int get remainingCells => totalCells - usedCells;

  Board copyWith({
    List<BoardCell>? cells,
  }) {
    return Board(
      cells: cells ?? this.cells,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Board && _listEquals(other.cells, cells);
  }

  @override
  int get hashCode => Object.hashAll(cells);
}

bool _listEquals<T>(List<T> a, List<T> b) {
  if (identical(a, b)) {
    return true;
  }

  if (a.length != b.length) {
    return false;
  }

  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) {
      return false;
    }
  }

  return true;
}