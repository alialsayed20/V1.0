import '../../domain/entities/game_session.dart';
import '../../domain/entities/player.dart';
import '../../domain/entities/team.dart';
import '../../domain/enums/quiz_session_phase.dart';
import '../../domain/enums/team_state.dart';
import '../models/isar_game_session_model.dart';

class GameSessionIsarMapper {
  const GameSessionIsarMapper();

  // ========= Domain -> Isar =========

  IsarGameSessionModel toIsar(GameSession session) {
    final IsarGameSessionModel model = IsarGameSessionModel()
      ..sessionId = session.id
      ..phase = _phaseToString(session.phase)
      ..turnOrder = List<String>.from(session.turnOrder)
      ..currentTurnTeamId = session.currentTurnTeamId
      ..teams = session.teams.map(_teamToIsar).toList()
      ..players = session.players.map(_playerToIsar).toList();

    return model;
  }

  IsarTeamModel _teamToIsar(Team team) {
    final IsarTeamModel model = IsarTeamModel()
      ..id = team.id
      ..name = team.name
      ..state = _teamStateToString(team.state);

    return model;
  }

  IsarPlayerModel _playerToIsar(Player player) {
    final IsarPlayerModel model = IsarPlayerModel()
      ..id = player.id
      ..name = player.name
      ..colorCode = player.colorCode
      ..teamId = player.teamId;

    return model;
  }

  // ========= Isar -> Domain =========

  GameSession toDomain(IsarGameSessionModel model) {
    return GameSession(
      id: model.sessionId,
      phase: _phaseFromString(model.phase),
      teams: model.teams.map(_teamFromIsar).toList(),
      players: model.players.map(_playerFromIsar).toList(),
      turnOrder: List<String>.from(model.turnOrder),
      currentTurnTeamId: model.currentTurnTeamId,
    );
  }

  Team _teamFromIsar(IsarTeamModel model) {
    return Team(
      id: model.id,
      name: model.name,
      state: _teamStateFromString(model.state),
    );
  }

  Player _playerFromIsar(IsarPlayerModel model) {
    return Player(
      id: model.id,
      name: model.name,
      colorCode: model.colorCode,
      teamId: model.teamId,
    );
  }

  // ========= Enum Mapping =========

  String _phaseToString(QuizSessionPhase phase) {
    return phase.name;
  }

  QuizSessionPhase _phaseFromString(String value) {
    return QuizSessionPhase.values.firstWhere(
      (e) => e.name == value,
      orElse: () => QuizSessionPhase.setup,
    );
  }

  String _teamStateToString(TeamState state) {
    return state.name;
  }

  TeamState _teamStateFromString(String value) {
    return TeamState.values.firstWhere(
      (e) => e.name == value,
      orElse: () => TeamState.active,
    );
  }
}