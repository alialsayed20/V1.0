import '../enums/helper_type.dart';

class HelperUsage {
  const HelperUsage({
    required this.teamId,
    required this.usedHelpers,
  });

  final String teamId;
  final List<HelperType> usedHelpers;

  bool hasUsed(HelperType helperType) {
    return usedHelpers.contains(helperType);
  }

  HelperUsage copyWith({
    String? teamId,
    List<HelperType>? usedHelpers,
  }) {
    return HelperUsage(
      teamId: teamId ?? this.teamId,
      usedHelpers: usedHelpers ?? this.usedHelpers,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is HelperUsage &&
        other.teamId == teamId &&
        _listEquals(other.usedHelpers, usedHelpers);
  }

  @override
  int get hashCode => Object.hash(
        teamId,
        Object.hashAll(usedHelpers),
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