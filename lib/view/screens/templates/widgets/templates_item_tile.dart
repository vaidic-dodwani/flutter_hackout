import 'package:flutter/material.dart';
import 'package:flutter_hackout/model/template_model.dart';
import 'package:flutter_hackout/utils/constants/constants.dart';

class TemplatesItemTile extends StatelessWidget {
  const TemplatesItemTile({super.key, required this.template});
  final Template template;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            template.templateName,
            textAlign: TextAlign.left,
            style: TT.f18w700,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TemplateRateBlock(name: "Open Rate", rate: template.openRate),
              TemplateRateBlock(name: "Reply Rate", rate: template.replyRate),
              TemplateRateBlock(name: "Click Rate", rate: template.clickRate),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TemplateRateBlock(
                  name: "Meeting Rate", rate: template.meetingRate),
              TemplateRateBlock(name: "Bounce Rate", rate: template.bounceRate),
            ],
          )
        ],
      ),
    );
  }
}

class TemplateRateBlock extends StatelessWidget {
  const TemplateRateBlock({super.key, required this.name, required this.rate});
  final String name;
  final String rate;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          textAlign: TextAlign.center,
          style: TT.f14w700,
        ),
        const SizedBox(height: 10),
        Text(
          rate.toString(),
          textAlign: TextAlign.center,
          style: TT.f14w500Grey,
        ),
      ],
    );
  }
}
