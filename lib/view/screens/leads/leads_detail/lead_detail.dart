import 'package:flutter/material.dart';
import 'package:flutter_hackout/model/lead_backend_model.dart';
import 'package:flutter_hackout/utils/constants/colors/app_colors.dart';
import 'package:flutter_hackout/view/screens/leads/widgets/lead_stage_widget.dart';

import '../../../../utils/constants/typography_constants.dart';

class LeadDetail extends StatelessWidget {
  LeadModelBackend leads;
  LeadDetail({super.key, required this.leads});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(leads.profileImageUrl ?? ""),
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        leads.fullName ?? "Lead Name",
                        style: TT.f18w500,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {},
                          child: Text(
                            "Connect",
                            style:
                                TT.f18w500.copyWith(color: AppColors.textWhite),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        leads.email ?? "Email ID",
                        style: TT.f18w500,
                        textAlign: TextAlign.left,
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  LeadStageWidget(leadScore: leads.stateProgress ?? 0),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "additionalInfo: ${leads.additionalInfo}",
                          style: TT.f12w500,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "category: ${leads.category}",
                          style: TT.f12w500,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "connectionDegree: ${leads.connectionDegree}",
                          style: TT.f12w500,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "currentJob: ${leads.currentJob}",
                          style: TT.f12w500,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "job: ${leads.job}",
                          style: TT.f12w500,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "pastJob: ${leads.pastJob}",
                          style: TT.f12w500,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "sharedConnections: ${leads.sharedConnections}",
                          style: TT.f12w500,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Details: ${'\n\n'} ${leads.detailedLeads.toString().split(',').join('\n\n').replaceAll('{', '').replaceAll('}', '')}",
                          style: TT.f12w500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
