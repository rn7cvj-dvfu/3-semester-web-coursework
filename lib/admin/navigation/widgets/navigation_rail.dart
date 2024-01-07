import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:web_susch/admin/main.dart';
import 'package:web_susch/admin/navigation/navigator.dart';

class CustomNavigationRail extends StatelessWidget {
  const CustomNavigationRail({super.key, required this.state});

  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: const Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: AppNavigator.openAdminPanel,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: IconButton(
                    icon: Icon(Icons.airplanemode_active),
                    onPressed: AppNavigator.opneManageFlightPanel,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: AppNavigator.openSearchPanel,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: IconButton(
                    icon: Icon(Icons.book),
                    onPressed: AppNavigator.openBookingsPanel,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
