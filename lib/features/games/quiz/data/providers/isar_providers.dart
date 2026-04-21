import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../mappers/board_isar_mapper.dart';
import '../mappers/game_session_isar_mapper.dart';
import '../mappers/helper_usage_isar_mapper.dart';
import '../mappers/penalty_state_isar_mapper.dart';
import '../mappers/question_isar_mapper.dart';
import '../mappers/question_round_isar_mapper.dart';
import '../mappers/score_isar_mapper.dart';
import '../models/isar_board_model.dart';
import '../models/isar_game_session_model.dart';
import '../models/isar_helper_usage_model.dart';
import '../models/isar_penalty_state_model.dart';
import '../models/isar_question_model.dart';
import '../models/isar_question_round_model.dart';
import '../models/isar_score_model.dart';
import '../models/isar_used_question_model.dart';
import '../repositories/local_board_repository.dart';
import '../repositories/local_helper_usage_repository.dart';
import '../repositories/local_penalty_repository.dart';
import '../repositories/local_question_repository.dart';
import '../repositories/local_question_round_repository.dart';
import '../repositories/local_score_repository.dart';
import '../repositories/local_session_repository.dart';

final isarProvider = Provider<Isar>(
  (Ref ref) {
    throw UnimplementedError('isarProvider must be overridden at app startup.');
  },
);

final gameSessionIsarMapperProvider = Provider<GameSessionIsarMapper>(
  (Ref ref) => const GameSessionIsarMapper(),
);

final boardIsarMapperProvider = Provider<BoardIsarMapper>(
  (Ref ref) => const BoardIsarMapper(),
);

final questionRoundIsarMapperProvider = Provider<QuestionRoundIsarMapper>(
  (Ref ref) => const QuestionRoundIsarMapper(),
);

final questionIsarMapperProvider = Provider<QuestionIsarMapper>(
  (Ref ref) => const QuestionIsarMapper(),
);

final helperUsageIsarMapperProvider = Provider<HelperUsageIsarMapper>(
  (Ref ref) => const HelperUsageIsarMapper(),
);

final penaltyStateIsarMapperProvider = Provider<PenaltyStateIsarMapper>(
  (Ref ref) => const PenaltyStateIsarMapper(),
);

final scoreIsarMapperProvider = Provider<ScoreIsarMapper>(
  (Ref ref) => const ScoreIsarMapper(),
);

final localSessionRepositoryProvider = Provider<LocalSessionRepository>(
  (Ref ref) {
    return LocalSessionRepository(
      isar: ref.watch(isarProvider),
      mapper: ref.watch(gameSessionIsarMapperProvider),
    );
  },
);

final localBoardRepositoryProvider = Provider<LocalBoardRepository>(
  (Ref ref) {
    return LocalBoardRepository(
      isar: ref.watch(isarProvider),
      mapper: ref.watch(boardIsarMapperProvider),
    );
  },
);

final localQuestionRepositoryProvider = Provider<LocalQuestionRepository>(
  (Ref ref) {
    return LocalQuestionRepository(
      isar: ref.watch(isarProvider),
      mapper: ref.watch(questionIsarMapperProvider),
    );
  },
);

final localQuestionRoundRepositoryProvider =
    Provider<LocalQuestionRoundRepository>(
  (Ref ref) {
    return LocalQuestionRoundRepository(
      isar: ref.watch(isarProvider),
      mapper: ref.watch(questionRoundIsarMapperProvider),
    );
  },
);

final localHelperUsageRepositoryProvider =
    Provider<LocalHelperUsageRepository>(
  (Ref ref) {
    return LocalHelperUsageRepository(
      isar: ref.watch(isarProvider),
      mapper: ref.watch(helperUsageIsarMapperProvider),
    );
  },
);

final localPenaltyRepositoryProvider = Provider<LocalPenaltyRepository>(
  (Ref ref) {
    return LocalPenaltyRepository(
      isar: ref.watch(isarProvider),
      mapper: ref.watch(penaltyStateIsarMapperProvider),
    );
  },
);

final localScoreRepositoryProvider = Provider<LocalScoreRepository>(
  (Ref ref) {
    return LocalScoreRepository(
      isar: ref.watch(isarProvider),
      mapper: ref.watch(scoreIsarMapperProvider),
    );
  },
);

final quizIsarSchemasProvider = Provider<List<CollectionSchema>>(
  (Ref ref) {
    return <CollectionSchema>[
      IsarGameSessionModelSchema,
      IsarBoardModelSchema,
      IsarQuestionModelSchema,
      IsarUsedQuestionModelSchema,
      IsarQuestionRoundModelSchema,
      IsarHelperUsageModelSchema,
      IsarPenaltyStateModelSchema,
      IsarScoreModelSchema,
    ];
  },
);

final sessionRepositoryProvider = Provider(
  (Ref ref) => ref.watch(localSessionRepositoryProvider),
);

final boardRepositoryProvider = Provider(
  (Ref ref) => ref.watch(localBoardRepositoryProvider),
);

final questionRepositoryProvider = Provider(
  (Ref ref) => ref.watch(localQuestionRepositoryProvider),
);

final questionRoundRepositoryProvider = Provider(
  (Ref ref) => ref.watch(localQuestionRoundRepositoryProvider),
);

final helperUsageRepositoryProvider = Provider(
  (Ref ref) => ref.watch(localHelperUsageRepositoryProvider),
);

final penaltyRepositoryProvider = Provider(
  (Ref ref) => ref.watch(localPenaltyRepositoryProvider),
);

final scoreRepositoryProvider = Provider(
  (Ref ref) => ref.watch(localScoreRepositoryProvider),
);