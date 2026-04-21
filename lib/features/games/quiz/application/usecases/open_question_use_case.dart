import '../../domain/entities/board.dart';
import '../../domain/entities/game_session.dart';
import '../../domain/entities/question.dart';
import '../../domain/entities/question_round.dart';
import '../../domain/enums/quiz_session_phase.dart';
import '../../domain/engines/question_engine.dart';
import '../../domain/repositories/board_repository.dart';
import '../../domain/repositories/question_repository.dart';
import '../../domain/repositories/question_round_repository.dart';
import '../../domain/repositories/session_repository.dart';

class OpenQuestionUseCase {
  const OpenQuestionUseCase({
    required SessionRepository sessionRepository,
    required BoardRepository boardRepository,
    required QuestionRepository questionRepository,
    required QuestionRoundRepository questionRoundRepository,
    required QuestionEngine questionEngine,
  })  : _sessionRepository = sessionRepository,
        _boardRepository = boardRepository,
        _questionRepository = questionRepository,
        _questionRoundRepository = questionRoundRepository,
        _questionEngine = questionEngine;

  final SessionRepository _sessionRepository;
  final BoardRepository _boardRepository;
  final QuestionRepository _questionRepository;
  final QuestionRoundRepository _questionRoundRepository;
  final QuestionEngine _questionEngine;

  Future<QuestionRound> call({
    required GameSession session,
    required String boardCellId,
    required String categoryId,
  }) async {
    final Board? board = await _boardRepository.getBoardBySessionId(session.id);

    if (board == null) {
      throw StateError('Board not found for session: ${session.id}');
    }

    final List<Question> availableQuestions =
        await _questionRepository.getQuestionsByCategory(categoryId);

    final List<String> globallyUsedQuestionIds =
        await _questionRepository.getGloballyUsedQuestionIds();

    final Question selectedQuestion = _questionEngine.selectQuestionForBoardCell(
      session: session,
      boardCellId: boardCellId,
      availableQuestions: availableQuestions,
      globallyUsedQuestionIds: globallyUsedQuestionIds,
    );

    final List<String> answerOrder = _questionEngine.buildAnswerOrder(
      session: session,
      openingTeamId: session.currentTurnTeamId,
    );

    final QuestionRound round = _questionEngine.createRound(
      question: selectedQuestion,
      boardCellId: boardCellId,
      answerOrder: answerOrder,
    );

    await _questionRoundRepository.saveRound(
      sessionId: session.id,
      round: round,
    );

    await _questionRepository.markQuestionAsUsed(selectedQuestion.id);

    final GameSession updatedSession = session.copyWith(
      phase: QuizSessionPhase.question,
    );

    await _sessionRepository.saveSession(updatedSession);

    return round;
  }
}