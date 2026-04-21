import '../../domain/entities/game_session.dart';
import '../../domain/enums/quiz_session_phase.dart';
import '../../domain/repositories/session_repository.dart';

class FinishQuizSessionUseCase {
  const FinishQuizSessionUseCase({
    required SessionRepository sessionRepository,
  }) : _sessionRepository = sessionRepository;

  final SessionRepository _sessionRepository;

  Future<GameSession> call({
    required GameSession session,
    bool moveToResultPhase = true,
  }) async {
    final GameSession updatedSession = session.copyWith(
      phase: moveToResultPhase
          ? QuizSessionPhase.result
          : QuizSessionPhase.finished,
    );

    await _sessionRepository.saveSession(updatedSession);

    return updatedSession;
  }
}