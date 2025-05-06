import 'package:get/get.dart';

import '../modules/diary/bindings/diary_binding.dart';
import '../modules/diary/views/diary_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/landing/bindings/landing_binding.dart';
import '../modules/landing/views/landing_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/bindings/login_v2_binding.dart';
import '../modules/login/views/login_v2_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/module/bindings/module_binding.dart';
import '../modules/module/bindings/module_learning_binding.dart';
import '../modules/module/bindings/module_level_binding.dart';
import '../modules/module/bindings/module_loading_binding.dart';
import '../modules/module/bindings/module_quiz_binding.dart';
import '../modules/module/bindings/module_quiz_rule_binding.dart';
import '../modules/module/bindings/module_reward_binding.dart';
import '../modules/module/views/module_learning_view.dart';
import '../modules/module/views/module_level_view.dart';
import '../modules/module/views/module_loading_view.dart';
import '../modules/module/views/module_quiz_rule_view.dart';
import '../modules/module/views/module_quiz_view.dart';
import '../modules/module/views/module_reward_view.dart';
import '../modules/module/views/module_view.dart';
import '../modules/mood/bindings/first_mood_binding.dart';
import '../modules/mood/bindings/mood_binding.dart';
import '../modules/mood/bindings/result_mood_binding.dart';
import '../modules/mood/views/first_mood_view.dart';
import '../modules/mood/views/mood_view.dart';
import '../modules/mood/views/result_mood_view.dart';
import '../modules/my_diary/bindings/my_diary_binding.dart';
import '../modules/my_diary/bindings/my_diary_detail_binding.dart';
import '../modules/my_diary/views/my_diary_detail_view.dart';
import '../modules/my_diary/views/my_diary_view.dart';
import '../modules/my_period/bindings/my_period_binding.dart';
import '../modules/my_period/bindings/my_period_detail_binding.dart';
import '../modules/my_period/views/my_period_detail_view.dart';
import '../modules/my_period/views/my_period_view.dart';
import '../modules/my_period_calendar/bindings/my_period_calendar_binding.dart';
import '../modules/my_period_calendar/views/my_period_calendar_view.dart';
import '../modules/my_phobia_list/bindings/my_phobia_list_binding.dart';
import '../modules/my_phobia_list/views/my_phobia_list_view.dart';
import '../modules/my_record/bindings/my_record_binding.dart';
import '../modules/my_record/bindings/my_record_detail_binding.dart';
import '../modules/my_record/views/my_record_detail_view.dart';
import '../modules/my_record/views/my_record_view.dart';
import '../modules/my_wish_list/bindings/my_wish_list_binding.dart';
import '../modules/my_wish_list/views/my_wish_list_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/period/bindings/period_binding.dart';
import '../modules/period/views/period_view.dart';
import '../modules/regis/bindings/regis_binding.dart';
import '../modules/regis/bindings/regis_onboarding_binding.dart';
import '../modules/regis/bindings/regis_v2_binding.dart';
import '../modules/regis/views/regis_onboarding_view.dart';
import '../modules/regis/views/regis_v2_view.dart';
import '../modules/regis/views/regis_view.dart';
import '../modules/report/bindings/report_binding.dart';
import '../modules/report/views/report_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/unity/bindings/unity_binding.dart';
import '../modules/unity/views/unity_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGIS,
      page: () => const RegisView(),
      binding: RegisBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.MOOD,
      page: () => const MoodView(),
      binding: MoodBinding(),
    ),
    GetPage(
      name: _Paths.PERIOD,
      page: () => const PeriodView(),
      binding: PeriodBinding(),
    ),
    GetPage(
      name: _Paths.MY_PERIOD,
      page: () => const MyPeriodView(),
      binding: MyPeriodBinding(),
    ),
    GetPage(
      name: _Paths.MY_RECORD,
      page: () => const MyRecordView(),
      binding: MyRecordBinding(),
    ),
    GetPage(
      name: _Paths.MY_RECORD_DETAIL,
      page: () => const MyRecordDetailView(),
      binding: MyRecordDetailBinding(),
    ),
    GetPage(
      name: _Paths.MY_PERIOD_DETAIL,
      page: () => const MyPeriodDetailView(),
      binding: MyPeriodDetailBinding(),
    ),
    GetPage(
      name: _Paths.FIRST_MOOD,
      page: () => const FirstMoodView(),
      binding: FirstMoodBinding(),
    ),
    GetPage(
      name: _Paths.RESULT_MOOD,
      page: () => const ResultMoodView(),
      binding: ResultMoodBinding(),
    ),
    GetPage(
      name: _Paths.MY_DIARY,
      page: () => const MyDiaryView(),
      binding: MyDiaryBinding(),
    ),
    GetPage(
      name: _Paths.DIARY,
      page: () => const DiaryView(),
      binding: DiaryBinding(),
    ),
    GetPage(
      name: _Paths.MY_DIARY_DETAIL,
      page: () => const MyDiaryDetailView(),
      binding: MyDiaryDetailBinding(),
    ),
    GetPage(
      name: _Paths.MY_WISH_LIST,
      page: () => const MyWishListView(),
      binding: MyWishListBinding(),
    ),
    GetPage(
      name: _Paths.MY_PHOBIA_LIST,
      page: () => const MyPhobiaListView(),
      binding: MyPhobiaListBinding(),
    ),
    GetPage(
      name: _Paths.MODULE,
      page: () => const ModuleView(),
      binding: ModuleBinding(),
    ),
    GetPage(
      name: _Paths.MODULE_LEVEL,
      page: () => const ModuleLevelView(),
      binding: ModuleLevelBinding(),
    ),
    GetPage(
      name: _Paths.MODULE_LOADING,
      page: () => const ModuleLoadingView(),
      binding: ModuleLoadingBinding(),
    ),
    GetPage(
      name: _Paths.MODULE_QUIZ_RULE,
      page: () => const ModuleQuizRuleView(),
      binding: ModuleQuizRuleBinding(),
    ),
    GetPage(
      name: _Paths.MODULE_QUIZ,
      page: () => const ModuleQuizView(),
      binding: ModuleQuizBinding(),
    ),
    GetPage(
      name: _Paths.MODULE_LEARNING,
      page: () => const ModuleLearningView(),
      binding: ModuleLearningBinding(),
    ),
    GetPage(
      name: _Paths.MODULE_REWARD,
      page: () => const ModuleRewardView(),
      binding: ModuleRewardBinding(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () => const LandingView(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_V2,
      page: () => const LoginV2View(),
      binding: LoginV2Binding(),
    ),
    GetPage(
      name: _Paths.REGIS_ONBOARDING,
      page: () => const RegisOnboardingView(),
      binding: RegisOnboardingBinding(),
    ),
    GetPage(
      name: _Paths.REGIS_V2,
      page: () => const RegisV2View(),
      binding: RegisV2Binding(),
    ),
    GetPage(
      name: _Paths.UNITY,
      page: () => const UnityView(),
      binding: UnityBinding(),
    ),
    GetPage(
      name: _Paths.MY_PERIOD_CALENDAR,
      page: () => const MyPeriodCalendarView(),
      binding: MyPeriodCalendarBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => const ReportView(),
      binding: ReportBinding(),
    ),
  ];
}
