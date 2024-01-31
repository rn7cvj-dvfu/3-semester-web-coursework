import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/shared/controllers/login/controller.dart';
import 'package:web_susch/shared/controllers/login/converter.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/admin/pages/login/widgets/pass_field.dart';
import 'package:web_susch/admin/pages/login/widgets/user_name_field.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginLandscape extends StatelessWidget {
  LoginLandscape({super.key});

  final LoginController controller = LoginController(
    loginConverter: DIManager.get<LoginConverter>(),
  );

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset(Theme.of(context).brightness == Brightness.dark
                  ? "assets/images/logo_dark.png"
                  : "assets/images/logo_light.png"),
            ),
            UserNameFiled(
              width: width / 3,
              controller: _userNameController,
            ),
            PassField(
              width: width / 3,
              controller: _passController,
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: width / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Observer(builder: (_) {
                    Widget child = controller.isLoading
                        ? LoadingAnimationWidget.prograssiveDots(
                            color: Theme.of(context).colorScheme.primary,
                            size: 30,
                          )
                        : Text(t.login.login);

                    return ElevatedButton(
                      onPressed: () => controller.login(
                        _userNameController.text,
                        _passController.text,
                      ),
                      child: child,
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
