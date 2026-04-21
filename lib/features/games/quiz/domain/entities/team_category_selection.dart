class TeamCategorySelection {
  const TeamCategorySelection({
    required this.teamId,
    required this.categoryIds,
  });

  final String teamId;
  final List<String> categoryIds;

  TeamCategorySelection copyWith({
    String? teamId,
    List<String>? categoryIds,
  }) {
    return TeamCategorySelection(
      teamId: teamId ?? this.teamId,
      categoryIds: categoryIds ?? this.categoryIds,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is TeamCategorySelection &&
        other.teamId == teamId &&
        _listEquals(other.categoryIds, categoryIds);
  }

  @override
  int get hashCode => Object.hash(
        teamId,
        Object.hashAll(categoryIds),
      );
}

bool _listEquals<T>(List<T> a, List<T> b) {
  if (identical(a, b)) {
    return true;
  }

  if (a.length != b.length) {
    return false;
  }

  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) {
      return false;
    }
  }

  return true;
}