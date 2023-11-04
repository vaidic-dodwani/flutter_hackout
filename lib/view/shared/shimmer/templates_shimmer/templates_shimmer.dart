import 'package:flutter/material.dart';
import 'package:flutter_leadify/view/shared/shimmer/custom_shimmer.dart';
import 'package:flutter_leadify/view/shared/shimmer/shimmer_container.dart';

class TemplatesShimmer extends StatelessWidget {
  const TemplatesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomShimmerWidget(
        child: ShimmerContainer(height: 200, width: double.infinity));
  }
}
