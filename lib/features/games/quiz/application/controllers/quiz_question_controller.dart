import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/game_session.dart';
import '../../domain/entities/question_round.dart';
import '../providers/quiz_question_use_case_providers.dart';
import '../usecases/open_question_use_case.dart';
import '../usecases/start_question_timer_use_case.dart';
import '../usecases/start_question_answering_use_case.dart';
import '../usecases/reveal_question_answer_use_case.dart';
import '../usecases/close_question_round_use_case.dart';

final quizQuestionControllerProvider =
    StateNotifierProvider<QuizQuestionController, AsyncValue<QuestionRound?>>(
  (Ref ref) {
    return QuizQuestionController(
      openQuestionUseCase: ref.watch(openQuestionUseCaseProvider),
      startQuestionTimerUseCase: ref.watch(startQuestionTimerUseCaseProvider),
      startQuestionAnsweringUseCase:
          ref.watch(startQuestionAnsweringUseCaseProvider),
      revealQuestionAnswerUseCase:
          ref.watch(revealQuestionAnswerUseCaseProvider),
      closeQuestionRoundUseCase: ref.watch(closeQuestionRoundUseCaseProvider),
    );
  },
);

class QuizQuestionController
    extends StateNotifier<AsyncValue<QuestionRound?>> {
  QuizQuestionController({
    required OpenQuestionUseCase openQuestionUseCase,
    required StartQuestionTimerUseCase startQuestionTimerUseCase,
    required StartQuestionAnsweringUseCase startQuestionAnsweringUseCase,
    required RevealQuestionAnswerUseCase revealQuestionAnswerUseCase,
    required CloseQuestionRoundUseCase closeQuestionRoundUseCase,
  })  : _openQuestionUseCase = openQuestionUseCase,
        _startQuestionTimerUseCase = startQuestionTimerUseCase,
        _startQuestionAnsweringUseCase = startQuestionAnsweringUseCase,
        _revealQuestionAnswerUseCase = revealQuestionAnswerUseCase,
        _closeQuestionRoundUseCase = closeQuestionRoundUseCase,
        super(const AsyncValue<QuestionRound?>.data(null));

  final OpenQuestionUseCase _openQuestionUseCase;
  final StartQuestionTimerUseCase _startQuestionTimerUseCase;
  final StartQuestionAnsweringUseCase _startQuestionAnsweringUseCase;
  final RevealQuestionAnswerUseCase _revealQuestionAnswerUseCase;
  final CloseQuestionRoundUseCase _closeQuestionRoundUseCase;

  Future<QuestionRound> openQuestion({
    required GameSession session,
    required String boardCellId,
    required String categoryId,
  }) async {
    state = const AsyncValue<QuestionRound?>.loading();

    try {
      final QuestionRound round = await _openQuestionUseCase(
        session: session,
        boardCellId: boardCellId,
        categoryId: categoryId,
      );

      state = AsyncValue<QuestionRound?>.data(round);
      return round;
    } catch (error, stackTrace) {
      state = AsyncValue<QuestionRound?>.error(error, stackTrace);
      rethrow;
    }
  }

  Future<QuestionRound> startTimer({
    required String sessionId,
    required QuestionRound round,
  }) async {
    state = const AsyncValue<QuestionRound?>.loading();

    try {
      final QuestionRound updatedRound = await _startQuestionTimerUseCase(
        sessionId: sessionId,
        round: round,
      );

      state = AsyncValue<QuestionRound?>.data(updatedRound);
      return updatedRound;
    } catch (error, stackTrace) {
      state = AsyncValue<QuestionRound?>.error(error, stackTrace);
      rethrow;
    }
  }

  Future<QuestionRound> startAnswering({
    required String sessionId,
    required QuestionRound round,
  }) async {
    state = const AsyncValue<QuestionRound?>.loading();

    try {
      final QuestionRound updatedRound =
          await _startQuestionAnsweringUseCase(
        sessionId: sessionId,
        round: round,
      );

      state = AsyncValue<QuestionRound?>.data(updatedRound);
      return updatedRound;
    } catch (error, stackTrace) {
      state = AsyncValue<QuestionRound?>.error(error, stackTrace);
      rethrow;
    }
  }

  Future<QuestionRound> revealAnswer({
    required String sessionId,
    required QuestionRound round,
  }) async {
    state = const AsyncValue<QuestionRound?>.loading();

    try {
      final QuestionRound updatedRound = await _revealQuestionAnswerUseCase(
        sessionId: sessionId,
        round: round,
      );

      state = AsyncValue<QuestionRound?>.data(updatedRound);
      return updatedRound;
    } catch (error, stackTrace) {
      state = AsyncValue<QuestionRound?>.error(error, stackTrace);
      rethrow;
    }
  }

  Future<QuestionRound> closeRound({
    required String sessionId,
    required QuestionRound round,
  }) async {
    state = const AsyncValue<QuestionRound?>.loading();

    try {
      final QuestionRound updatedRound = await _closeQuestionRoundUseCase(
        sessionId: sessionId,
        round: round,
      );

      state = AsyncValue<QuestionRound?>.data(updatedRound);
      return updatedRound;
    } catch (error, stackTrace) {
      state = AsyncValue<QuestionRound?>.error(error, stackTrace);
      rethrow;
    }
  }

  void setRound(QuestionRound round) {
    state = AsyncValue<QuestionRound?>.data(round);
  }

  void clear() {
    state = const AsyncValue<QuestionRound?>.data(null);
  }
}