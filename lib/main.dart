import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days_workout/providers/account_provider.dart';
import 'package:thirty_days_workout/providers/bmi_provider.dart';
import 'package:thirty_days_workout/providers/bottom_nav_provider.dart';
import 'package:thirty_days_workout/providers/gym_exercises_provider.dart';
import 'package:thirty_days_workout/providers/home_everyday_provider.dart';
import 'package:thirty_days_workout/providers/home_provider.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/account_screens/save_gym_progress.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/diet_screens/gym_screens/gym_diet_plan.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/diet_screens/gym_screens/gym_diet_plan_days.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/diet_screens/weight_gain_screens/weight_gain_diet_plan_days.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/diet_screens/weight_gain_screens/weight_gain_plan.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/diet_screens/weight_loss_screens/weight_loss_plan_days.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/diet_screens/weight_loss_screens/weight_loss_plan.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/health_tips_screens/adult_tips.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/health_tips_screens/beauty_tips.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/health_tips_screens/living_tips.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/health_tips_screens/nutrition_tips.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/health_tips_screens/pregnancy_tips.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/health_tips_screens/yoga_tips.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/home_screens/home_everyday_exercise.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/home_screens/home_everyday_youtubevideo.dart';
import 'package:thirty_days_workout/screens/dashboard/dashboard.dart';
import 'package:thirty_days_workout/helpers/custom_page_route.dart';
import 'package:thirty_days_workout/screens/splash_screen/splash_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

/// In pod File at top platform :ios, '9.0' uncomment and write '9.0' to '10.0' ///

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => BmiProvider()),
        ChangeNotifierProvider(create: (_) => BmiAgeProvider()),
        ChangeNotifierProvider(create: (_) => BmiResultInBlurProvider()),
        ChangeNotifierProvider(create: (_) => BmiWeightProvider()),
        ChangeNotifierProvider(create: (_) => BmiHeightProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => HomeEveryDayProvider()),
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (_) => GymExercisesFullProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        onGenerateRoute: (RouteSettings settings) {
          /// Health Routes Start///

          /// LivingTips Route
          if (settings.name == livingTipsRoute) {
            return CustomPageRoute(
              child: const LivingTips(),
              direction: AxisDirection.up,
            );
          }

          /// NutritionTips Route
          if (settings.name == nutritionTipsRoute) {
            return CustomPageRoute(
              child: const NutritionTips(),
              direction: AxisDirection.up,
            );
          }

          /// YogaTips Route
          if (settings.name == yogaTipsRoute) {
            return CustomPageRoute(
              child: const YogaTips(),
              direction: AxisDirection.up,
            );
          }

          /// AdultTips Route
          if (settings.name == adultTipsRoute) {
            return CustomPageRoute(
              child: const AdultTips(),
              direction: AxisDirection.up,
            );
          }

          /// PregnancyTips Route
          if (settings.name == pregnancyTipsRoute) {
            return CustomPageRoute(
              child: const PregnancyTips(),
              direction: AxisDirection.up,
            );
          }

          /// BeautyTips Route
          if (settings.name == beautyTipsRoute) {
            return CustomPageRoute(
              child: const BeautyTips(),
              direction: AxisDirection.up,
            );
          }

          /// Health Routes End ///

          /// DashBoard Route
          if (settings.name == dashBoardRoute) {
            return CustomPageRoute(
              child: const MyHomePage(),
              direction: AxisDirection.left,
            );
          }

          /// Gym Routes Start ///
          /// GymDietPlan Route
          if (settings.name == gymDietPlanRoute) {
            return MaterialPageRoute(builder: (context) => const GymDietPlan());
          }

          /// GymDietDays Route
          if (settings.name == gymDietPlanDaysRoute) {
            final results = settings.arguments as Map;
            final int daynumber = results['daynumber'];
            return CustomPageRoute(
              direction: AxisDirection.up,
              child: GymDietPlanDays(
                daynumber: daynumber,
              ),
            );
          }

          /// WeightGain Routes Start ///
          /// weightGain Route
          if (settings.name == weightGainRoute) {
            return MaterialPageRoute(
                builder: (context) => const WeightGainPlan());
          }

          /// WeightGainDietDays Route
          if (settings.name == weightGainDaysRoute) {
            final results = settings.arguments as Map;
            final int daynumber = results['daynumber'];
            return CustomPageRoute(
              direction: AxisDirection.up,
              child: WeightGainDietPlanDays(
                daynumber: daynumber,
              ),
            );
          }

          /// WeightLoss Routes Start ///
          if (settings.name == weightLossPlanRoute) {
            return MaterialPageRoute(
                builder: (context) => const WeightLossPlan());
          }

          /// WeightLossDays Route
          if (settings.name == weightLossPlanDaysRoute) {
            final results = settings.arguments as Map;
            final int daynumber = results['daynumber'];
            return CustomPageRoute(
              direction: AxisDirection.up,
              child: WeightLossDietPlanDays(
                daynumber: daynumber,
              ),
            );
          }

          /// Home Routes Start ///
          if (settings.name == homeEveryDayExerciseRoute) {
            final results = settings.arguments as Map;
            final int daynumber = results['daynumber'];
            return CustomPageRoute(
              direction: AxisDirection.up,
              child: homeEveryDayExercise(
                daynumber: daynumber,
              ),
            );
          }

          /// Home EveryDay Excercise watch YouTube Video
          if (settings.name == homeEveryDayYoutubeVideoRoute) {
            final results = settings.arguments as Map;
            final String videoLink = results['videoLink'];
            final String title = results['title'];
            final String description = results['description'];
            return CustomPageRoute(
              direction: AxisDirection.up,
              child: HomeEveryDayYoutubeVideo(
                videoLink: videoLink,
                title: title,
                description: description,
              ),
            );
          }

          /// Gym Progress Screen ///
          if (settings.name == gymProgressRoute) {
            return MaterialPageRoute(builder: (context) => GymProgress());
          }

          /// End
          return null;
        },
      ),
    );
  }
}

/// Health Pages Route
const String livingTipsRoute = '/livingTipsRoute';
const String nutritionTipsRoute = '/nutritionTipsRoute';
const String yogaTipsRoute = '/yogaTipsRoute';
const String adultTipsRoute = '/adultTipsRoute';
const String pregnancyTipsRoute = '/pregnancyTipsRoute';
const String beautyTipsRoute = '/beautyTipsRoute';

///
/// Dashboard Page Route
const String dashBoardRoute = '/dashBoardRoute';

/// DietPages Routes ///
///
/// Gym Pages Route
const String gymDietPlanRoute = '/gymDietPlanRoute';
const String gymDietPlanDaysRoute = '/gymDietPlanDaysRoute';

///
/// WeightGain Pages Route
const String weightGainRoute = '/weightGainRoute';
const String weightGainDaysRoute = '/weightGainDaysRoute';

///
/// WeightLoss Pages Route
const String weightLossPlanRoute = '/weightLossPlanRoute';
const String weightLossPlanDaysRoute = '/weightLossPlanDaysRoute';

///
/// HomePages Routes ///
const String homeEveryDayExerciseRoute = '/homeEveryDayExerciseRoute';
const String homeEveryDayYoutubeVideoRoute = '/homeEveryDayYoutubeVideoRoute';

///
/// AccountPages Routes ///
const String gymProgressRoute = '/gymProgressRoute';
