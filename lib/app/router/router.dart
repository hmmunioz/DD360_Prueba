import 'package:dd360_test/app/_childrens/superheros/pages/comics_page.dart';
import 'package:dd360_test/app/_childrens/superheros/pages/event_page.dart';
import 'package:dd360_test/app/_childrens/superheros/pages/series_page.dart';
import 'package:dd360_test/app/_childrens/superheros/pages/splash_page.dart';
import 'package:dd360_test/app/_childrens/superheros/pages/stories_page.dart';
import 'package:dd360_test/app/_childrens/superheros/pages/superhero_page.dart';
import 'package:dd360_test/app/models/marvel_models/superhero_model.dart';
import 'package:flutter/material.dart';

class RouterClass {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/superheros': (context) => const SuperheroPage(),
    '/comics': (context) => const ComicsPage(),
    '/events': (context) => const EventMarvelPage(),
    '/series': (context) => const SeriesPage(),
    '/stories': (context) => const StoryPage(),
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
  final SuperheroModel arg1;

  RouteArguments(this.key, this.arg1);
}
