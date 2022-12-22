import 'package:flutter/material.dart';

final UtilsNavigator navService = UtilsNavigator();

class UtilsNavigator<T, U> {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  Future<T?> pushNamed(String routeName, {Object? args}) async {
    return await navigationKey.currentState!.pushNamed<T>(
      routeName,
      arguments: args,
    );
  }

  Future<T?> push(Route<T> route) async {
    return await navigationKey.currentState!.push<T>(route);
  }

  Future<T?> pushReplacementNamed(String routeName, {Object? args}) async {
    return await navigationKey.currentState!.pushReplacementNamed<T, U>(
      routeName,
      arguments: args,
    );
  }

  Future<T?> pushNamedAndRemoveUntil(String routeName, {Object? args}) async {
    return await navigationKey.currentState!.pushNamedAndRemoveUntil<T>(
      routeName,
      (Route<dynamic> route) => false,
      arguments: args,
    );
  }

  bool canPop() => navigationKey.currentState!.canPop();
  void goBack({T? result}) => navigationKey.currentState!.pop<T>(result);
}
