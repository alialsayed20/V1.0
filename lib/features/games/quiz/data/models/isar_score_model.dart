import 'package:isar/isar.dart';

part 'isar_score_model.g.dart';

@Collection()
class IsarScoreModel {
  IsarScoreModel();

  Id isarId = Isar.autoIncrement;

  @Index(composite: [CompositeIndex('teamId')], unique: true, replace: true)
  late String sessionId;

  late String teamId;
  late int score;
  late int correctAnswersCount;
  late int wrongAnswersCount;
  late int unansweredCellsCount;
  late bool isWinner;
}