import 'package:flutter/material.dart';
import 'package:flutter_leadify/utils/constants/typography_constants.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key, this.onTap, this.isLoading = false, required this.text});

  final void Function()? onTap;
  final bool isLoading;
  final String text;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;
  @override
  void initState() {
    isLoading = widget.isLoading;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : widget.onTap,
      child: Container(
        color: Colors.black,
        height: 44,
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  widget.text,
                  style: TT.f14w500White,
                ),
        ),
      ),
    );
  }
}
