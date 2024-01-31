import 'package:flutter/material.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/admin/router.dart';
import 'package:web_susch/utils.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  setUpSystemUIOverlay();

  await DIManager.init();

  LocaleSettings.useDeviceLocale();
  initializeDateFormatting();

  runApp(TranslationProvider(child: const App()));
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
