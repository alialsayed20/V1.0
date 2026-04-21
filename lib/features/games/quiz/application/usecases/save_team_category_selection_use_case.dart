import '../../domain/entities/team_category_selection.dart';
import '../../domain/repositories/team_category_selection_repository.dart';

class SaveTeamCategorySelectionUseCase {
  const SaveTeamCategorySelectionUseCase({
    required TeamCategorySelectionRepository selectionRepository,
  }) : _selectionRepository = selectionRepository;

  final TeamCategorySelectionRepository _selectionRepository;

  Future<void> call({
    required String sessionId,
    required String teamId,
    required List<String> categoryIds,
  }) {
    final TeamCategorySelection selection = TeamCategorySelection(
      teamId: teamId,
      categoryIds: categoryIds,
    );

    return _selectionRepository.saveSelection(
      sessionId: sessionId,
      selection: selection,
    );
  }
}