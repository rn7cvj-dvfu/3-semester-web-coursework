import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class PassField extends StatelessWidget {
  PassField({super.key, required this.width, required this.controller});

  final double width;

  final _isObscure = Observable<bool>(true);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Observer(
              builder: (_) => TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: t.login.password,
                  icon: const Icon(Icons.key),
                ),
                obscureText: _isObscure.value,
              ),
            ),
          ),
          Observer(
            builder: (_) => IconButton(
              onPressed: () =>
                  runInAction(() => _isObscure.value = !_isObscure.value),
              icon: Icon(_isObscure.value
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye),
            ),
          )
        ],
      ),
    );
  }
}
