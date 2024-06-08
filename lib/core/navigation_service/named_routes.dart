import 'package:flutter/material.dart';



class NamedRoutes {
  static const String homeRoute = "/home";
  static const String loginRoute = "/login";
  static const String OTPRoute = "/otp";
  static const String passwordRoute = "/password";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String confirmResetPasswordScreen = "/confirmResetPasswordScreen";
  static const String chooseProfileRoute = "/chooseProfileRoute";
  static const String studentProfileRoute = "/studentProfileRoute";
  static const String parentProfileRoute = "/parentProfileRoute";
  static const String bottomNavigationRoute = "/bottomNavigationRoute";
  static const String profileRoute = "/profileRoute";
  static const String opportunityEventDetailsRoute = "/opportunityEventDetailsRoute";
  static const String courseDetailsMainScreen = "/courseDetailsMainScreen";
  static const String exploreCourseDetails = "/exploreCourseDetails";
  static const String onBoarding = "/onBoarding";
  static const String parentBottomNavigation = "/parentBottomNavigation";
  static const String addKidScreen = "/addKidScreen";
  static const String kidProfileScreen = "/kidProfileScreen";
  static const String parentSettingsScreen = "/parentSettingsScreen";
  static const String parentProfileScreen = "/parentProfileScreen";
  static const String parentMyOrderScreen = "/parentMyOrderScreen";
  static const String parentSavedCoursesScreen = "/parentSavedCoursesScreen";
  static const String orderItemDetailsScreen = "/orderItemDetailsScreen";
  static const String parentArticleDetailsScreen = "/parentArticleDetailsScreen";
  static const String parentEditProfileScreen = "/parentEditProfileScreen";
  static const String rewardScreen = "/rewardScreen";
  static const String rewardHistoryScreen = "/rewardHistoryScreen";
  static const String connectionsScreen = "/connectionsScreen";
  static const String followingScreen = "/followingScreen";
  static const String addCertificate = "/addCertificate";
  static const String profileEditScreenOptions = "/profileEditScreenOptions";

  static Map<String, Widget Function(BuildContext)> routes = {
    // NamedRoutes.homeRoute: (_) => HomePageScreen(),
  };
}
