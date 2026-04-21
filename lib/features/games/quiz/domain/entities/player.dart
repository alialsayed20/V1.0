class Player {
  const Player({
    required this.id,
    required this.name,
    required this.colorCode,
    required this.teamId,
  });

  final String id;
  final String name;
  final String colorCode;
  final String teamId;

  Player copyWith({
    String? id,
    String? name,
    String? colorCode,
    String? teamId,
  }) {
    return Player(
      id: id ?? this.id,
      name: name ?? this.name,
      colorCode: colorCode ?? this.colorCode,
      teamId: teamId ?? this.teamId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Player &&
        other.id == id &&
        other.name == name &&
        other.colorCode == colorCode &&
        other.teamId == teamId;
  }

  @override
  int get hashCode => Object.hash(id, name, colorCode, teamId);
}