import 'package:boode/features/games/quiz/presentation/screens/quiz_board_screen.dart';
import 'package:boode/features/games/quiz/presentation/screens/quiz_category_picking_screen.dart';
import 'package:boode/features/games/quiz/presentation/screens/quiz_lottery_screen.dart';
import 'package:boode/features/games/quiz/presentation/screens/quiz_question_screen.dart';
import 'package:boode/features/games/quiz/presentation/screens/quiz_result_screen.dart';
import 'package:boode/features/games/quiz/presentation/screens/quiz_setup_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const QuizSetupScreen();
      },
    ),
    GoRoute(
      path: '/quiz-lottery',
      builder: (context, state) {
        return const QuizLotteryScreen();
      },
    ),
    GoRoute(
      path: '/quiz-category-picking',
      builder: (context, state) {
        return const QuizCategoryPickingScreen();
      },
    ),
    GoRoute(
      path: '/quiz-board',
      builder: (context, state) {
        return const QuizBoardScreen();
      },
    ),
    GoRoute(
      path: '/quiz-question',
      builder: (context, state) {
        return const QuizQuestionScreen();
      },
    ),
    GoRoute(
      path: '/quiz-result',
      builder: (context, state) {
        return const QuizResultScreen();
      },
    ),
  ],
);