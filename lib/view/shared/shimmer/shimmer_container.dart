import 'package:flutter/material.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer(
      {super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
