import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers/isar_providers.dart';
import '../usecases/finish_quiz_session_use_case.dart';
import '../usecases/open_board_use_case.dart';
import '../usecases/open_category_picking_use_case.dart';
import '../usecases/run_quiz_lottery_use_case.dart';
import '../usecases/start_quiz_session_use_case.dart';



final startQuizSessionUseCaseProvider = Provider<StartQuizSessionUseCase>(
  (Ref ref) {
    return StartQuizSessionUseCase(
      sessionRepository: ref.watch(sessionRepositoryProvider),
    );
  },
);

final runQuizLotteryUseCaseProvider = Provider<RunQuizLotteryUseCase>(
  (Ref ref) {
    return RunQuizLotteryUseCase(
      sessionRepository: ref.watch(sessionRepositoryProvider),
    );
  },
);

final openCategoryPickingUseCaseProvider =
    Provider<OpenCategoryPickingUseCase>(
  (Ref ref) {
    return OpenCategoryPickingUseCase(
      sessionRepository: ref.watch(sessionRepositoryProvider),
    );
  },
);

final openBoardUseCaseProvider = Provider<OpenBoardUseCase>(
  (Ref ref) {
    return OpenBoardUseCase(
      sessionRepository: ref.watch(sessionRepositoryProvider),
    );
  },
);

final finishQuizSessionUseCaseProvider = Provider<FinishQuizSessionUseCase>(
  (Ref ref) {
    return FinishQuizSessionUseCase(
      sessionRepository: ref.watch(sessionRepositoryProvider),
    );
  },
);