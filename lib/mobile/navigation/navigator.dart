import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_susch/mobile/router.dart';

class AppNavigator {
  static void opneHomePage() {
    Router.neglect(rootNavigatorKey.currentContext!,
        () => rootNavigatorKey.currentContext!.goNamed("home"));
  }

  static void openAboutPage() {
    Router.neglect(rootNavigatorKey.currentContext!,
        () => rootNavigatorKey.currentContext!.goNamed("about"));
  }

  static void openSearchPage() {
    Router.neglect(rootNavigatorKey.currentContext!,
        () => rootNavigatorKey.currentContext!.goNamed("search"));
  }

  static void openAmenitieshPage() {
    Router.neglect(rootNavigatorKey.currentContext!,
        () => rootNavigatorKey.currentContext!.goNamed("amenities"));
  }
}
