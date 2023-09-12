import 'package:dacodes_test/app/_childrens/serie/pages/splash_page.dart';
import 'package:dacodes_test/app/models/serie_models/serie_model.dart';
import 'package:flutter/material.dart';

class RouterClass {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/splash': (context) => const SplashScreenPage(),
  };

  static void navigateTo(
      BuildContext context, String routeName, RouteArguments arguments) {
    Navigator.pushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }
}

class RouteArguments {
  final String key;
  final SerieModel arg1;

  RouteArguments(this.key, this.arg1);
}
