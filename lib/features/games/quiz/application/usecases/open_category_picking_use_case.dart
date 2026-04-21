import '../../domain/entities/game_session.dart';
import '../../domain/enums/quiz_session_phase.dart';
import '../../domain/repositories/session_repository.dart';

class OpenCategoryPickingUseCase {
  const OpenCategoryPickingUseCase({
    required SessionRepository sessionRepository,
  }) : _sessionRepository = sessionRepository;

  final SessionRepository _sessionRepository;

  Future<GameSession> call(GameSession session) async {
    final GameSession updatedSession = session.copyWith(
      phase: QuizSessionPhase.categoryPicking,
    );

    await _sessionRepository.saveSession(updatedSession);

    return updatedSession;
  }
}