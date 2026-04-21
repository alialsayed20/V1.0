import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Boode'**
  String get appTitle;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Boode'**
  String get homeTitle;

  /// No description provided for @quizSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Quiz Setup'**
  String get quizSetupTitle;

  /// No description provided for @quizSetupTeamsCount.
  ///
  /// In en, this message translates to:
  /// **'Teams count'**
  String get quizSetupTeamsCount;

  /// No description provided for @quizSetupPlayersCount.
  ///
  /// In en, this message translates to:
  /// **'Players count'**
  String get quizSetupPlayersCount;

  /// No description provided for @quizSetupContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get quizSetupContinue;

  /// No description provided for @quizLotteryTitle.
  ///
  /// In en, this message translates to:
  /// **'Quiz Lottery'**
  String get quizLotteryTitle;

  /// No description provided for @quizLotterySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Teams order'**
  String get quizLotterySubtitle;

  /// No description provided for @quizLotteryTeamName.
  ///
  /// In en, this message translates to:
  /// **'Team {order}'**
  String quizLotteryTeamName(int order);

  /// No description provided for @quizCategoryPickingTitle.
  ///
  /// In en, this message translates to:
  /// **'Category Picking'**
  String get quizCategoryPickingTitle;

  /// No description provided for @quizCategoryPickingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose categories for the teams'**
  String get quizCategoryPickingSubtitle;

  /// No description provided for @quizCategoryPickingCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category {order}'**
  String quizCategoryPickingCategoryLabel(int order);

  /// No description provided for @quizBoardTitle.
  ///
  /// In en, this message translates to:
  /// **'Quiz Board'**
  String get quizBoardTitle;

  /// No description provided for @quizBoardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a question cell to start'**
  String get quizBoardSubtitle;

  /// No description provided for @quizBoardCurrentTurn.
  ///
  /// In en, this message translates to:
  /// **'Current turn: {teamName}'**
  String quizBoardCurrentTurn(String teamName);

  /// No description provided for @quizBoardBlockSteal.
  ///
  /// In en, this message translates to:
  /// **'Block Steal'**
  String get quizBoardBlockSteal;

  /// No description provided for @quizBoardDoublePoints.
  ///
  /// In en, this message translates to:
  /// **'Double Points'**
  String get quizBoardDoublePoints;

  /// No description provided for @quizBoardExcludeNextTurn.
  ///
  /// In en, this message translates to:
  /// **'Exclude Next Turn'**
  String get quizBoardExcludeNextTurn;

  /// No description provided for @quizQuestionTitle.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get quizQuestionTitle;

  /// No description provided for @quizQuestionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Current question round'**
  String get quizQuestionSubtitle;

  /// No description provided for @quizQuestionPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Question content will appear here'**
  String get quizQuestionPlaceholder;

  /// No description provided for @quizQuestionRevealAnswer.
  ///
  /// In en, this message translates to:
  /// **'Reveal answer'**
  String get quizQuestionRevealAnswer;

  /// No description provided for @quizQuestionOpeningTeam.
  ///
  /// In en, this message translates to:
  /// **'Opening team: {teamName}'**
  String quizQuestionOpeningTeam(String teamName);

  /// No description provided for @quizQuestionAnswerOrder.
  ///
  /// In en, this message translates to:
  /// **'Answer order: {teams}'**
  String quizQuestionAnswerOrder(String teams);

  /// No description provided for @quizQuestionBlockedTeams.
  ///
  /// In en, this message translates to:
  /// **'Blocked teams: {teams}'**
  String quizQuestionBlockedTeams(String teams);

  /// No description provided for @quizQuestionStealBlocked.
  ///
  /// In en, this message translates to:
  /// **'Steal is blocked'**
  String get quizQuestionStealBlocked;

  /// No description provided for @quizQuestionStealAvailable.
  ///
  /// In en, this message translates to:
  /// **'Steal is available'**
  String get quizQuestionStealAvailable;

  /// No description provided for @quizQuestionBlockAnswer.
  ///
  /// In en, this message translates to:
  /// **'Block Team Answer'**
  String get quizQuestionBlockAnswer;

  /// No description provided for @quizQuestionSteal.
  ///
  /// In en, this message translates to:
  /// **'Steal Question'**
  String get quizQuestionSteal;

  /// No description provided for @quizResultTitle.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get quizResultTitle;

  /// No description provided for @quizResultSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Round outcome'**
  String get quizResultSubtitle;

  /// No description provided for @quizResultWinnerLabel.
  ///
  /// In en, this message translates to:
  /// **'Winner'**
  String get quizResultWinnerLabel;

  /// No description provided for @quizResultFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get quizResultFinish;

  /// No description provided for @quizResultCorrect.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get quizResultCorrect;

  /// No description provided for @quizResultIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Incorrect'**
  String get quizResultIncorrect;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
