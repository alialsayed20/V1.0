import 'dart:convert';

import '../../domain/entities/question.dart';
import '../../domain/entities/question_content_item.dart';
import '../../domain/enums/question_content_type.dart';
import '../../domain/enums/question_side.dart';
import '../models/isar_question_model.dart';

class QuestionIsarMapper {
  const QuestionIsarMapper();

  IsarQuestionModel toIsar(Question question) {
    return IsarQuestionModel()
      ..questionId = question.id
      ..categoryId = question.categoryId
      ..itemsJson = jsonEncode(
        question.items.map(_itemToJson).toList(),
      );
  }

  Question toDomain(IsarQuestionModel model) {
    final List<dynamic> decoded = jsonDecode(model.itemsJson);

    return Question(
      id: model.questionId,
      categoryId: model.categoryId,
      items: decoded.map(_itemFromJson).toList(),
    );
  }

  Map<String, dynamic> _itemToJson(QuestionContentItem item) {
    return {
      'id': item.id,
      'side': item.side.name,
      'type': item.type.name,
      'value': item.value,
    };
  }

  QuestionContentItem _itemFromJson(dynamic json) {
    return QuestionContentItem(
      id: json['id'] as String,
      side: QuestionSide.values.firstWhere(
        (e) => e.name == json['side'],
      ),
      type: QuestionContentType.values.firstWhere(
        (e) => e.name == json['type'],
      ),
      value: json['value'] as String,
    );
  }
}