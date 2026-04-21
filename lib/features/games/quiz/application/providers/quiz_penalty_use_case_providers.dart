import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/engines/local_penalty_engine.dart';
import '../../data/providers/isar_providers.dart';
import '../../domain/engines/penalty_engine.dart';
import '../usecases/apply_cheating_penalty_use_case.dart';
import '../usecases/apply_early_answer_penalty_use_case.dart';

final penaltyEngineProvider = Provider<PenaltyEngine>(
  (Ref ref) {
    return const LocalPenaltyEngine();
  },
);

final applyEarlyAnswerPenaltyUseCaseProvider =
    Provider<ApplyEarlyAnswerPenaltyUseCase>(
  (Ref ref) {
    return ApplyEarlyAnswerPenaltyUseCase(
      penaltyRepository: ref.watch(penaltyRepositoryProvider),
      questionRoundRepository: ref.watch(questionRoundRepositoryProvider),
      penaltyEngine: ref.watch(penaltyEngineProvider),
    );
  },
);

final applyCheatingPenaltyUseCaseProvider =
    Provider<ApplyCheatingPenaltyUseCase>(
  (Ref ref) {
    return ApplyCheatingPenaltyUseCase(
      penaltyRepository: ref.watch(penaltyRepositoryProvider),
      questionRoundRepository: ref.watch(questionRoundRepositoryProvider),
      sessionRepository: ref.watch(sessionRepositoryProvider),
      penaltyEngine: ref.watch(penaltyEngineProvider),
    );
  },
);