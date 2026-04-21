import '../entities/game_session.dart';
import '../entities/question.dart';
import '../entities/question_round.dart';

abstract class QuestionEngine {
  const QuestionEngine();

  Question selectQuestionForBoardCell({
    required GameSession session,
    required String boardCellId,
    required List<Question> availableQuestions,
    required List<String> globallyUsedQuestionIds,
  });

  QuestionRound createRound({
    required Question question,
    required String boardCellId,
    required List<String> answerOrder,
  });

  QuestionRound startTimer(QuestionRound round);

  QuestionRound startAnswering(QuestionRound round);

  QuestionRound revealAnswer(QuestionRound round);

  QuestionRound closeRound(QuestionRound round);

  List<String> buildAnswerOrder({
    required GameSession session,
    required String openingTeamId,
  });

  bool canReuseQuestions({
    required List<Question> availableQuestions,
    required List<String> globallyUsedQuestionIds,
  });
}