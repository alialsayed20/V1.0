import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/engines/local_turn_engine.dart';
import '../../data/providers/isar_providers.dart';
import '../../domain/engines/turn_engine.dart';
import '../usecases/advance_turn_use_case.dart';

final turnEngineProvider = Provider<TurnEngine>(
  (Ref ref) {
    return const LocalTurnEngine();
  },
);

final advanceTurnUseCaseProvider = Provider<AdvanceTurnUseCase>(
  (Ref ref) {
    return AdvanceTurnUseCase(
      sessionRepository: ref.watch(sessionRepositoryProvider),
      turnEngine: ref.watch(turnEngineProvider),
    );
  },
);