import '../../domain/entities/question.dart';
import '../../domain/entities/question_content_item.dart';
import '../../domain/enums/question_content_type.dart';
import '../../domain/enums/question_side.dart';
import '../../domain/repositories/question_repository.dart';

class SeedMockQuestionsUseCase {
  const SeedMockQuestionsUseCase({
    required QuestionRepository questionRepository,
  }) : _repo = questionRepository;

  final QuestionRepository _repo;

  Future<void> call(List<String> categoryIds) async {
    for (final categoryId in categoryIds) {
      final existing = await _repo.getQuestionsByCategory(categoryId);
      if (existing.isNotEmpty) continue;

      await _repo.saveQuestion(
        Question(
          id: '${categoryId}_q1',
          categoryId: categoryId,
          items: const [
            QuestionContentItem(
              id: 'p1',
              side: QuestionSide.prompt,
              type: QuestionContentType.text,
              value: 'سؤال تجريبي',
            ),
            QuestionContentItem(
              id: 'a1',
              side: QuestionSide.answer,
              type: QuestionContentType.text,
              value: 'إجابة تجريبية',
            ),
          ],
        ),
      );
    }
  }
}