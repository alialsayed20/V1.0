import '../../domain/entities/helper_usage.dart';
import '../../domain/engines/helper_engine.dart';
import '../../domain/enums/helper_type.dart';
import '../../domain/repositories/helper_usage_repository.dart';

class ApplyDoublePointsUseCase {
  const ApplyDoublePointsUseCase({
    required HelperUsageRepository helperUsageRepository,
    required HelperEngine helperEngine,
  })  : _helperUsageRepository = helperUsageRepository,
        _helperEngine = helperEngine;

  final HelperUsageRepository _helperUsageRepository;
  final HelperEngine _helperEngine;

  Future<ApplyDoublePointsResult> call({
    required String sessionId,
    required HelperUsage usage,
    required int basePoints,
  }) async {
    final bool canUse = _helperEngine.canUseHelper(
      usage: usage,
      helperType: HelperType.doublePoints,
      currentRound: null,
    );

    if (!canUse) {
      throw StateError(
        'Double points helper cannot be used in the current state.',
      );
    }

    final int doubledPoints = _helperEngine.applyDoublePoints(
      basePoints: basePoints,
    );

    final HelperUsage updatedUsage = _helperEngine.markHelperAsUsed(
      usage: usage,
      helperType: HelperType.doublePoints,
    );

    await _helperUsageRepository.saveHelperUsage(
      sessionId: sessionId,
      usage: updatedUsage,
    );

    return ApplyDoublePointsResult(
      points: doubledPoints,
      usage: updatedUsage,
    );
  }
}

class ApplyDoublePointsResult {
  const ApplyDoublePointsResult({
    required this.points,
    required this.usage,
  });

  final int points;
  final HelperUsage usage;
}