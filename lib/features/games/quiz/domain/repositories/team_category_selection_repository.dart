import '../entities/team_category_selection.dart';

abstract class TeamCategorySelectionRepository {
  const TeamCategorySelectionRepository();

  Future<List<TeamCategorySelection>> getSelectionsBySessionId(
    String sessionId,
  );

  Future<void> saveSelection({
    required String sessionId,
    required TeamCategorySelection selection,
  });

  Future<void> deleteSelectionsBySessionId(String sessionId);
}