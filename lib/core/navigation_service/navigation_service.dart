import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();

  NavigationService._internal();

  factory NavigationService() => _instance;

  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static final BuildContext context = NavigationService().navigationKey.currentState!.context;

  dynamic back([dynamic popValue]) {
    return navigationKey.currentState?.pop(popValue);
  }

  Future<dynamic> push(Widget page, {arguments}) async =>
      navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => page,
        ),
      );

  Future<dynamic> pushNamed(String routeName, {arguments}) async =>
      navigationKey.currentState?.pushNamed(routeName,arguments: arguments);

  Future<dynamic> replace(Widget page, {arguments}) async =>
      navigationKey.currentState?.pushReplacement(
        MaterialPageRoute(
          builder: (_) => page,
        ),
      );

  Future<dynamic> replaceNamed(String routeName, {arguments}) async =>
      navigationKey.currentState?.pushReplacementNamed(routeName,arguments: arguments);


  Future<dynamic> pushAndRemoveUntil(String routeName, {arguments}) async =>
      navigationKey.currentState?.pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false,arguments: arguments);

  void popToFirst() =>
      navigationKey.currentState?.popUntil((route) => route.isFirst);
}
