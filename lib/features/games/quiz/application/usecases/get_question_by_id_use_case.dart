import '../../domain/entities/question.dart';
import '../../domain/repositories/question_repository.dart';

class GetQuestionByIdUseCase {
  const GetQuestionByIdUseCase({
    required QuestionRepository questionRepository,
  }) : _questionRepository = questionRepository;

  final QuestionRepository _questionRepository;

  Future<Question?> call(String questionId) {
    return _questionRepository.getQuestionById(questionId);
  }
}