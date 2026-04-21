class PenaltyState {
  const PenaltyState({
    required this.teamId,
    required this.yellowCardCount,
    required this.redCardCount,
    required this.isBlockedFromCurrentQuestion,
    required this.isEliminated,
  });

  final String teamId;
  final int yellowCardCount;
  final int redCardCount;
  final bool isBlockedFromCurrentQuestion;
  final bool isEliminated;

  PenaltyState copyWith({
    String? teamId,
    int? yellowCardCount,
    int? redCardCount,
    bool? isBlockedFromCurrentQuestion,
    bool? isEliminated,
  }) {
    return PenaltyState(
      teamId: teamId ?? this.teamId,
      yellowCardCount: yellowCardCount ?? this.yellowCardCount,
      redCardCount: redCardCount ?? this.redCardCount,
      isBlockedFromCurrentQuestion:
          isBlockedFromCurrentQuestion ?? this.isBlockedFromCurrentQuestion,
      isEliminated: isEliminated ?? this.isEliminated,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is PenaltyState &&
        other.teamId == teamId &&
        other.yellowCardCount == yellowCardCount &&
        other.redCardCount == redCardCount &&
        other.isBlockedFromCurrentQuestion == isBlockedFromCurrentQuestion &&
        other.isEliminated == isEliminated;
  }

  @override
  int get hashCode => Object.hash(
        teamId,
        yellowCardCount,
        redCardCount,
        isBlockedFromCurrentQuestion,
        isEliminated,
      );
}