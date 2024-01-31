import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/mobile/router.dart';

import '../utils.dart';

Future<void> main() async {
  setUpSystemUIOverlay();
  LocaleSettings.useDeviceLocale();
  initializeDateFormatting();

  await DIManager.init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
