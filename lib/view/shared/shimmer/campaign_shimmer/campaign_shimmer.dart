import 'package:flutter/material.dart';
import 'package:flutter_hackout/view/shared/shimmer/custom_shimmer.dart';
import 'package:flutter_hackout/view/shared/shimmer/shimmer_container.dart';

class CampaignShimmer extends StatelessWidget {
  const CampaignShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomShimmerWidget(
        child: ShimmerContainer(height: 200, width: double.infinity));
  }
}
