import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/engines/local_question_engine.dart';
import '../../data/providers/isar_providers.dart';
import '../../domain/engines/question_engine.dart';
import '../usecases/close_question_round_use_case.dart';
import '../usecases/get_active_question_round_use_case.dart';
import '../usecases/get_question_by_id_use_case.dart';
import '../usecases/open_question_use_case.dart';
import '../usecases/reveal_question_answer_use_case.dart';
import '../usecases/seed_mock_questions_use_case.dart';
import '../usecases/start_question_answering_use_case.dart';
import '../usecases/start_question_timer_use_case.dart';

final questionEngineProvider = Provider<QuestionEngine>(
  (Ref ref) {
    return const LocalQuestionEngine();
  },
);

final seedMockQuestionsUseCaseProvider =
    Provider<SeedMockQuestionsUseCase>((Ref ref) {
  return SeedMockQuestionsUseCase(
    questionRepository: ref.watch(questionRepositoryProvider),
  );
});

final getQuestionByIdUseCaseProvider = Provider<GetQuestionByIdUseCase>(
  (Ref ref) {
    return GetQuestionByIdUseCase(
      questionRepository: ref.watch(questionRepositoryProvider),
    );
  },
);

final getActiveQuestionRoundUseCaseProvider =
    Provider<GetActiveQuestionRoundUseCase>(
  (Ref ref) {
    return GetActiveQuestionRoundUseCase(
      questionRoundRepository: ref.watch(questionRoundRepositoryProvider),
    );
  },
);

final openQuestionUseCaseProvider = Provider<OpenQuestionUseCase>(
  (Ref ref) {
    return OpenQuestionUseCase(
      sessionRepository: ref.watch(sessionRepositoryProvider),
      boardRepository: ref.watch(boardRepositoryProvider),
      questionRepository: ref.watch(questionRepositoryProvider),
      questionRoundRepository: ref.watch(questionRoundRepositoryProvider),
      questionEngine: ref.watch(questionEngineProvider),
    );
  },
);

final startQuestionTimerUseCaseProvider = Provider<StartQuestionTimerUseCase>(
  (Ref ref) {
    return StartQuestionTimerUseCase(
      questionRoundRepository: ref.watch(questionRoundRepositoryProvider),
      questionEngine: ref.watch(questionEngineProvider),
    );
  },
);

final startQuestionAnsweringUseCaseProvider =
    Provider<StartQuestionAnsweringUseCase>(
  (Ref ref) {
    return StartQuestionAnsweringUseCase(
      questionRoundRepository: ref.watch(questionRoundRepositoryProvider),
      questionEngine: ref.watch(questionEngineProvider),
    );
  },
);

final revealQuestionAnswerUseCaseProvider =
    Provider<RevealQuestionAnswerUseCase>(
  (Ref ref) {
    return RevealQuestionAnswerUseCase(
      questionRoundRepository: ref.watch(questionRoundRepositoryProvider),
      questionEngine: ref.watch(questionEngineProvider),
    );
  },
);

final closeQuestionRoundUseCaseProvider = Provider<CloseQuestionRoundUseCase>(
  (Ref ref) {
    return CloseQuestionRoundUseCase(
      questionRoundRepository: ref.watch(questionRoundRepositoryProvider),
      questionEngine: ref.watch(questionEngineProvider),
    );
  },
);