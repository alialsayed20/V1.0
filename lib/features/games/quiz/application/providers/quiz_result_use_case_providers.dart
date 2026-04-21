import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/engines/local_result_engine.dart';
import '../../data/providers/isar_providers.dart';
import '../../domain/engines/result_engine.dart';
import '../usecases/build_session_score_summaries_use_case.dart';
import '../usecases/determine_winner_use_case.dart';

final resultEngineProvider = Provider<ResultEngine>(
  (Ref ref) {
    return const LocalResultEngine();
  },
);

final buildSessionScoreSummariesUseCaseProvider =
    Provider<BuildSessionScoreSummariesUseCase>(
  (Ref ref) {
    return BuildSessionScoreSummariesUseCase(
      resultEngine: ref.watch(resultEngineProvider),
      scoreRepository: ref.watch(scoreRepositoryProvider),
    );
  },
);

final determineWinnerUseCaseProvider = Provider<DetermineWinnerUseCase>(
  (Ref ref) {
    return DetermineWinnerUseCase(
      resultEngine: ref.watch(resultEngineProvider),
    );
  },
);