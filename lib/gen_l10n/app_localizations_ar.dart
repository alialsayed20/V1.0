// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'بودي';

  @override
  String get homeTitle => 'بودي';

  @override
  String get quizSetupTitle => 'إعداد لعبة الأسئلة';

  @override
  String get quizSetupTeamsCount => 'عدد الفرق';

  @override
  String get quizSetupPlayersCount => 'عدد اللاعبين';

  @override
  String get quizSetupContinue => 'متابعة';

  @override
  String get quizLotteryTitle => 'قرعة اللعبة';

  @override
  String get quizLotterySubtitle => 'ترتيب الفرق';

  @override
  String quizLotteryTeamName(int order) {
    return 'الفريق $order';
  }

  @override
  String get quizCategoryPickingTitle => 'اختيار الأقسام';

  @override
  String get quizCategoryPickingSubtitle => 'اختر الأقسام الخاصة بالفرق';

  @override
  String quizCategoryPickingCategoryLabel(int order) {
    return 'القسم $order';
  }

  @override
  String get quizBoardTitle => 'بورد اللعبة';

  @override
  String get quizBoardSubtitle => 'اختر خلية سؤال للبدء';

  @override
  String quizBoardCurrentTurn(String teamName) {
    return 'الدور الحالي: $teamName';
  }

  @override
  String get quizBoardBlockSteal => 'منع السرقة';

  @override
  String get quizBoardDoublePoints => 'دبل النقاط';

  @override
  String get quizBoardExcludeNextTurn => 'إيقاف الدور القادم';

  @override
  String get quizQuestionTitle => 'السؤال';

  @override
  String get quizQuestionSubtitle => 'جولة السؤال الحالية';

  @override
  String get quizQuestionPlaceholder => 'سيظهر محتوى السؤال هنا';

  @override
  String get quizQuestionRevealAnswer => 'إظهار الإجابة';

  @override
  String quizQuestionOpeningTeam(String teamName) {
    return 'الفريق الفاتح: $teamName';
  }

  @override
  String quizQuestionAnswerOrder(String teams) {
    return 'ترتيب الإجابة: $teams';
  }

  @override
  String quizQuestionBlockedTeams(String teams) {
    return 'الفرق الممنوعة: $teams';
  }

  @override
  String get quizQuestionStealBlocked => 'السرقة ممنوعة';

  @override
  String get quizQuestionStealAvailable => 'السرقة متاحة';

  @override
  String get quizQuestionBlockAnswer => 'منع فريق من الإجابة';

  @override
  String get quizQuestionSteal => 'سرقة السؤال';

  @override
  String get quizResultTitle => 'النتيجة';

  @override
  String get quizResultSubtitle => 'نتيجة الجولة';

  @override
  String get quizResultWinnerLabel => 'الفائز';

  @override
  String get quizResultFinish => 'إنهاء';

  @override
  String get quizResultCorrect => 'إجابة صحيحة';

  @override
  String get quizResultIncorrect => 'إجابة خاطئة';
}
