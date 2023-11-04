import 'package:flutter/material.dart';
import 'package:flutter_hackout/utils/constants/typography_constants.dart';
import 'package:flutter_hackout/view/screens/campaign/widgets/campaign_item_tile.dart';
import 'package:flutter_hackout/view/shared/shimmer/campaign_shimmer/campaign_shimmer.dart';
import 'package:flutter_hackout/view_model/campaign_view_model/campaign_view_model.dart';
import 'package:provider/provider.dart';

class Campaign extends StatefulWidget {
  const Campaign({super.key});

  @override
  State<Campaign> createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CampaignViewModel>(context, listen: false)
          .getCampaignsIfEmpty();
    });
    super.initState();
  }

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
            child: Consumer<CampaignViewModel>(
              builder: (context, campaign, child) => ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount:
                    campaign.campaigns.isEmpty ? 5 : campaign.campaigns.length,
                itemBuilder: (context, index) {
                  if (campaign.campaigns.isNotEmpty) {
                    return CampaignItemTile(
                      campaign: campaign.campaigns[index],
                    );
                  }
                  return const CampaignShimmer();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
