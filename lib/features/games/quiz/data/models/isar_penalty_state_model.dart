import 'package:isar/isar.dart';

part 'isar_penalty_state_model.g.dart';

@Collection()
class IsarPenaltyStateModel {
  IsarPenaltyStateModel();

  Id isarId = Isar.autoIncrement;

  @Index(composite: [CompositeIndex('teamId')], unique: true, replace: true)
  late String sessionId;

  late String teamId;
  late int yellowCardCount;
  late int redCardCount;
  late bool isBlockedFromCurrentQuestion;
  late bool isEliminated;
}