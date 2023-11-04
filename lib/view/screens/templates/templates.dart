import 'package:flutter/material.dart';
import 'package:flutter_leadify/utils/constants/typography_constants.dart';
import 'package:flutter_leadify/view/screens/templates/widgets/templates_item_tile.dart';
import 'package:flutter_leadify/view/shared/shimmer/templates_shimmer/templates_shimmer.dart';
import 'package:flutter_leadify/view_model/templates_view_model/templates_view_model.dart';
import 'package:provider/provider.dart';

class Templates extends StatefulWidget {
  const Templates({super.key});

  @override
  State<Templates> createState() => _TemplatesState();
}

class _TemplatesState extends State<Templates> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TemplateViewModel>(context, listen: false)
          .getTemplatesIfEmpty();
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
          Text('Templates Performance', style: TT.f22w700),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Consumer<TemplateViewModel>(
              builder: (context, template, child) => ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount:
                    template.templates.isEmpty ? 5 : template.templates.length,
                itemBuilder: (context, index) {
                  if (template.templates.isNotEmpty) {
                    return TemplatesItemTile(
                      template: template.templates[index],
                    );
                  }
                  return const TemplatesShimmer();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
