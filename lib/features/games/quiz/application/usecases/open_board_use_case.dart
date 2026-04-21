import '../../domain/entities/game_session.dart';
import '../../domain/enums/quiz_session_phase.dart';
import '../../domain/repositories/session_repository.dart';

class OpenBoardUseCase {
  const OpenBoardUseCase({
    required SessionRepository sessionRepository,
  }) : _sessionRepository = sessionRepository;

  final SessionRepository _sessionRepository;

  Future<GameSession> call(GameSession session) async {
    final GameSession updatedSession = session.copyWith(
      phase: QuizSessionPhase.board,
    );

    await _sessionRepository.saveSession(updatedSession);

    return updatedSession;
  }
}