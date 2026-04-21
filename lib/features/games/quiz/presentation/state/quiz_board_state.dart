class QuizBoardState {
  const QuizBoardState({
    required this.columnsCount,
    required this.cellPoints,
  });

  final int columnsCount;
  final List<int> cellPoints;

  QuizBoardState copyWith({
    int? columnsCount,
    List<int>? cellPoints,
  }) {
    return QuizBoardState(
      columnsCount: columnsCount ?? this.columnsCount,
      cellPoints: cellPoints ?? this.cellPoints,
    );
  }
}