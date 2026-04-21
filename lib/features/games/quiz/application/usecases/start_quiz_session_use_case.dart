import '../../domain/entities/game_session.dart';
import '../../domain/entities/player.dart';
import '../../domain/entities/team.dart';
import '../../domain/enums/quiz_session_phase.dart';
import '../../domain/repositories/session_repository.dart';

class StartQuizSessionUseCase {
  const StartQuizSessionUseCase({
    required SessionRepository sessionRepository,
  }) : _sessionRepository = sessionRepository;

  final SessionRepository _sessionRepository;

  Future<GameSession> call({
    required String sessionId,
    required List<Team> teams,
    required List<Player> players,
  }) async {
    final GameSession session = GameSession(
      id: sessionId,
      phase: QuizSessionPhase.setup,
      teams: teams,
      players: players,
      turnOrder: const <String>[],
      currentTurnTeamId: '',
    );

    await _sessionRepository.saveSession(session);

    return session;
  }
}