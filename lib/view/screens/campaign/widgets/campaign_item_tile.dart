import 'package:flutter/material.dart';
import 'package:flutter_leadify/utils/constants/constants.dart';

class CampaignItemTile extends StatelessWidget {
  const CampaignItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            width: 1, color: AppColors.unselectedBottomNavigationBarColor),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 16,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppAssets.gmailLogo,
                  width: 150,
                  height: 150,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "485",
                        style: TT.f22w700,
                      ),
                      Text(
                        "Total Likes",
                        style: TT.f22w700Grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color:
                AppColors.unselectedBottomNavigationBarColor.withOpacity(0.5),
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 49,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(text: 'Target: ', style: TT.f14w500Grey),
                            TextSpan(
                              text: 'Gmail',
                              style: TT.f14w500,
                            )
                          ],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Impressions: ', style: TT.f14w500Grey),
                            TextSpan(
                              text: '45299',
                              style: TT.f14w500,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 40,
                    child: VerticalDivider(
                      color: AppColors.unselectedBottomNavigationBarColor
                          .withOpacity(0.5),
                      thickness: 2,
                    ),
                  ),
                ),
                Expanded(
                  flex: 49,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Duration: ', style: TT.f14w500Grey),
                              TextSpan(
                                text: '5',
                                style: TT.f14w500,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor: AppColors
                              .unselectedBottomNavigationBarColor
                              .withOpacity(0.5),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
