// ignore_for_file: duplicate_ignore

import 'package:status/core/utils/initial_bindings.dart';
import 'package:status/presentation/about_us_screen/about_us_screen.dart';
import 'package:status/presentation/about_us_screen/binding/about_us_binding.dart';
import 'package:status/presentation/change_password_screen/binding/change_password_binding.dart';
import 'package:status/presentation/change_password_screen/chnage_password_screen.dart';
import 'package:status/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:status/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:status/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:status/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:status/presentation/help_line_number_screen/binding/help_line_number_binding.dart';
import 'package:status/presentation/help_line_number_screen/help_line_number_screen.dart';
import 'package:status/presentation/insights_screen_page/insights_screen_page.dart';
import 'package:status/presentation/login_screen/binding/login_binding.dart';
import 'package:status/presentation/login_screen/login_screen.dart';
import 'package:status/presentation/my_profile_screen/my_profile_screen.dart';
import 'package:status/presentation/onbording_screen/onbording_screen.dart';
import 'package:status/presentation/poll_details_screen/binding/poll_details_binding.dart';
import 'package:status/presentation/poll_details_screen/poll_details_screen.dart';
import 'package:status/presentation/popular_creators_screen/binding/popular_creators_binding.dart';
import 'package:status/presentation/popular_creators_screen/popular_creators_screen.dart';
import 'package:status/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:status/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:status/presentation/splash_screen/splash_screen.dart';
import 'package:status/presentation/terms_conditions_screen/terms_conditions_screen.dart';
import 'package:status/presentation/verification_screen/binding/verification_binding.dart';
import 'package:status/presentation/verification_screen/verification_screen.dart';

import '../core/app_export.dart';
import '../presentation/add_new_poll_answer_screen_page/add_new_poll_answer_screen_page.dart';
import '../presentation/add_new_poll_answer_screen_page/binding/add_new_poll_binding.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import '../presentation/home_screen_container_screen/binding/home_screen_container_binding.dart';
import '../presentation/home_screen_container_screen/home_screen_container_screen.dart';
import '../presentation/latest_poll_screen/binding/latest_poll_binding.dart';
import '../presentation/latest_poll_screen/latest_poll_screen.dart';
import '../presentation/my_profile_screen/binding/my_profile_binding.dart';
import '../presentation/notifications_screen/binding/notifications_binding.dart';
import '../presentation/notifications_screen/notifications_screen.dart';
import '../presentation/onbording_screen/binding/onboarding_binding.dart';
import '../presentation/privacy_policy_screen/binding/privacy_policy_binding.dart';
import '../presentation/privacy_policy_screen/privacy_policy_screen.dart';
import '../presentation/reset_password_screen/binding/reset_password_binding.dart';
import '../presentation/reset_password_screen/reset_password_screen.dart';
import '../presentation/ronald_richards_screen/binding/ronald_richards_binding.dart';
import '../presentation/ronald_richards_screen/ronald_richards_screen.dart';
import '../presentation/settings_screen/binding/settings_binding.dart';
import '../presentation/settings_screen/settings_screen.dart';
import '../presentation/splash_screen/binding/spalsh_binding.dart';
import '../presentation/terms_conditions_screen/binding/terms_conditions_binding.dart';
import '../presentation/trending_polls_screen/binding/trending_polls_binding.dart';
import '../presentation/trending_polls_screen/trending_polls_screen.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String homeScreenContainerScreen =
      '/home_screen_container_screen';

  static const String homeScreenPage = '/home_screen_page';
  static const String splashPage = '/splash_page';
  static const String loginPage = '/login_page';
  static const String onBoardingPage = '/on_boarding_page';
  static const String forgotPasswordPage = '/forgot_password_page';
  static const String signUpPage = '/sign_up_page';
  static const String verificationPage = '/verification_page';
  static const String resetPasswordPage = '/reset_password_page';
  static const String popularCreatorsPage = '/Popular_creators_page';
  static const String addNewPollAnswerScreenPage =
      '/add_new_poll_answer_screen_page';

  static const String latestPollScreen = '/latest_poll_screen';
  static const String myProfilePage = '/my_profile_page';
  static const String editProfilePage = '/edit_profile_page';
  static const String aboutUsPage = '/about_us_page';
  static const String privacyPolicyPage = '/privacy_policy_page';
  static const String settingsPage = '/settings_page';
  static const String changePasswordPage = '/change_password_page';
  static const String termsConditionsPage = '/terms_conditions_page';
  static const String helpLineNumberPage = '/help_line_number_page';
  static const String insightsScreenPage = '/insights_screen_page';
  static const String pollDetailsPage = '/poll_details_page';
  static const String notificationPage = '/notification_page';

  static const String trendingPollsScreen = '/trending_polls_screen';

  static const String ronaldRichardsScreen = '/ronald_richards_screen';

  static const String pollsScreenPage = '/polls_screen_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      transition: Transition.rightToLeft,
      name: homeScreenContainerScreen,
      page: () => HomeScreenContainerScreen(),
      bindings: [HomeScreenContainerBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: onBoardingPage,
      page: () => OnBoardingScreen(),
      bindings: [OnBoardingBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: loginPage,
      page: () => LoginScreen(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: splashPage,
      page: () => SplashScreen(),
      bindings: [SplashBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: forgotPasswordPage,
      page: () => ForgotPasswordScreen(),
      bindings: [ForgotPasswordBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: resetPasswordPage,
      page: () => ResetPasswordScreen(),
      bindings: [ResetPasswordBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: addNewPollAnswerScreenPage,
      page: () => AddNewPollAnswerScreenPage(),
      bindings: [AddNewPollBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: editProfilePage,
      page: () => EditProfileScreen(),
      bindings: [EditProfileBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: aboutUsPage,
      page: () => AboutUsScreen(),
      bindings: [AboutUsBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: settingsPage,
      page: () => SettingsScreen(),
      bindings: [SettingsBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: verificationPage,
      page: () => VerificationScreen(),
      bindings: [VerificationBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: signUpPage,
      page: () => SignUpScreen(),
      bindings: [SignUpBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: latestPollScreen,
      page: () => LatestPollScreen(),
      bindings: [LatestPollBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: myProfilePage,
      page: () => MyProfileScreen(),
      bindings: [MyProfileBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: trendingPollsScreen,
      page: () => TrendingPollsScreen(),
      bindings: [TrendingPollsBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: ronaldRichardsScreen,
      page: () => RonaldRichardsScreen(),
      bindings: [RonaldRichardsBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: popularCreatorsPage,
      page: () => PopularCreatorsScreen(),
      bindings: [PopularCreatorsBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: insightsScreenPage,
      page: () => InsightsScreenPage(),
      bindings: [InitialBindings()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: pollDetailsPage,
      page: () => PollDetailsScreen(),
      bindings: [PollDetailsBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: helpLineNumberPage,
      page: () => HelpLineNumberScreen(),
      bindings: [HelpLineNumberBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: privacyPolicyPage,
      page: () => PrivacyPolicyScreen(),
      bindings: [PrivacyPolicyBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: changePasswordPage,
      page: () => ChangePasswordScreen(),
      bindings: [ChangePasswordBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: termsConditionsPage,
      page: () => TermsConditionsScreen(),
      bindings: [TermsConditionsBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: notificationPage,
      page: () => NotificationsScreen(),
      bindings: [NotificationsBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [AppNavigationBinding()],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [SplashBinding()],
    )
  ];
}
