import '../entities/category.dart';

abstract class CategoryRepository {
  const CategoryRepository();

  Future<List<Category>> getActiveCategories();

  Future<Category?> getCategoryById(String categoryId);
}