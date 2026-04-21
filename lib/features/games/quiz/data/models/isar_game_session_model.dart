import 'package:isar/isar.dart';

part 'isar_game_session_model.g.dart';

@Collection()
class IsarGameSessionModel {
  IsarGameSessionModel();

  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String sessionId;

  late String phase;

  List<IsarTeamModel> teams = <IsarTeamModel>[];

  List<IsarPlayerModel> players = <IsarPlayerModel>[];

  List<String> turnOrder = <String>[];

  String currentTurnTeamId = '';
}

@Embedded()
class IsarTeamModel {
  IsarTeamModel();

  late String id;
  late String name;
  late String state;
}

@Embedded()
class IsarPlayerModel {
  IsarPlayerModel();

  late String id;
  late String name;
  late String colorCode;
  late String teamId;
}