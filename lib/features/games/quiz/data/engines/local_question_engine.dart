import '../../domain/entities/game_session.dart';
import '../../domain/entities/question.dart';
import '../../domain/entities/question_round.dart';
import '../../domain/engines/question_engine.dart';
import '../../domain/enums/question_round_status.dart';

class LocalQuestionEngine implements QuestionEngine {
  const LocalQuestionEngine();

  @override
  Question selectQuestionForBoardCell({
    required GameSession session,
    required String boardCellId,
    required List<Question> availableQuestions,
    required List<String> globallyUsedQuestionIds,
  }) {
    if (availableQuestions.isEmpty) {
      throw StateError('No available questions provided.');
    }

    final List<Question> unusedQuestions = availableQuestions.where(
      (Question question) {
        return !globallyUsedQuestionIds.contains(question.id);
      },
    ).toList();

    if (unusedQuestions.isNotEmpty) {
      return unusedQuestions.first;
    }

    if (canReuseQuestions(
      availableQuestions: availableQuestions,
      globallyUsedQuestionIds: globallyUsedQuestionIds,
    )) {
      return availableQuestions.first;
    }

    throw StateError('No question could be selected.');
  }

  @override
  QuestionRound createRound({
    required Question question,
    required String boardCellId,
    required List<String> answerOrder,
  }) {
    return QuestionRound(
      questionId: question.id,
      boardCellId: boardCellId,
      status: QuestionRoundStatus.idle,
      answerOrder: List<String>.from(answerOrder),
      blockedTeamIds: const <String>[],
      isStealBlocked: false,
      stealingTeamId: null,
      winningTeamId: null,
    );
  }

  @override
  QuestionRound startTimer(QuestionRound round) {
    return round.copyWith(
      status: QuestionRoundStatus.timerRunning,
    );
  }

  @override
  QuestionRound startAnswering(QuestionRound round) {
    return round.copyWith(
      status: QuestionRoundStatus.answering,
    );
  }

  @override
  QuestionRound revealAnswer(QuestionRound round) {
    return round.copyWith(
      status: QuestionRoundStatus.reveal,
    );
  }

  @override
  QuestionRound closeRound(QuestionRound round) {
    return round.copyWith(
      status: QuestionRoundStatus.closed,
    );
  }

  @override
  List<String> buildAnswerOrder({
    required GameSession session,
    required String openingTeamId,
  }) {
    if (session.turnOrder.isEmpty) {
      return const <String>[];
    }

    final int openingIndex = session.turnOrder.indexOf(openingTeamId);

    if (openingIndex == -1) {
      return List<String>.from(session.turnOrder);
    }

    return <String>[
      ...session.turnOrder.sublist(openingIndex),
      ...session.turnOrder.sublist(0, openingIndex),
    ];
  }

  @override
  bool canReuseQuestions({
    required List<Question> availableQuestions,
    required List<String> globallyUsedQuestionIds,
  }) {
    if (availableQuestions.isEmpty) {
      return false;
    }

    final bool allAvailableQuestionsUsed = availableQuestions.every(
      (Question question) => globallyUsedQuestionIds.contains(question.id),
    );

    return allAvailableQuestionsUsed;
  }
}