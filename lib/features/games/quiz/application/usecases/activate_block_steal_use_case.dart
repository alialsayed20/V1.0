import '../../domain/entities/helper_usage.dart';
import '../../domain/entities/question_round.dart';
import '../../domain/engines/helper_engine.dart';
import '../../domain/enums/helper_type.dart';
import '../../domain/repositories/helper_usage_repository.dart';
import '../../domain/repositories/question_round_repository.dart';

class ActivateBlockStealUseCase {
  const ActivateBlockStealUseCase({
    required HelperUsageRepository helperUsageRepository,
    required QuestionRoundRepository questionRoundRepository,
    required HelperEngine helperEngine,
  })  : _helperUsageRepository = helperUsageRepository,
        _questionRoundRepository = questionRoundRepository,
        _helperEngine = helperEngine;

  final HelperUsageRepository _helperUsageRepository;
  final QuestionRoundRepository _questionRoundRepository;
  final HelperEngine _helperEngine;

  Future<ActivateBlockStealResult> call({
    required String sessionId,
    required HelperUsage usage,
    required QuestionRound round,
  }) async {
    final bool canUse = _helperEngine.canUseHelper(
      usage: usage,
      helperType: HelperType.blockSteal,
      currentRound: round,
    );

    if (!canUse) {
      throw StateError('Block steal helper cannot be used in the current state.');
    }

    final QuestionRound updatedRound = _helperEngine.activateBlockSteal(
      round: round,
    );

    final HelperUsage updatedUsage = _helperEngine.markHelperAsUsed(
      usage: usage,
      helperType: HelperType.blockSteal,
    );

    await _questionRoundRepository.saveRound(
      sessionId: sessionId,
      round: updatedRound,
    );

    await _helperUsageRepository.saveHelperUsage(
      sessionId: sessionId,
      usage: updatedUsage,
    );

    return ActivateBlockStealResult(
      round: updatedRound,
      usage: updatedUsage,
    );
  }
}

class ActivateBlockStealResult {
  const ActivateBlockStealResult({
    required this.round,
    required this.usage,
  });

  final QuestionRound round;
  final HelperUsage usage;
}