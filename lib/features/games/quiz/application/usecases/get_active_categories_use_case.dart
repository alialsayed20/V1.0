import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';

class GetActiveCategoriesUseCase {
  const GetActiveCategoriesUseCase({
    required CategoryRepository categoryRepository,
  }) : _categoryRepository = categoryRepository;

  final CategoryRepository _categoryRepository;

  Future<List<Category>> call() {
    return _categoryRepository.getActiveCategories();
  }
}