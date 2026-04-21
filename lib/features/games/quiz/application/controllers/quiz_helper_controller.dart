import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/game_session.dart';
import '../../domain/entities/helper_usage.dart';
import '../../domain/entities/question_round.dart';
import '../providers/quiz_helper_use_case_providers.dart';
import '../usecases/activate_block_steal_use_case.dart';
import '../usecases/steal_question_use_case.dart';
import '../usecases/block_team_answer_use_case.dart';
import '../usecases/exclude_team_from_next_turn_use_case.dart';
import '../usecases/apply_double_points_use_case.dart';

final quizHelperControllerProvider =
    StateNotifierProvider<QuizHelperController, AsyncValue<void>>(
  (Ref ref) {
    return QuizHelperController(
      activateBlockStealUseCase:
          ref.watch(activateBlockStealUseCaseProvider),
      stealQuestionUseCase: ref.watch(stealQuestionUseCaseProvider),
      blockTeamAnswerUseCase: ref.watch(blockTeamAnswerUseCaseProvider),
      excludeTeamFromNextTurnUseCase:
          ref.watch(excludeTeamFromNextTurnUseCaseProvider),
      applyDoublePointsUseCase: ref.watch(applyDoublePointsUseCaseProvider),
    );
  },
);

class QuizHelperController extends StateNotifier<AsyncValue<void>> {
  QuizHelperController({
    required ActivateBlockStealUseCase activateBlockStealUseCase,
    required StealQuestionUseCase stealQuestionUseCase,
    required BlockTeamAnswerUseCase blockTeamAnswerUseCase,
    required ExcludeTeamFromNextTurnUseCase excludeTeamFromNextTurnUseCase,
    required ApplyDoublePointsUseCase applyDoublePointsUseCase,
  })  : _activateBlockStealUseCase = activateBlockStealUseCase,
        _stealQuestionUseCase = stealQuestionUseCase,
        _blockTeamAnswerUseCase = blockTeamAnswerUseCase,
        _excludeTeamFromNextTurnUseCase = excludeTeamFromNextTurnUseCase,
        _applyDoublePointsUseCase = applyDoublePointsUseCase,
        super(const AsyncValue<void>.data(null));

  final ActivateBlockStealUseCase _activateBlockStealUseCase;
  final StealQuestionUseCase _stealQuestionUseCase;
  final BlockTeamAnswerUseCase _blockTeamAnswerUseCase;
  final ExcludeTeamFromNextTurnUseCase _excludeTeamFromNextTurnUseCase;
  final ApplyDoublePointsUseCase _applyDoublePointsUseCase;

  Future<ActivateBlockStealResult> activateBlockSteal({
    required String sessionId,
    required HelperUsage usage,
    required QuestionRound round,
  }) async {
    state = const AsyncValue<void>.loading();

    try {
      final ActivateBlockStealResult result =
          await _activateBlockStealUseCase(
        sessionId: sessionId,
        usage: usage,
        round: round,
      );

      state = const AsyncValue<void>.data(null);
      return result;
    } catch (error, stackTrace) {
      state = AsyncValue<void>.error(error, stackTrace);
      rethrow;
    }
  }

  Future<StealQuestionResult> stealQuestion({
    required String sessionId,
    required HelperUsage usage,
    required QuestionRound round,
    required String stealingTeamId,
  }) async {
    state = const AsyncValue<void>.loading();

    try {
      final StealQuestionResult result = await _stealQuestionUseCase(
        sessionId: sessionId,
        usage: usage,
        round: round,
        stealingTeamId: stealingTeamId,
      );

      state = const AsyncValue<void>.data(null);
      return result;
    } catch (error, stackTrace) {
      state = AsyncValue<void>.error(error, stackTrace);
      rethrow;
    }
  }

  Future<BlockTeamAnswerResult> blockTeamAnswer({
    required String sessionId,
    required HelperUsage usage,
    required QuestionRound round,
    required String teamId,
  }) async {
    state = const AsyncValue<void>.loading();

    try {
      final BlockTeamAnswerResult result = await _blockTeamAnswerUseCase(
        sessionId: sessionId,
        usage: usage,
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

  Future<ExcludeTeamFromNextTurnResult> excludeTeamFromNextTurn({
    required String sessionId,
    required GameSession session,
    required HelperUsage usage,
    required String teamId,
  }) async {
    state = const AsyncValue<void>.loading();

    try {
      final ExcludeTeamFromNextTurnResult result =
          await _excludeTeamFromNextTurnUseCase(
        sessionId: sessionId,
        session: session,
        usage: usage,
        teamId: teamId,
      );

      state = const AsyncValue<void>.data(null);
      return result;
    } catch (error, stackTrace) {
      state = AsyncValue<void>.error(error, stackTrace);
      rethrow;
    }
  }

  Future<ApplyDoublePointsResult> applyDoublePoints({
    required String sessionId,
    required HelperUsage usage,
    required int basePoints,
  }) async {
    state = const AsyncValue<void>.loading();

    try {
      final ApplyDoublePointsResult result =
          await _applyDoublePointsUseCase(
        sessionId: sessionId,
        usage: usage,
        basePoints: basePoints,
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