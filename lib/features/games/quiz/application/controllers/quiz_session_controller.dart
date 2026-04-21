import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/game_session.dart';
import '../../domain/entities/player.dart';
import '../../domain/entities/team.dart';
import '../providers/quiz_session_use_case_providers.dart';
import '../usecases/start_quiz_session_use_case.dart';
import '../usecases/run_quiz_lottery_use_case.dart';
import '../usecases/open_category_picking_use_case.dart';
import '../usecases/open_board_use_case.dart';
import '../usecases/finish_quiz_session_use_case.dart';


final quizSessionControllerProvider =
    StateNotifierProvider<QuizSessionController, AsyncValue<GameSession?>>(
  (Ref ref) {
    return QuizSessionController(
      startQuizSessionUseCase: ref.watch(startQuizSessionUseCaseProvider),
      runQuizLotteryUseCase: ref.watch(runQuizLotteryUseCaseProvider),
      openCategoryPickingUseCase:
          ref.watch(openCategoryPickingUseCaseProvider),
      openBoardUseCase: ref.watch(openBoardUseCaseProvider),
      finishQuizSessionUseCase: ref.watch(finishQuizSessionUseCaseProvider),
    );
  },
);

class QuizSessionController extends StateNotifier<AsyncValue<GameSession?>> {
  QuizSessionController({
    required StartQuizSessionUseCase startQuizSessionUseCase,
    required RunQuizLotteryUseCase runQuizLotteryUseCase,
    required OpenCategoryPickingUseCase openCategoryPickingUseCase,
    required OpenBoardUseCase openBoardUseCase,
    required FinishQuizSessionUseCase finishQuizSessionUseCase,
  })  : _startQuizSessionUseCase = startQuizSessionUseCase,
        _runQuizLotteryUseCase = runQuizLotteryUseCase,
        _openCategoryPickingUseCase = openCategoryPickingUseCase,
        _openBoardUseCase = openBoardUseCase,
        _finishQuizSessionUseCase = finishQuizSessionUseCase,
        super(const AsyncValue<GameSession?>.data(null));

  final StartQuizSessionUseCase _startQuizSessionUseCase;
  final RunQuizLotteryUseCase _runQuizLotteryUseCase;
  final OpenCategoryPickingUseCase _openCategoryPickingUseCase;
  final OpenBoardUseCase _openBoardUseCase;
  final FinishQuizSessionUseCase _finishQuizSessionUseCase;

  Future<GameSession> startSession({
    required String sessionId,
    required List<Team> teams,
    required List<Player> players,
  }) async {
    state = const AsyncValue<GameSession?>.loading();

    try {
      final GameSession session = await _startQuizSessionUseCase(
        sessionId: sessionId,
        teams: teams,
        players: players,
      );

      state = AsyncValue<GameSession?>.data(session);
      return session;
    } catch (error, stackTrace) {
      state = AsyncValue<GameSession?>.error(error, stackTrace);
      rethrow;
    }
  }

  Future<GameSession> runLottery({
    required GameSession session,
    required List<String> shuffledTeamIds,
  }) async {
    state = const AsyncValue<GameSession?>.loading();

    try {
      final GameSession updatedSession = await _runQuizLotteryUseCase(
        session: session,
        shuffledTeamIds: shuffledTeamIds,
      );

      state = AsyncValue<GameSession?>.data(updatedSession);
      return updatedSession;
    } catch (error, stackTrace) {
      state = AsyncValue<GameSession?>.error(error, stackTrace);
      rethrow;
    }
  }

  Future<GameSession> openCategoryPicking(GameSession session) async {
    state = const AsyncValue<GameSession?>.loading();

    try {
      final GameSession updatedSession =
          await _openCategoryPickingUseCase(session);

      state = AsyncValue<GameSession?>.data(updatedSession);
      return updatedSession;
    } catch (error, stackTrace) {
      state = AsyncValue<GameSession?>.error(error, stackTrace);
      rethrow;
    }
  }

  Future<GameSession> openBoard(GameSession session) async {
    state = const AsyncValue<GameSession?>.loading();

    try {
      final GameSession updatedSession = await _openBoardUseCase(session);

      state = AsyncValue<GameSession?>.data(updatedSession);
      return updatedSession;
    } catch (error, stackTrace) {
      state = AsyncValue<GameSession?>.error(error, stackTrace);
      rethrow;
    }
  }

  Future<GameSession> finishSession({
    required GameSession session,
    bool moveToResultPhase = true,
  }) async {
    state = const AsyncValue<GameSession?>.loading();

    try {
      final GameSession updatedSession = await _finishQuizSessionUseCase(
        session: session,
        moveToResultPhase: moveToResultPhase,
      );

      state = AsyncValue<GameSession?>.data(updatedSession);
      return updatedSession;
    } catch (error, stackTrace) {
      state = AsyncValue<GameSession?>.error(error, stackTrace);
      rethrow;
    }
  }

  void setSession(GameSession session) {
    state = AsyncValue<GameSession?>.data(session);
  }

  void clear() {
    state = const AsyncValue<GameSession?>.data(null);
  }
}