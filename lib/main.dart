import 'package:flutter/material.dart';
import 'package:flutter_leadify/utils/constants/colors/app_colors.dart';
import 'package:flutter_leadify/utils/provider/app_providers.dart';
import 'package:flutter_leadify/utils/routes/app_route_config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider.providers,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        builder: FToastBuilder(),
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: AppColors.primaryColor,
          iconTheme: const IconThemeData(
            color: AppColors.primaryColor,
          ),
        ),
        routerConfig: GoRouterConfig.router,
      ),
    );
  }
}
