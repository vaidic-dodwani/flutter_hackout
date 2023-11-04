import 'package:flutter/material.dart';
import 'package:flutter_leadify/utils/constants/colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String label;
   CustomTextField({super.key,required this.controller,required this.label});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration( 
        label:  Text(label),
        border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.unselectedBottomNavigationBarColor.withOpacity(0.6)))),
      controller: controller,
    
    );
  }
}