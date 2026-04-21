import 'package:isar/isar.dart';

import '../../domain/entities/question.dart';
import '../../domain/repositories/question_repository.dart';
import '../mappers/question_isar_mapper.dart';
import '../models/isar_question_model.dart';
import '../models/isar_used_question_model.dart';

class LocalQuestionRepository implements QuestionRepository {
  LocalQuestionRepository({
    required Isar isar,
    required QuestionIsarMapper mapper,
  })  : _isar = isar,
        _mapper = mapper;

  final Isar _isar;
  final QuestionIsarMapper _mapper;

  @override
  Future<List<Question>> getQuestionsByCategory(String categoryId) async {
    final List<IsarQuestionModel> models = await _isar.isarQuestionModels
        .filter()
        .categoryIdEqualTo(categoryId)
        .findAll();

    return models.map(_mapper.toDomain).toList();
  }

  @override
  Future<Question?> getQuestionById(String questionId) async {
    final IsarQuestionModel? model = await _isar.isarQuestionModels
        .filter()
        .questionIdEqualTo(questionId)
        .findFirst();

    if (model == null) {
      return null;
    }

    return _mapper.toDomain(model);
  }

  @override
  Future<List<String>> getGloballyUsedQuestionIds() async {
    final List<IsarUsedQuestionModel> models =
        await _isar.isarUsedQuestionModels.where().findAll();

    return models.map((IsarUsedQuestionModel model) => model.questionId).toList();
  }

  @override
  Future<void> markQuestionAsUsed(String questionId) async {
    final IsarUsedQuestionModel? existing = await _isar.isarUsedQuestionModels
        .filter()
        .questionIdEqualTo(questionId)
        .findFirst();

    if (existing != null) {
      return;
    }

    final IsarUsedQuestionModel model = IsarUsedQuestionModel()
      ..questionId = questionId;

    await _isar.writeTxn(() async {
      await _isar.isarUsedQuestionModels.put(model);
    });
  }

  @override
  Future<void> saveQuestion(Question question) async {
    final IsarQuestionModel model = _mapper.toIsar(question);

    await _isar.writeTxn(() async {
      await _isar.isarQuestionModels.put(model);
    });
  }
}