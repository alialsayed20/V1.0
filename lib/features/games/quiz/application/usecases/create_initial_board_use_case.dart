import '../../domain/entities/board.dart';
import '../../domain/entities/board_cell.dart';
import '../../domain/repositories/board_repository.dart';
import '../../domain/enums/board_cell_state.dart';

class CreateInitialBoardUseCase {
  const CreateInitialBoardUseCase({
    required BoardRepository boardRepository,
  }) : _boardRepository = boardRepository;

  final BoardRepository _boardRepository;

  static const List<int> _defaultPoints = <int>[10, 25, 50, 100];

  Future<Board> call({
    required String sessionId,
    required List<String> categoryIds,
  }) async {
    final List<BoardCell> cells = <BoardCell>[];

    for (final String categoryId in categoryIds) {
      for (final int points in _defaultPoints) {
        cells.add(
          BoardCell(
            id: '${categoryId}_$points',
            categoryId: categoryId,
            points: points,
            state: BoardCellState.available,
            winningTeamId: null,
          ),
        );
      }
    }

    final Board board = Board(cells: cells);

    await _boardRepository.saveBoard(
      sessionId: sessionId,
      board: board,
    );

    return board;
  }
}