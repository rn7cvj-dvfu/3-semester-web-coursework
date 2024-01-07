import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_susch/admin/pages/login/login.dart';
import 'package:web_susch/mobile/pages/about/about.dart';
import 'package:web_susch/mobile/pages/amenities/amenities.dart';
import 'package:web_susch/mobile/pages/home/home.dart';
import 'package:web_susch/mobile/pages/login/login.dart';
import 'package:web_susch/mobile/pages/search/search.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/shared/controllers/token/controller.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  routerNeglect: true,
  navigatorKey: rootNavigatorKey,
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: "/login",
      builder: (context, state) => Login(),
    ),
    GoRoute(
      path: "/home",
      name: "home",
      builder: (context, state) => Home(),
      redirect: (context, state) {
        if (DIManager.get<TokenContoller>().token?.isEmpty ?? true) {
          return "/login";
        }

        return null;
      },
      routes: [
        GoRoute(
          path: "about",
          name: "about",
          pageBuilder: (context, state) => MaterialPage(child: About()),
        ),
        GoRoute(
          path: "search",
          name: "search",
          pageBuilder: (context, state) => MaterialPage(child: Search()),
        ),
        GoRoute(
          path: "amenities",
          name: "amenities",
          pageBuilder: (context, state) => MaterialPage(child: Amenities()),
        ),
      ],
    ),
  ],
);
