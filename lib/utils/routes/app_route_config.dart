import 'package:flutter/material.dart';
import 'package:flutter_leadify/view/screens/campaign/add_campaign.dart';
import 'package:go_router/go_router.dart';

import '../../view/screens/bottom_navigation/bottom_navigation.dart';
import 'app_route_names.dart';

class GoRouterConfig {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: AppRouteNames.homepageRoute,
        path: '/',
        builder: (context, state) {
          return BottomNavigationScreen();
        },
        routes: [
          GoRoute(
            name: AppRouteNames.addCampaign,
            path: 'add_campaign',
            builder: (context, state) {
              return const AddCampaign();
            },
          )
        ],
      ),
    ],
  );
}
