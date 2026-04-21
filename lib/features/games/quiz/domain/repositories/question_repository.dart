import '../entities/question.dart';

abstract class QuestionRepository {
  const QuestionRepository();

  Future<List<Question>> getQuestionsByCategory(String categoryId);

  Future<Question?> getQuestionById(String questionId);

  Future<List<String>> getGloballyUsedQuestionIds();

  Future<void> markQuestionAsUsed(String questionId);

  Future<void> saveQuestion(Question question);
}