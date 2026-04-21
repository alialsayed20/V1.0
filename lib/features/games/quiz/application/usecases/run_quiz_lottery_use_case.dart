import '../../domain/entities/game_session.dart';
import '../../domain/enums/quiz_session_phase.dart';
import '../../domain/repositories/session_repository.dart';

class RunQuizLotteryUseCase {
  const RunQuizLotteryUseCase({
    required SessionRepository sessionRepository,
  }) : _sessionRepository = sessionRepository;

  final SessionRepository _sessionRepository;

  Future<GameSession> call({
    required GameSession session,
    required List<String> shuffledTeamIds,
  }) async {
    final String currentTurnTeamId =
        shuffledTeamIds.isNotEmpty ? shuffledTeamIds.first : '';

    final GameSession updatedSession = session.copyWith(
      phase: QuizSessionPhase.lottery,
      turnOrder: shuffledTeamIds,
      currentTurnTeamId: currentTurnTeamId,
    );

    await _sessionRepository.saveSession(updatedSession);

    return updatedSession;
  }
}