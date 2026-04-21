import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/team_category_selection.dart';
import '../providers/quiz_category_use_case_providers.dart';
import '../usecases/get_active_categories_use_case.dart';
import '../usecases/save_team_category_selection_use_case.dart';
import '../usecases/get_team_category_selections_use_case.dart';

final quizCategoryControllerProvider =
    StateNotifierProvider<QuizCategoryController, AsyncValue<QuizCategoryControllerState>>(
  (Ref ref) {
    return QuizCategoryController(
      getActiveCategoriesUseCase: ref.watch(getActiveCategoriesUseCaseProvider),
      saveTeamCategorySelectionUseCase:
          ref.watch(saveTeamCategorySelectionUseCaseProvider),
      getTeamCategorySelectionsUseCase:
          ref.watch(getTeamCategorySelectionsUseCaseProvider),
    );
  },
);

class QuizCategoryController extends StateNotifier<AsyncValue<QuizCategoryControllerState>> {
  QuizCategoryController({
    required GetActiveCategoriesUseCase getActiveCategoriesUseCase,
    required SaveTeamCategorySelectionUseCase saveTeamCategorySelectionUseCase,
    required GetTeamCategorySelectionsUseCase getTeamCategorySelectionsUseCase,
  })  : _getActiveCategoriesUseCase = getActiveCategoriesUseCase,
        _saveTeamCategorySelectionUseCase = saveTeamCategorySelectionUseCase,
        _getTeamCategorySelectionsUseCase = getTeamCategorySelectionsUseCase,
        super(
          const AsyncValue<QuizCategoryControllerState>.data(
            QuizCategoryControllerState(
              categories: <Category>[],
              selections: <TeamCategorySelection>[],
            ),
          ),
        );

  final GetActiveCategoriesUseCase _getActiveCategoriesUseCase;
  final SaveTeamCategorySelectionUseCase _saveTeamCategorySelectionUseCase;
  final GetTeamCategorySelectionsUseCase _getTeamCategorySelectionsUseCase;

  Future<List<Category>> loadActiveCategories() async {
    state = const AsyncValue<QuizCategoryControllerState>.loading();

    try {
      final List<Category> categories = await _getActiveCategoriesUseCase();
      final QuizCategoryControllerState currentState = state.valueOrNull ??
          const QuizCategoryControllerState(
            categories: <Category>[],
            selections: <TeamCategorySelection>[],
          );

      final QuizCategoryControllerState updatedState = currentState.copyWith(
        categories: categories,
      );

      state = AsyncValue<QuizCategoryControllerState>.data(updatedState);
      return categories;
    } catch (error, stackTrace) {
      state = AsyncValue<QuizCategoryControllerState>.error(error, stackTrace);
      rethrow;
    }
  }

  Future<void> saveTeamSelection({
    required String sessionId,
    required String teamId,
    required List<String> categoryIds,
  }) async {
    final QuizCategoryControllerState currentState = state.valueOrNull ??
        const QuizCategoryControllerState(
          categories: <Category>[],
          selections: <TeamCategorySelection>[],
        );

    state = const AsyncValue<QuizCategoryControllerState>.loading();

    try {
      await _saveTeamCategorySelectionUseCase(
        sessionId: sessionId,
        teamId: teamId,
        categoryIds: categoryIds,
      );

      final List<TeamCategorySelection> refreshedSelections =
          await _getTeamCategorySelectionsUseCase(sessionId);

      final QuizCategoryControllerState updatedState = currentState.copyWith(
        selections: refreshedSelections,
      );

      state = AsyncValue<QuizCategoryControllerState>.data(updatedState);
    } catch (error, stackTrace) {
      state = AsyncValue<QuizCategoryControllerState>.error(error, stackTrace);
      rethrow;
    }
  }

  Future<List<TeamCategorySelection>> loadSelections(String sessionId) async {
    final QuizCategoryControllerState currentState = state.valueOrNull ??
        const QuizCategoryControllerState(
          categories: <Category>[],
          selections: <TeamCategorySelection>[],
        );

    state = const AsyncValue<QuizCategoryControllerState>.loading();

    try {
      final List<TeamCategorySelection> selections =
          await _getTeamCategorySelectionsUseCase(sessionId);

      final QuizCategoryControllerState updatedState = currentState.copyWith(
        selections: selections,
      );

      state = AsyncValue<QuizCategoryControllerState>.data(updatedState);
      return selections;
    } catch (error, stackTrace) {
      state = AsyncValue<QuizCategoryControllerState>.error(error, stackTrace);
      rethrow;
    }
  }

  void setStateData({
    required List<Category> categories,
    required List<TeamCategorySelection> selections,
  }) {
    state = AsyncValue<QuizCategoryControllerState>.data(
      QuizCategoryControllerState(
        categories: categories,
        selections: selections,
      ),
    );
  }

  void clear() {
    state = const AsyncValue<QuizCategoryControllerState>.data(
      QuizCategoryControllerState(
        categories: <Category>[],
        selections: <TeamCategorySelection>[],
      ),
    );
  }
}

class QuizCategoryControllerState {
  const QuizCategoryControllerState({
    required this.categories,
    required this.selections,
  });

  final List<Category> categories;
  final List<TeamCategorySelection> selections;

  QuizCategoryControllerState copyWith({
    List<Category>? categories,
    List<TeamCategorySelection>? selections,
  }) {
    return QuizCategoryControllerState(
      categories: categories ?? this.categories,
      selections: selections ?? this.selections,
    );
  }
}