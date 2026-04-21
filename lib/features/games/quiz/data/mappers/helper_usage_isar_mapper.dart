import '../../domain/entities/helper_usage.dart';
import '../../domain/enums/helper_type.dart';
import '../models/isar_helper_usage_model.dart';

class HelperUsageIsarMapper {
  const HelperUsageIsarMapper();

  IsarHelperUsageModel toIsar({
    required String sessionId,
    required HelperUsage usage,
  }) {
    return IsarHelperUsageModel()
      ..sessionId = sessionId
      ..teamId = usage.teamId
      ..usedHelpers = usage.usedHelpers
          .map((HelperType helper) => helper.name)
          .toList();
  }

  HelperUsage toDomain(IsarHelperUsageModel model) {
    return HelperUsage(
      teamId: model.teamId,
      usedHelpers: model.usedHelpers
          .map(_helperTypeFromString)
          .toList(),
    );
  }

  HelperType _helperTypeFromString(String value) {
    return HelperType.values.firstWhere(
      (HelperType e) => e.name == value,
      orElse: () => HelperType.doublePoints,
    );
  }
}