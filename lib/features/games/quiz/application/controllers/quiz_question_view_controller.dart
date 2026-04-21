import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/state/quiz_question_view_state.dart';

final quizQuestionViewControllerProvider =
    StateNotifierProvider<QuizQuestionViewController, QuizQuestionViewState>(
  (Ref ref) {
    return QuizQuestionViewController();
  },
);

class QuizQuestionViewController extends StateNotifier<QuizQuestionViewState> {
  QuizQuestionViewController()
      : super(
          const QuizQuestionViewState(
            remainingSeconds: _defaultRemainingSeconds,
            questionText: _defaultQuestionText,
          ),
        );

  static const int _defaultRemainingSeconds = 30;
  static const String _defaultQuestionText = '';

  void setRemainingSeconds(int value) {
    state = state.copyWith(
      remainingSeconds: value,
    );
  }

  void setQuestionText(String value) {
    state = state.copyWith(
      questionText: value,
    );
  }

  void setStateData({
    required int remainingSeconds,
    required String questionText,
  }) {
    state = state.copyWith(
      remainingSeconds: remainingSeconds,
      questionText: questionText,
    );
  }

  void reset() {
    state = const QuizQuestionViewState(
      remainingSeconds: _defaultRemainingSeconds,
      questionText: _defaultQuestionText,
    );
  }
}