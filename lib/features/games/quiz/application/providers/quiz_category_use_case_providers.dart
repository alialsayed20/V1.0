import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/team_category_selection_repository.dart';
import '../usecases/get_active_categories_use_case.dart';
import '../usecases/get_team_category_selections_use_case.dart';
import '../usecases/save_team_category_selection_use_case.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>(
  (Ref ref) {
    throw UnimplementedError('categoryRepositoryProvider must be overridden.');
  },
);

final teamCategorySelectionRepositoryProvider =
    Provider<TeamCategorySelectionRepository>(
  (Ref ref) {
    throw UnimplementedError(
      'teamCategorySelectionRepositoryProvider must be overridden.',
    );
  },
);

final getActiveCategoriesUseCaseProvider =
    Provider<GetActiveCategoriesUseCase>(
  (Ref ref) {
    return GetActiveCategoriesUseCase(
      categoryRepository: ref.watch(categoryRepositoryProvider),
    );
  },
);

final saveTeamCategorySelectionUseCaseProvider =
    Provider<SaveTeamCategorySelectionUseCase>(
  (Ref ref) {
    return SaveTeamCategorySelectionUseCase(
      selectionRepository: ref.watch(teamCategorySelectionRepositoryProvider),
    );
  },
);

final getTeamCategorySelectionsUseCaseProvider =
    Provider<GetTeamCategorySelectionsUseCase>(
  (Ref ref) {
    return GetTeamCategorySelectionsUseCase(
      selectionRepository: ref.watch(teamCategorySelectionRepositoryProvider),
    );
  },
);