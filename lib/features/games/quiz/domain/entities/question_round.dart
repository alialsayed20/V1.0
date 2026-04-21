import '../enums/question_round_status.dart';

class QuestionRound {
  const QuestionRound({
    required this.questionId,
    required this.boardCellId,
    required this.status,
    required this.answerOrder,
    required this.blockedTeamIds,
    required this.isStealBlocked,
    required this.stealingTeamId,
    required this.winningTeamId,
  });

  final String questionId;
  final String boardCellId;
  final QuestionRoundStatus status;

  final List<String> answerOrder;
  final List<String> blockedTeamIds;

  final bool isStealBlocked;
  final String? stealingTeamId;
  final String? winningTeamId;

  bool get isResolved => winningTeamId != null || status == QuestionRoundStatus.closed;

  QuestionRound copyWith({
    String? questionId,
    String? boardCellId,
    QuestionRoundStatus? status,
    List<String>? answerOrder,
    List<String>? blockedTeamIds,
    bool? isStealBlocked,
    String? stealingTeamId,
    bool clearStealingTeamId = false,
    String? winningTeamId,
    bool clearWinningTeamId = false,
  }) {
    return QuestionRound(
      questionId: questionId ?? this.questionId,
      boardCellId: boardCellId ?? this.boardCellId,
      status: status ?? this.status,
      answerOrder: answerOrder ?? this.answerOrder,
      blockedTeamIds: blockedTeamIds ?? this.blockedTeamIds,
      isStealBlocked: isStealBlocked ?? this.isStealBlocked,
      stealingTeamId: clearStealingTeamId
          ? null
          : (stealingTeamId ?? this.stealingTeamId),
      winningTeamId: clearWinningTeamId
          ? null
          : (winningTeamId ?? this.winningTeamId),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is QuestionRound &&
        other.questionId == questionId &&
        other.boardCellId == boardCellId &&
        other.status == status &&
        _listEquals(other.answerOrder, answerOrder) &&
        _listEquals(other.blockedTeamIds, blockedTeamIds) &&
        other.isStealBlocked == isStealBlocked &&
        other.stealingTeamId == stealingTeamId &&
        other.winningTeamId == winningTeamId;
  }

  @override
  int get hashCode => Object.hash(
        questionId,
        boardCellId,
        status,
        Object.hashAll(answerOrder),
        Object.hashAll(blockedTeamIds),
        isStealBlocked,
        stealingTeamId,
        winningTeamId,
      );
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