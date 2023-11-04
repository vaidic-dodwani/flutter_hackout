import 'package:flutter/material.dart';
import 'package:flutter_leadify/utils/constants/typography_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onTap, this.isLoading = false, required this.text});

  final void Function()? onTap;
  final bool isLoading;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        color: Colors.black,
        height: 44,
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 32,
                  width: 32,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
                  text,
                  style: TT.f14w500White,
                ),
        ),
      ),
    );
  }
}
