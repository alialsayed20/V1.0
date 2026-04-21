import '../../domain/entities/game_session.dart';
import '../../domain/entities/helper_usage.dart';
import '../../domain/engines/helper_engine.dart';
import '../../domain/enums/helper_type.dart';
import '../../domain/repositories/helper_usage_repository.dart';
import '../../domain/repositories/session_repository.dart';

class ExcludeTeamFromNextTurnUseCase {
  const ExcludeTeamFromNextTurnUseCase({
    required HelperUsageRepository helperUsageRepository,
    required SessionRepository sessionRepository,
    required HelperEngine helperEngine,
  })  : _helperUsageRepository = helperUsageRepository,
        _sessionRepository = sessionRepository,
        _helperEngine = helperEngine;

  final HelperUsageRepository _helperUsageRepository;
  final SessionRepository _sessionRepository;
  final HelperEngine _helperEngine;

  Future<ExcludeTeamFromNextTurnResult> call({
    required String sessionId,
    required GameSession session,
    required HelperUsage usage,
    required String teamId,
  }) async {
    final bool canUse = _helperEngine.canUseHelper(
      usage: usage,
      helperType: HelperType.eliminateOpponent,
      currentRound: null,
    );

    if (!canUse) {
      throw StateError(
        'Eliminate opponent helper cannot be used in the current state.',
      );
    }

    final GameSession updatedSession = _helperEngine.excludeTeamFromNextTurn(
      session: session,
      teamId: teamId,
    );

    final HelperUsage updatedUsage = _helperEngine.markHelperAsUsed(
      usage: usage,
      helperType: HelperType.eliminateOpponent,
    );

    await _sessionRepository.saveSession(updatedSession);

    await _helperUsageRepository.saveHelperUsage(
      sessionId: sessionId,
      usage: updatedUsage,
    );

    return ExcludeTeamFromNextTurnResult(
      session: updatedSession,
      usage: updatedUsage,
    );
  }
}

class ExcludeTeamFromNextTurnResult {
  const ExcludeTeamFromNextTurnResult({
    required this.session,
    required this.usage,
  });

  final GameSession session;
  final HelperUsage usage;
}