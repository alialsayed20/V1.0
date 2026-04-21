// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Boode';

  @override
  String get homeTitle => 'Boode';

  @override
  String get quizSetupTitle => 'Quiz Setup';

  @override
  String get quizSetupTeamsCount => 'Teams count';

  @override
  String get quizSetupPlayersCount => 'Players count';

  @override
  String get quizSetupContinue => 'Continue';

  @override
  String get quizLotteryTitle => 'Quiz Lottery';

  @override
  String get quizLotterySubtitle => 'Teams order';

  @override
  String quizLotteryTeamName(int order) {
    return 'Team $order';
  }

  @override
  String get quizCategoryPickingTitle => 'Category Picking';

  @override
  String get quizCategoryPickingSubtitle => 'Choose categories for the teams';

  @override
  String quizCategoryPickingCategoryLabel(int order) {
    return 'Category $order';
  }

  @override
  String get quizBoardTitle => 'Quiz Board';

  @override
  String get quizBoardSubtitle => 'Choose a question cell to start';

  @override
  String quizBoardCurrentTurn(String teamName) {
    return 'Current turn: $teamName';
  }

  @override
  String get quizBoardBlockSteal => 'Block Steal';

  @override
  String get quizBoardDoublePoints => 'Double Points';

  @override
  String get quizBoardExcludeNextTurn => 'Exclude Next Turn';

  @override
  String get quizQuestionTitle => 'Question';

  @override
  String get quizQuestionSubtitle => 'Current question round';

  @override
  String get quizQuestionPlaceholder => 'Question content will appear here';

  @override
  String get quizQuestionRevealAnswer => 'Reveal answer';

  @override
  String quizQuestionOpeningTeam(String teamName) {
    return 'Opening team: $teamName';
  }

  @override
  String quizQuestionAnswerOrder(String teams) {
    return 'Answer order: $teams';
  }

  @override
  String quizQuestionBlockedTeams(String teams) {
    return 'Blocked teams: $teams';
  }

  @override
  String get quizQuestionStealBlocked => 'Steal is blocked';

  @override
  String get quizQuestionStealAvailable => 'Steal is available';

  @override
  String get quizQuestionBlockAnswer => 'Block Team Answer';

  @override
  String get quizQuestionSteal => 'Steal Question';

  @override
  String get quizResultTitle => 'Result';

  @override
  String get quizResultSubtitle => 'Round outcome';

  @override
  String get quizResultWinnerLabel => 'Winner';

  @override
  String get quizResultFinish => 'Finish';

  @override
  String get quizResultCorrect => 'Correct';

  @override
  String get quizResultIncorrect => 'Incorrect';
}
