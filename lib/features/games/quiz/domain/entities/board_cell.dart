import '../enums/board_cell_state.dart';

class BoardCell {
  const BoardCell({
    required this.id,
    required this.categoryId,
    required this.points,
    required this.state,
    required this.winningTeamId,
  });

  final String id;
  final String categoryId;
  final int points;
  final BoardCellState state;
  final String? winningTeamId;

  bool get isAvailable => state == BoardCellState.available;

  BoardCell copyWith({
    String? id,
    String? categoryId,
    int? points,
    BoardCellState? state,
    String? winningTeamId,
    bool clearWinningTeamId = false,
  }) {
    return BoardCell(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      points: points ?? this.points,
      state: state ?? this.state,
      winningTeamId:
          clearWinningTeamId ? null : (winningTeamId ?? this.winningTeamId),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is BoardCell &&
        other.id == id &&
        other.categoryId == categoryId &&
        other.points == points &&
        other.state == state &&
        other.winningTeamId == winningTeamId;
  }

  @override
  int get hashCode => Object.hash(
        id,
        categoryId,
        points,
        state,
        winningTeamId,
      );
}