import 'package:flutter/material.dart';
import 'package:flutter_leadify/utils/constants/typography_constants.dart';

class MyAppBar extends AppBar {
  MyAppBar({super.key})
      : super(
          title: Text('Leadify', style: TT.f22w500),
          elevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
        );
}
