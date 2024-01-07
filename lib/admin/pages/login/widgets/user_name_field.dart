import 'package:flutter/material.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class UserNameFiled extends StatelessWidget {
  const UserNameFiled({
    super.key,
    required this.width,
    required this.controller,
  });

  final double width;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: t.login.userName,
          icon: const Icon(Icons.person),
        ),
      ),
    );
  }
}
