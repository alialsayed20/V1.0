import '../../domain/entities/team_category_selection.dart';
import '../../domain/repositories/team_category_selection_repository.dart';

class GetTeamCategorySelectionsUseCase {
  const GetTeamCategorySelectionsUseCase({
    required TeamCategorySelectionRepository selectionRepository,
  }) : _selectionRepository = selectionRepository;

  final TeamCategorySelectionRepository _selectionRepository;

  Future<List<TeamCategorySelection>> call(String sessionId) {
    return _selectionRepository.getSelectionsBySessionId(sessionId);
  }
}