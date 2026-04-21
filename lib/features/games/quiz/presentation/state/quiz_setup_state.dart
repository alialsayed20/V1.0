class QuizSetupState {
  const QuizSetupState({
    required this.teamsCount,
    required this.playersCount,
  });

  final int teamsCount;
  final int playersCount;

  List<String> get generatedTeamNames {
    return List<String>.generate(
      teamsCount,
      (int index) => 'Team ${index + 1}',
    );
  }

  QuizSetupState copyWith({
    int? teamsCount,
    int? playersCount,
  }) {
    return QuizSetupState(
      teamsCount: teamsCount ?? this.teamsCount,
      playersCount: playersCount ?? this.playersCount,
    );
  }
}