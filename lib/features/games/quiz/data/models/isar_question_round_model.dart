import 'package:isar/isar.dart';

part 'isar_question_round_model.g.dart';

@Collection()
class IsarQuestionRoundModel {
  IsarQuestionRoundModel();

  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String sessionId;

  late String questionId;
  late String boardCellId;
  late String status;

  List<String> answerOrder = <String>[];
  List<String> blockedTeamIds = <String>[];

  late bool isStealBlocked;
  String? stealingTeamId;
  String? winningTeamId;
}