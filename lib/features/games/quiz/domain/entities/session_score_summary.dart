class SessionScoreSummary {
  const SessionScoreSummary({
    required this.teamId,
    required this.score,
    required this.correctAnswersCount,
    required this.wrongAnswersCount,
    required this.unansweredCellsCount,
    required this.isWinner,
  });

  final String teamId;
  final int score;
  final int correctAnswersCount;
  final int wrongAnswersCount;
  final int unansweredCellsCount;
  final bool isWinner;

  SessionScoreSummary copyWith({
    String? teamId,
    int? score,
    int? correctAnswersCount,
    int? wrongAnswersCount,
    int? unansweredCellsCount,
    bool? isWinner,
  }) {
    return SessionScoreSummary(
      teamId: teamId ?? this.teamId,
      score: score ?? this.score,
      correctAnswersCount: correctAnswersCount ?? this.correctAnswersCount,
      wrongAnswersCount: wrongAnswersCount ?? this.wrongAnswersCount,
      unansweredCellsCount:
          unansweredCellsCount ?? this.unansweredCellsCount,
      isWinner: isWinner ?? this.isWinner,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is SessionScoreSummary &&
        other.teamId == teamId &&
        other.score == score &&
        other.correctAnswersCount == correctAnswersCount &&
        other.wrongAnswersCount == wrongAnswersCount &&
        other.unansweredCellsCount == unansweredCellsCount &&
        other.isWinner == isWinner;
  }

  @override
  int get hashCode => Object.hash(
        teamId,
        score,
        correctAnswersCount,
        wrongAnswersCount,
        unansweredCellsCount,
        isWinner,
      );
}