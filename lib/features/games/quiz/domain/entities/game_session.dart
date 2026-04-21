import '../enums/quiz_session_phase.dart';
import 'team.dart';
import 'player.dart';

class GameSession {
  const GameSession({
    required this.id,
    required this.phase,
    required this.teams,
    required this.players,
    required this.turnOrder,
    required this.currentTurnTeamId,
  });

  final String id;

  final QuizSessionPhase phase;

  final List<Team> teams;
  final List<Player> players;

  final List<String> turnOrder;
  final String currentTurnTeamId;

  GameSession copyWith({
    String? id,
    QuizSessionPhase? phase,
    List<Team>? teams,
    List<Player>? players,
    List<String>? turnOrder,
    String? currentTurnTeamId,
  }) {
    return GameSession(
      id: id ?? this.id,
      phase: phase ?? this.phase,
      teams: teams ?? this.teams,
      players: players ?? this.players,
      turnOrder: turnOrder ?? this.turnOrder,
      currentTurnTeamId:
          currentTurnTeamId ?? this.currentTurnTeamId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is GameSession &&
        other.id == id &&
        other.phase == phase &&
        _listEquals(other.teams, teams) &&
        _listEquals(other.players, players) &&
        _listEquals(other.turnOrder, turnOrder) &&
        other.currentTurnTeamId == currentTurnTeamId;
  }

  @override
  int get hashCode => Object.hash(
        id,
        phase,
        Object.hashAll(teams),
        Object.hashAll(players),
        Object.hashAll(turnOrder),
        currentTurnTeamId,
      );
}

/// Helper داخلي لتجنب dependency على Flutter
bool _listEquals<T>(List<T> a, List<T> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;

  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }

  return true;
}