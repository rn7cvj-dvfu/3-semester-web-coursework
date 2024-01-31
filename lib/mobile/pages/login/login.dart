import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/mobile/navigation/navigator.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/shared/controllers/login/controller.dart';
import 'package:web_susch/shared/controllers/login/converter.dart';
import 'package:web_susch/shared/ui/icon_text_button.dart';
import 'package:web_susch/shared/ui/text_filed.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final LoginController controller = LoginController(
    loginConverter: DIManager.get<LoginConverter>(),
    onSucessfullLogin: AppNavigator.opneHomePage,
  );

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    double textFiledWidth = width / 1.2;
    double buttonWidth = width / 1.5;
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? "assets/images/logo_dark.png"
                        : "assets/images/logo_light.png"),
              ),
              CustomTextField(
                width: textFiledWidth,
                icon: const Icon(Icons.person),
                label: t.login.userName,
                canObscure: false,
                controller: userNameController,
              ),
              const SizedBox(height: 18),
              CustomTextField(
                width: textFiledWidth,
                icon: const Icon(Icons.key),
                label: t.login.password,
                canObscure: true,
                controller: passwordController,
              ),
              const SizedBox(height: 18),
              Observer(
                builder: (_) => IconTextButton(
                  buttonWidth: buttonWidth,
                  onTap: () => controller.login(
                    userNameController.text,
                    passwordController.text,
                  ),
                  icon: const Icon(Icons.login),
                  label: t.login.login,
                  isLoading: controller.isLoading,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
