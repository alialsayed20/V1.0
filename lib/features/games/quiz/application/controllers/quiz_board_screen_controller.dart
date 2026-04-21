import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/state/quiz_board_state.dart';

final quizBoardScreenControllerProvider =
    StateNotifierProvider<QuizBoardScreenController, QuizBoardState>(
  (Ref ref) {
    return QuizBoardScreenController();
  },
);

class QuizBoardScreenController extends StateNotifier<QuizBoardState> {
  QuizBoardScreenController()
      : super(
          const QuizBoardState(
            columnsCount: _defaultColumnsCount,
            cellPoints: _defaultCellPoints,
          ),
        );

  static const int _defaultColumnsCount = 4;

  static const List<int> _defaultCellPoints = <int>[
    10, 25, 50, 100,
    10, 25, 50, 100,
  ];

  void setColumnsCount(int columnsCount) {
    if (columnsCount <= 0) {
      return;
    }

    state = state.copyWith(
      columnsCount: columnsCount,
    );
  }

  void setCellPoints(List<int> cellPoints) {
    state = state.copyWith(
      cellPoints: List<int>.from(cellPoints),
    );
  }

  void reset() {
    state = const QuizBoardState(
      columnsCount: _defaultColumnsCount,
      cellPoints: _defaultCellPoints,
    );
  }
}