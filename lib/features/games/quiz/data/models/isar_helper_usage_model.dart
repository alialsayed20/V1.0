import 'package:isar/isar.dart';

part 'isar_helper_usage_model.g.dart';

@Collection()
class IsarHelperUsageModel {
  IsarHelperUsageModel();

  Id isarId = Isar.autoIncrement;

  @Index(composite: [CompositeIndex('teamId')], unique: true, replace: true)
  late String sessionId;

  late String teamId;

  List<String> usedHelpers = <String>[];
}