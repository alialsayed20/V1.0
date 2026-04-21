import 'question_content_item.dart';

class Question {
  const Question({
    required this.id,
    required this.categoryId,
    required this.items,
  });

  final String id;
  final String categoryId;

  /// جميع عناصر المحتوى (prompt + answer)
  final List<QuestionContentItem> items;

  Question copyWith({
    String? id,
    String? categoryId,
    List<QuestionContentItem>? items,
  }) {
    return Question(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      items: items ?? this.items,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Question &&
        other.id == id &&
        other.categoryId == categoryId &&
        _listEquals(other.items, items);
  }

  @override
  int get hashCode => Object.hash(
        id,
        categoryId,
        Object.hashAll(items),
      );
}

bool _listEquals<T>(List<T> a, List<T> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;

  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }

  return true;
}