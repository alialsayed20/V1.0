import 'package:isar/isar.dart';

part 'isar_used_question_model.g.dart';

@Collection()
class IsarUsedQuestionModel {
  IsarUsedQuestionModel();

  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String questionId;
}