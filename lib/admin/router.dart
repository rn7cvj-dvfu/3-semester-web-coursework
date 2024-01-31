import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_susch/admin/navigation/scaffold_with_rails.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/add_user_dialog.dart';
import 'package:web_susch/admin/pages/admin_panel/admin_panel.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/edit_role_dialog.dart';
import 'package:web_susch/admin/pages/login/login.dart';
import 'package:web_susch/admin/pages/manager_flight/manage_flight_panel.dart';
import 'package:web_susch/admin/pages/search_panel/booking_conformation_page.dart';
import 'package:web_susch/admin/pages/search_panel/search_panel.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  routerNeglect: true,
  navigatorKey: rootNavigatorKey,
  initialLocation: "/adminPanel",
  routes: [
    GoRoute(
      path: "/login",
      builder: (context, state) => LoginPage(),
    ),
    ShellRoute(
        navigatorKey: _shellNavigationKey,
        builder: (context, state, child) {
          return ScaffoldWithNavigationRails(
            state: state,
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: "/adminPanel",
            pageBuilder: (context, state) => MaterialPage(child: AdminPanel()),
          ),
          GoRoute(
            path: "/manageFlightPanel",
            pageBuilder: (context, state) =>
                MaterialPage(child: ManageFlightPanel()),
          ),
          GoRoute(
            path: "/searchPanel",
            builder: (context, state) => SearchPanel(),
          ),
          GoRoute(
            path: "/bookingsPanel",
            builder: (context, state) => BookingConformationPage(),
          ),
        ]),
  ],
);
