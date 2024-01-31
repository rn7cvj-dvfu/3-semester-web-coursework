import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.width,
    required this.label,
    this.canObscure = false,
    this.icon,
    this.controller,
  });

  final double width;
  final Widget? icon;
  final String label;
  final bool canObscure;
  final TextEditingController? controller;

  final Observable<bool> _isObscure = Observable<bool>(true);

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
                  labelText: label,
                  icon: icon,
                ),
                obscureText: canObscure && _isObscure.value,
              ),
            ),
          ),
          if (canObscure)
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
