import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_hackout/model/lead_model.dart';
import 'package:flutter_hackout/utils/constants/constants.dart';
import 'package:flutter_hackout/view/screens/leads/widgets/lead_stage_widget.dart';

class LeadCard extends StatelessWidget {
  final LeadModel lead;
  const LeadCard({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border:
              Border.all(color: AppColors.unselectedBottomNavigationBarColor),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(lead.profileImage ?? ""),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      lead.name ?? "Lead Name",
                      style: TT.f12w500,
                    )
                  ],
                ),
                Text(
                  "Lead Score :${lead.leadScore}",
                  style: TT.f12w500,
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            LeadStageWidget(
              leadScore: getStage(lead.stage ?? "AWARE") ?? 1,
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
