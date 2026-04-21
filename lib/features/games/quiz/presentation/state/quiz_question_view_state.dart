class QuizQuestionViewState {
  const QuizQuestionViewState({
    required this.remainingSeconds,
    required this.questionText,
  });

  final int remainingSeconds;
  final String questionText;

  QuizQuestionViewState copyWith({
    int? remainingSeconds,
    String? questionText,
  }) {
    return QuizQuestionViewState(
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      questionText: questionText ?? this.questionText,
    );
  }
}