import 'package:flutter/material.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/mobile/navigation/navigator.dart';
import 'package:web_susch/shared/ui/icon_text_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.sizeOf(context).width / 1.2;

    return Material(
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? "assets/images/logo_dark.png"
                        : "assets/images/logo_light.png"),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      IconTextButton(
                        buttonWidth: buttonWidth,
                        icon: Icon(
                          Icons.search,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        onTap: AppNavigator.openSearchPage,
                        label: t.home.searchFligths,
                      ),
                      const SizedBox(height: appPaddingMedium),
                      IconTextButton(
                        buttonWidth: buttonWidth,
                        icon: Icon(
                          Icons.alarm_add,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        onTap: () {},
                        label: t.home.reserveSeat,
                      ),
                      const SizedBox(height: appPaddingMedium),
                      IconTextButton(
                        buttonWidth: buttonWidth,
                        icon: Icon(
                          Icons.extension_rounded,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        onTap: AppNavigator.openAmenitieshPage,
                        label: t.home.amenities,
                      ),
                      SizedBox(
                        width: buttonWidth,
                        height: appPaddingLarge,
                        child: Divider(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          thickness: 2,
                        ),
                      ),
                      IconTextButton(
                        buttonWidth: buttonWidth,
                        icon: Icon(
                          Icons.book,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        onTap: AppNavigator.openAboutPage,
                        label: t.home.aboutOurAirLines,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
