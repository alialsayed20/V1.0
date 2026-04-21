import '../enums/team_state.dart';

class Team {
  const Team({
    required this.id,
    required this.name,
    required this.state,
  });

  final String id;
  final String name;
  final TeamState state;

  Team copyWith({
    String? id,
    String? name,
    TeamState? state,
  }) {
    return Team(
      id: id ?? this.id,
      name: name ?? this.name,
      state: state ?? this.state,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Team &&
        other.id == id &&
        other.name == name &&
        other.state == state;
  }

  @override
  int get hashCode => Object.hash(id, name, state);
}