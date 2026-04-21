import 'package:isar/isar.dart';

part 'isar_question_model.g.dart';

@Collection()
class IsarQuestionModel {
  IsarQuestionModel();

  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String questionId;

  @Index()
  late String categoryId;

  /// تخزين items كـ JSON
  late String itemsJson;
}