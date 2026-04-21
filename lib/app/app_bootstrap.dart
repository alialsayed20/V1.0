import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../features/games/quiz/data/models/isar_board_model.dart';
import '../features/games/quiz/data/models/isar_game_session_model.dart';
import '../features/games/quiz/data/models/isar_helper_usage_model.dart';
import '../features/games/quiz/data/models/isar_penalty_state_model.dart';
import '../features/games/quiz/data/models/isar_question_model.dart';
import '../features/games/quiz/data/models/isar_question_round_model.dart';
import '../features/games/quiz/data/models/isar_score_model.dart';
import '../features/games/quiz/data/models/isar_used_question_model.dart';
import '../features/games/quiz/data/providers/isar_providers.dart';

class AppBootstrap {
  const AppBootstrap._();

  static Future<ProviderContainer> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    final Directory appDirectory = await getApplicationDocumentsDirectory();

    final Isar isar = await Isar.open(
      <CollectionSchema>[
        IsarGameSessionModelSchema,
        IsarBoardModelSchema,
        IsarQuestionModelSchema,
        IsarUsedQuestionModelSchema,
        IsarQuestionRoundModelSchema,
        IsarHelperUsageModelSchema,
        IsarPenaltyStateModelSchema,
        IsarScoreModelSchema,
      ],
      directory: appDirectory.path,
      name: 'boode_db',
      inspector: true,
    );

    return ProviderContainer(
      overrides: <Override>[
        isarProvider.overrideWithValue(isar),
      ],
    );
  }
}