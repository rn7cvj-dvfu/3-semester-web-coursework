import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_susch/admin/navigation/navigator.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/edit_role_dialog.dart';
import 'admin_panel_landscape.dart';
import 'widgets/add_user_dialog.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPanelLandscape();
  }
}
