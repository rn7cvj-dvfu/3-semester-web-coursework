import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void setUpSystemUIOverlay() {
  WidgetsFlutterBinding.ensureInitialized();

  // Setting SysemUIOverlay
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent));
  // Setting SystmeUIMode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

String formatDateShort(BuildContext context, DateTime date) =>
    DateFormat.yMd(Localizations.localeOf(context).languageCode).format(date);

String formatDateFull(BuildContext context, DateTime date) =>
    DateFormat.yMMMEd(Localizations.localeOf(context).languageCode)
        .format(date);

String formatTime(BuildContext context, DateTime date) =>
    DateFormat.Hm(Localizations.localeOf(context).languageCode).format(date);
