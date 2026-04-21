import '../entities/helper_usage.dart';

abstract class HelperUsageRepository {
  const HelperUsageRepository();

  Future<List<HelperUsage>> getHelperUsagesBySessionId(String sessionId);

  Future<void> saveHelperUsage({
    required String sessionId,
    required HelperUsage usage,
  });

  Future<void> deleteHelperUsagesBySessionId(String sessionId);
}