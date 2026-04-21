import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/engines/local_helper_engine.dart';
import '../../data/providers/isar_providers.dart';
import '../../domain/engines/helper_engine.dart';
import '../usecases/activate_block_steal_use_case.dart';
import '../usecases/apply_double_points_use_case.dart';
import '../usecases/block_team_answer_use_case.dart';
import '../usecases/exclude_team_from_next_turn_use_case.dart';
import '../usecases/steal_question_use_case.dart';

final helperEngineProvider = Provider<HelperEngine>(
  (Ref ref) {
    return const LocalHelperEngine();
  },
);

final activateBlockStealUseCaseProvider =
    Provider<ActivateBlockStealUseCase>(
  (Ref ref) {
    return ActivateBlockStealUseCase(
      helperUsageRepository: ref.watch(helperUsageRepositoryProvider),
      questionRoundRepository: ref.watch(questionRoundRepositoryProvider),
      helperEngine: ref.watch(helperEngineProvider),
    );
  },
);

final stealQuestionUseCaseProvider = Provider<StealQuestionUseCase>(
  (Ref ref) {
    return StealQuestionUseCase(
      helperUsageRepository: ref.watch(helperUsageRepositoryProvider),
      questionRoundRepository: ref.watch(questionRoundRepositoryProvider),
      helperEngine: ref.watch(helperEngineProvider),
    );
  },
);

final blockTeamAnswerUseCaseProvider = Provider<BlockTeamAnswerUseCase>(
  (Ref ref) {
    return BlockTeamAnswerUseCase(
      helperUsageRepository: ref.watch(helperUsageRepositoryProvider),
      questionRoundRepository: ref.watch(questionRoundRepositoryProvider),
      helperEngine: ref.watch(helperEngineProvider),
    );
  },
);

final excludeTeamFromNextTurnUseCaseProvider =
    Provider<ExcludeTeamFromNextTurnUseCase>(
  (Ref ref) {
    return ExcludeTeamFromNextTurnUseCase(
      helperUsageRepository: ref.watch(helperUsageRepositoryProvider),
      sessionRepository: ref.watch(sessionRepositoryProvider),
      helperEngine: ref.watch(helperEngineProvider),
    );
  },
);

final applyDoublePointsUseCaseProvider = Provider<ApplyDoublePointsUseCase>(
  (Ref ref) {
    return ApplyDoublePointsUseCase(
      helperUsageRepository: ref.watch(helperUsageRepositoryProvider),
      helperEngine: ref.watch(helperEngineProvider),
    );
  },
);