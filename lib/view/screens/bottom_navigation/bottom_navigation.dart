import 'package:flutter/material.dart';
import 'package:flutter_leadify/utils/constants/colors/app_colors.dart';
import 'package:flutter_leadify/utils/constants/typography_constants.dart';
import 'package:flutter_leadify/view/screens/bottom_navigation/widgets/bottom_navigation_items.dart';
import 'package:flutter_leadify/view/screens/campaign/campaign.dart';
import 'package:flutter_leadify/view/screens/homepage/homepage.dart';
import 'package:flutter_leadify/view/screens/leads/leads.dart';
import 'package:flutter_leadify/view/screens/schedule/schedule.dart';
import 'package:flutter_leadify/view/screens/templates/templates.dart';
import 'package:flutter_leadify/view_model/temp_view_model/temp_view_model.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatelessWidget {
   BottomNavigationScreen({super.key});

  final List<Widget> _screens =  [
    Homepage(),
    Leads(),
    Schedules(),
    Templates(),
    Campaign(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, home, child) => Scaffold(
        appBar: AppBar(
          title: Text('Leadify', style: TT.f22w500),
        ),
        body: _screens[home.selectedScreen],
        bottomNavigationBar: BottomNavigationBar(
          items: bottomNavigationItems,
          onTap: (index) {
            home.selectedScreen = index;
          },
          selectedLabelStyle: TT.f12w500,
          unselectedLabelStyle: TT.f12w500Grey,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.unselectedBottomNavigationBarColor,
          currentIndex: home.selectedScreen,
        ),
      ),
    );
  }
}
