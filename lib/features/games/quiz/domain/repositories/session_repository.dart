import '../entities/game_session.dart';

abstract class SessionRepository {
  const SessionRepository();

  Future<GameSession?> getActiveSession();

  Future<void> saveSession(GameSession session);

  Future<void> deleteSession(String sessionId);
}