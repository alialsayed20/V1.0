import 'package:isar/isar.dart';

part 'isar_board_model.g.dart';

@Collection()
class IsarBoardModel {
  IsarBoardModel();

  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String sessionId;

  List<IsarBoardCellModel> cells = <IsarBoardCellModel>[];
}

@Embedded()
class IsarBoardCellModel {
  IsarBoardCellModel();

  late String id;
  late String categoryId;
  late int points;
  late String state;
  String? winningTeamId;
}