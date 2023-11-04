import 'package:flutter/material.dart';
import 'package:flutter_leadify/model/lead_backend_model.dart';
import 'package:flutter_leadify/model/lead_model.dart';
import 'package:flutter_leadify/utils/constants/constants.dart';
import 'package:flutter_leadify/view/screens/leads/leads_detail/lead_detail.dart';
import 'package:flutter_leadify/view/screens/leads/widgets/leadwidget.dart';
import 'package:flutter_leadify/view_model/Leads_view_model/leads_view_model.dart';
import 'package:provider/provider.dart';

class Leads extends StatelessWidget {
  Leads({super.key});
  final LeadModelBackend model = LeadModelBackend();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Leads",
                style: TT.f18w700,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.errorColor,
                  ),
                  onPressed: () {
                    Provider.of<LeadNotifier>(context, listen: false)
                        .deleteallLead();
                  },
                  child: Text("Delete All Leads",
                      style: TT.f18w500.copyWith(
                        color: AppColors.textWhite,
                      )))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(child: Consumer<LeadNotifier>(builder: (_, ref, __) {
            return ref.leads==null? const Center(child: SizedBox(
              width: 50,
              child: LinearProgressIndicator()),):ref.leads!.isEmpty?const Center(child: Text("No Leads to be shown. Run the Scraper"),)
              :RefreshIndicator(
                onRefresh: () => ref.getLeads(),
                child: ListView.builder(
                  itemCount: ref.leads?.length ?? 0,
                  itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 4),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder:(_)=>  LeadDetail(leads: ref.leads![index],)));
                          },
                          child: LeadCard(
                            lead: LeadModel(
                                leadScore: ref.leads?[index].leadScore == ""
                                    ? 0
                                    : int.parse(ref.leads?[index].leadScore ?? "0"),
                                name: ref.leads?[index].fullName,
                                profileImage: ref.leads?[index].profileImageUrl,
                                stage: ref.leads?[index].stateProgress == 1
                                    ? LeadStage.aware
                                    : ref.leads?[index].stateProgress == 2
                                        ? LeadStage.interested
                                        : ref.leads?[index].stateProgress == 3
                                            ? LeadStage.desire
                                            : ref.leads?[index].stateProgress == 4
                                                ? LeadStage.closed
                                                : LeadStage.aware),
                          ),
                        ),
                      )),
              );
          }))
        ],
      ),
    );
  }
}
