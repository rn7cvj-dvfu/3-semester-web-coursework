import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_susch/admin/router.dart';

class AppNavigator {
  // static void openAddUserDialog() {
  //   Router.neglect(rootNavigatorKey.currentContext!,
  //       () => rootNavigatorKey.currentContext!.go("/admin_main/add_user"));
  // }

  static void openAdminPanel() {
    Router.neglect(rootNavigatorKey.currentContext!,
        () => rootNavigatorKey.currentContext!.go("/adminPanel"));
  }

  static void opneManageFlightPanel() {
    Router.neglect(rootNavigatorKey.currentContext!,
        () => rootNavigatorKey.currentContext!.go("/manageFlightPanel"));
  }

  static void openSearchPanel() {
    Router.neglect(rootNavigatorKey.currentContext!,
        () => rootNavigatorKey.currentContext!.go("/searchPanel"));
  }

  static void openBookingsPanel() {
    Router.neglect(rootNavigatorKey.currentContext!,
        () => rootNavigatorKey.currentContext!.go("/bookingsPanel"));
  }
}
