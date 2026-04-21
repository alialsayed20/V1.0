import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/board.dart';
import '../providers/quiz_board_use_case_providers.dart';
import '../usecases/mark_board_cell_correct_use_case.dart';
import '../usecases/mark_board_cell_incorrect_use_case.dart';

final quizBoardControllerProvider =
    StateNotifierProvider<QuizBoardController, AsyncValue<Board?>>(
  (Ref ref) {
    return QuizBoardController(
      markBoardCellCorrectUseCase:
          ref.watch(markBoardCellCorrectUseCaseProvider),
      markBoardCellIncorrectUseCase:
          ref.watch(markBoardCellIncorrectUseCaseProvider),
    );
  },
);

class QuizBoardController extends StateNotifier<AsyncValue<Board?>> {
  QuizBoardController({
    required MarkBoardCellCorrectUseCase markBoardCellCorrectUseCase,
    required MarkBoardCellIncorrectUseCase markBoardCellIncorrectUseCase,
  })  : _markBoardCellCorrectUseCase = markBoardCellCorrectUseCase,
        _markBoardCellIncorrectUseCase = markBoardCellIncorrectUseCase,
        super(const AsyncValue<Board?>.data(null));

  final MarkBoardCellCorrectUseCase _markBoardCellCorrectUseCase;
  final MarkBoardCellIncorrectUseCase _markBoardCellIncorrectUseCase;

  Future<Board> markCellCorrect({
    required String sessionId,
    required Board board,
    required String cellId,
    required String winningTeamId,
  }) async {
    state = const AsyncValue<Board?>.loading();

    try {
      final Board updatedBoard = await _markBoardCellCorrectUseCase(
        sessionId: sessionId,
        board: board,
        cellId: cellId,
        winningTeamId: winningTeamId,
      );

      state = AsyncValue<Board?>.data(updatedBoard);
      return updatedBoard;
    } catch (error, stackTrace) {
      state = AsyncValue<Board?>.error(error, stackTrace);
      rethrow;
    }
  }

  Future<Board> markCellIncorrect({
    required String sessionId,
    required Board board,
    required String cellId,
  }) async {
    state = const AsyncValue<Board?>.loading();

    try {
      final Board updatedBoard = await _markBoardCellIncorrectUseCase(
        sessionId: sessionId,
        board: board,
        cellId: cellId,
      );

      state = AsyncValue<Board?>.data(updatedBoard);
      return updatedBoard;
    } catch (error, stackTrace) {
      state = AsyncValue<Board?>.error(error, stackTrace);
      rethrow;
    }
  }

  void setBoard(Board board) {
    state = AsyncValue<Board?>.data(board);
  }

  void clear() {
    state = const AsyncValue<Board?>.data(null);
  }
}