import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/state/quiz_setup_state.dart';

final quizSetupControllerProvider =
    StateNotifierProvider<QuizSetupController, QuizSetupState>(
  (Ref ref) {
    return QuizSetupController();
  },
);

class QuizSetupController extends StateNotifier<QuizSetupState> {
  QuizSetupController()
      : super(
          const QuizSetupState(
            teamsCount: 2,
            playersCount: 2,
          ),
        );

  static const int _minTeams = 2;
  static const int _maxTeams = 7;
  static const int _minPlayers = 2;
  static const int _maxPlayers = 35;

  void incrementTeams() {
    if (state.teamsCount >= _maxTeams) {
      return;
    }

    state = state.copyWith(
      teamsCount: state.teamsCount + 1,
    );
  }

  void decrementTeams() {
    if (state.teamsCount <= _minTeams) {
      return;
    }

    state = state.copyWith(
      teamsCount: state.teamsCount - 1,
    );
  }

  void incrementPlayers() {
    if (state.playersCount >= _maxPlayers) {
      return;
    }

    state = state.copyWith(
      playersCount: state.playersCount + 1,
    );
  }

  void decrementPlayers() {
    if (state.playersCount <= _minPlayers) {
      return;
    }

    state = state.copyWith(
      playersCount: state.playersCount - 1,
    );
  }

  void setTeamsCount(int value) {
    if (value < _minTeams || value > _maxTeams) {
      return;
    }

    state = state.copyWith(
      teamsCount: value,
    );
  }

  void setPlayersCount(int value) {
    if (value < _minPlayers || value > _maxPlayers) {
      return;
    }

    state = state.copyWith(
      playersCount: value,
    );
  }

  void reset() {
    state = const QuizSetupState(
      teamsCount: 2,
      playersCount: 2,
    );
  }
}