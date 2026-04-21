import '../enums/question_content_type.dart';
import '../enums/question_side.dart';

class QuestionContentItem {
  const QuestionContentItem({
    required this.id,
    required this.side,
    required this.type,
    required this.value,
  });

  final String id;
  final QuestionSide side;
  final QuestionContentType type;
  final String value;

  QuestionContentItem copyWith({
    String? id,
    QuestionSide? side,
    QuestionContentType? type,
    String? value,
  }) {
    return QuestionContentItem(
      id: id ?? this.id,
      side: side ?? this.side,
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is QuestionContentItem &&
        other.id == id &&
        other.side == side &&
        other.type == type &&
        other.value == value;
  }

  @override
  int get hashCode => Object.hash(id, side, type, value);
}