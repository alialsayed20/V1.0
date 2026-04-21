import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/game_session.dart';
import '../../domain/entities/penalty_state.dart';
import '../../domain/entities/question_round.dart';
import '../providers/quiz_penalty_use_case_providers.dart';
import '../usecases/apply_early_answer_penalty_use_case.dart';
import '../usecases/apply_cheating_penalty_use_case.dart';

final quizPenaltyControllerProvider =
    StateNotifierProvider<QuizPenaltyController, AsyncValue<void>>(
  (Ref ref) {
    return QuizPenaltyController(
      applyEarlyAnswerPenaltyUseCase:
          ref.watch(applyEarlyAnswerPenaltyUseCaseProvider),
      applyCheatingPenaltyUseCase:
          ref.watch(applyCheatingPenaltyUseCaseProvider),
    );
  },
);

class QuizPenaltyController extends StateNotifier<AsyncValue<void>> {
  QuizPenaltyController({
    required ApplyEarlyAnswerPenaltyUseCase applyEarlyAnswerPenaltyUseCase,
    required ApplyCheatingPenaltyUseCase applyCheatingPenaltyUseCase,
  })  : _applyEarlyAnswerPenaltyUseCase = applyEarlyAnswerPenaltyUseCase,
        _applyCheatingPenaltyUseCase = applyCheatingPenaltyUseCase,
        super(const AsyncValue<void>.data(null));

  final ApplyEarlyAnswerPenaltyUseCase _applyEarlyAnswerPenaltyUseCase;
  final ApplyCheatingPenaltyUseCase _applyCheatingPenaltyUseCase;

  Future<ApplyEarlyAnswerPenaltyResult> applyEarlyAnswerPenalty({
    required String sessionId,
    required PenaltyState penaltyState,
    required QuestionRound round,
    required String teamId,
  }) async {
    state = const AsyncValue<void>.loading();

    try {
      final ApplyEarlyAnswerPenaltyResult result =
          await _applyEarlyAnswerPenaltyUseCase(
        sessionId: sessionId,
        penaltyState: penaltyState,
        round: round,
        teamId: teamId,
      );

      state = const AsyncValue<void>.data(null);
      return result;
    } catch (error, stackTrace) {
      state = AsyncValue<void>.error(error, stackTrace);
      rethrow;
    }
  }

  Future<ApplyCheatingPenaltyResult> applyCheatingPenalty({
    required String sessionId,
    required GameSession session,
    required PenaltyState penaltyState,
    required QuestionRound round,
    required String teamId,
    required int questionPoints,
  }) async {
    state = const AsyncValue<void>.loading();

    try {
      final ApplyCheatingPenaltyResult result =
          await _applyCheatingPenaltyUseCase(
        sessionId: sessionId,
        session: session,
        penaltyState: penaltyState,
        round: round,
        teamId: teamId,
        questionPoints: questionPoints,
      );

      state = const AsyncValue<void>.data(null);
      return result;
    } catch (error, stackTrace) {
      state = AsyncValue<void>.error(error, stackTrace);
      rethrow;
    }
  }

  void clearError() {
    state = const AsyncValue<void>.data(null);
  }
}