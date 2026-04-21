import '../../domain/entities/game_session.dart';
import '../../domain/engines/turn_engine.dart';
import '../../domain/repositories/session_repository.dart';

class AdvanceTurnUseCase {
  const AdvanceTurnUseCase({
    required SessionRepository sessionRepository,
    required TurnEngine turnEngine,
  })  : _sessionRepository = sessionRepository,
        _turnEngine = turnEngine;

  final SessionRepository _sessionRepository;
  final TurnEngine _turnEngine;

  Future<GameSession> call(GameSession session) async {
    final GameSession updatedSession = _turnEngine.advanceTurn(session);

    await _sessionRepository.saveSession(updatedSession);

    return updatedSession;
  }
}