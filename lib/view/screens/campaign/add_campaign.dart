import 'package:flutter/material.dart';
import 'package:flutter_leadify/model/template_model.dart';
import 'package:flutter_leadify/view/shared/app_bar.dart';
import 'package:flutter_leadify/view/shared/custom_button.dart';
import 'package:flutter_leadify/view_model/campaign_view_model/campaign_view_model.dart';
import 'package:flutter_leadify/view_model/templates_view_model/templates_view_model.dart';
import 'package:provider/provider.dart';

class AddCampaign extends StatefulWidget {
  const AddCampaign({super.key});

  @override
  State<AddCampaign> createState() => _AddCampaignState();
}

class _AddCampaignState extends State<AddCampaign> {
  final List<String> _leadGroup = [
    'Paris Leads',
    'Insurance Leads',
    'Real Estate Leads',
    'Mortgage Leads',
    'Credit Repair Leads',
    'Solar Leads',
    'Home Security Leads',
    'Home Improvement Leads',
    'HVAC Leads',
    'Auto Warranty Leads',
    'Auto Insurance Leads',
    'Auto Finance Leads',
    'Auto Leads',
    'Debt Leads',
    'Student Loan Leads',
    'Payday Leads',
    'Tax Leads',
    'Health Insurance Leads',
    'Final Expense Leads',
    'Medicare Leads',
    'Life Insurance Leads',
    'Solar Leads',
    'Home Security Leads',
    'Home Improvement Leads',
    'HVAC Leads',
    'Auto Warranty Leads',
    'Auto Insurance Leads',
    'Auto Finance Leads',
    'Auto Leads',
    'Debt Leads',
    'Student Loan Leads',
    'Payday Leads',
    'Tax Leads',
    'Health Insurance Leads',
    'Final Expense Leads',
    'Medicare Leads',
    'Life Insurance Leads',
    'Solar Leads',
    'Home Security Leads',
    'Home Improvement Leads',
    'HVAC Leads',
    'Auto Warranty Leads',
    'Auto Insurance Leads',
    'Auto Finance Leads',
    'Auto Leads',
    'Debt Leads',
    'Student Loan Leads',
    'Payday Leads',
    'Tax Leads',
    'Health Insurance Leads',
    'Final Expense Leads',
    'Medicare Leads',
    'Life Insurance Leads'
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await Provider.of<TemplateViewModel>(context, listen: false)
            .getTemplatesIfEmpty();
        await Provider.of<CampaignViewModel>(context, listen: false)
            .getCampaignsIfEmpty();
      },
    );
    super.initState();
  }

  Template? _selectedTemplate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Consumer2<TemplateViewModel, CampaignViewModel>(
        builder: (context, templates, campaign, child) {
          if (templates.templates.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 36),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Duration',
                    label: Text('Duration'),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                DropdownMenu(
                  width: MediaQuery.of(context).size.width - 32,
                  hintText: "Template",
                  onSelected: (value) {
                    _selectedTemplate = templates.templates
                        .firstWhere((element) => element.templateName == value);
                    setState(() {});
                  },
                  dropdownMenuEntries: List.generate(
                    templates.templates.length,
                    (index) => DropdownMenuEntry(
                      value: templates.templates[index].templateName,
                      label: templates.templates[index].templateName,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                DropdownMenu(
                  width: MediaQuery.of(context).size.width - 32,
                  hintText: "Company",
                  dropdownMenuEntries: List.generate(
                    campaign.targets.length,
                    (index) => DropdownMenuEntry(
                      value: campaign.targets.elementAt(index).toUpperCase(),
                      label: campaign.targets.elementAt(index).toUpperCase(),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                DropdownMenu(
                  width: MediaQuery.of(context).size.width - 32,
                  hintText: "Lead Group",
                  dropdownMenuEntries: List.generate(
                    _leadGroup.length,
                    (index) => DropdownMenuEntry(
                      value: _leadGroup[index],
                      label: _leadGroup[index],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                CustomButton(
                  text: "Send Campaign",
                  isLoading: campaign.isAddCampaignLoading,
                  onTap: _selectedTemplate == null
                      ? null
                      : () {
                          campaign.addCampaign(
                              context, _selectedTemplate!.templateName);
                        },
                ),
                const SizedBox(height: 12),
                const SizedBox(height: 12),
                const SizedBox(height: 12),
              ],
            ),
          );
        },
      ),
    );
  }
}
