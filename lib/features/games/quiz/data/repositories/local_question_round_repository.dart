import 'package:isar/isar.dart';

import '../../domain/entities/question_round.dart';
import '../../domain/repositories/question_round_repository.dart';
import '../mappers/question_round_isar_mapper.dart';
import '../models/isar_question_round_model.dart';

class LocalQuestionRoundRepository implements QuestionRoundRepository {
  LocalQuestionRoundRepository({
    required Isar isar,
    required QuestionRoundIsarMapper mapper,
  })  : _isar = isar,
        _mapper = mapper;

  final Isar _isar;
  final QuestionRoundIsarMapper _mapper;

  @override
  Future<QuestionRound?> getActiveRoundBySessionId(String sessionId) async {
    final IsarQuestionRoundModel? model = await _isar.isarQuestionRoundModels
        .filter()
        .sessionIdEqualTo(sessionId)
        .findFirst();

    if (model == null) {
      return null;
    }

    return _mapper.toDomain(model);
  }

  @override
  Future<void> saveRound({
    required String sessionId,
    required QuestionRound round,
  }) async {
    final IsarQuestionRoundModel model = _mapper.toIsar(
      sessionId: sessionId,
      round: round,
    );

    final IsarQuestionRoundModel? existing = await _isar.isarQuestionRoundModels
        .filter()
        .sessionIdEqualTo(sessionId)
        .findFirst();

    if (existing != null) {
      model.isarId = existing.isarId;
    }

    await _isar.writeTxn(() async {
      await _isar.isarQuestionRoundModels.put(model);
    });
  }

  @override
  Future<void> deleteRoundBySessionId(String sessionId) async {
    final IsarQuestionRoundModel? existing = await _isar.isarQuestionRoundModels
        .filter()
        .sessionIdEqualTo(sessionId)
        .findFirst();

    if (existing == null) {
      return;
    }

    await _isar.writeTxn(() async {
      await _isar.isarQuestionRoundModels.delete(existing.isarId);
    });
  }
}