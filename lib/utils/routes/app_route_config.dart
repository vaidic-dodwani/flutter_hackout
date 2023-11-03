import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../view/screens/bottom_navigation/bottom_navigation.dart';
import 'app_route_names.dart';

class GoRouterConfig {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: AppRouteNames.homepageRoute,
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: BottomNavigationScreen());
        },
      ),
    ],
  );
}
