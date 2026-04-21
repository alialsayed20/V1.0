import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/engines/local_board_engine.dart';
import '../../data/providers/isar_providers.dart';
import '../../domain/engines/board_engine.dart';
import '../usecases/create_initial_board_use_case.dart';
import '../usecases/get_board_by_session_id_use_case.dart';
import '../usecases/mark_board_cell_correct_use_case.dart';
import '../usecases/mark_board_cell_incorrect_use_case.dart';

final boardEngineProvider = Provider<BoardEngine>(
  (Ref ref) {
    return const LocalBoardEngine();
  },
);

final createInitialBoardUseCaseProvider = Provider<CreateInitialBoardUseCase>(
  (Ref ref) {
    return CreateInitialBoardUseCase(
      boardRepository: ref.watch(boardRepositoryProvider),
    );
  },
);

final getBoardBySessionIdUseCaseProvider =
    Provider<GetBoardBySessionIdUseCase>(
  (Ref ref) {
    return GetBoardBySessionIdUseCase(
      boardRepository: ref.watch(boardRepositoryProvider),
    );
  },
);

final markBoardCellCorrectUseCaseProvider =
    Provider<MarkBoardCellCorrectUseCase>(
  (Ref ref) {
    return MarkBoardCellCorrectUseCase(
      boardRepository: ref.watch(boardRepositoryProvider),
      boardEngine: ref.watch(boardEngineProvider),
    );
  },
);

final markBoardCellIncorrectUseCaseProvider =
    Provider<MarkBoardCellIncorrectUseCase>(
  (Ref ref) {
    return MarkBoardCellIncorrectUseCase(
      boardRepository: ref.watch(boardRepositoryProvider),
      boardEngine: ref.watch(boardEngineProvider),
    );
  },
);