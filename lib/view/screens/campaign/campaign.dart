import 'package:flutter/material.dart';
import 'package:flutter_leadify/utils/constants/typography_constants.dart';
import 'package:flutter_leadify/view/screens/campaign/widgets/campaign_item_tile.dart';

class Campaign extends StatelessWidget {
  const Campaign({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Marketing Campaign', style: TT.f22w700),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            physics: const BouncingScrollPhysics(),
            itemCount: 15,
            itemBuilder: (context, index) {
              return const CampaignItemTile();
            },
          ))
        ],
      ),
    );
  }
}
