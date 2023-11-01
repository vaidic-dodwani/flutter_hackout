import 'package:flutter/material.dart';
import 'package:flutter_leadify/utils/constants/typography_constants.dart';
import 'package:flutter_leadify/view/screens/homepage/widgets/column_chart.dart';
import 'package:flutter_leadify/view/screens/homepage/widgets/funnel_chart.dart';
import 'package:flutter_leadify/view/screens/homepage/widgets/home_overview_item_tile.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Overview",
              textAlign: TextAlign.left,
              style: TT.f22w700,
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 220,
              width: double.infinity,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 110.0,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return const HomeOverviewItemTile(
                      title: "Active",
                      color: Colors.blue,
                      number: 16,
                      iconData: Icons.play_arrow);
                },
              ),
            ),
            Text(
              "Prospect Funnel",
              textAlign: TextAlign.left,
              style: TT.f22w700,
            ),
            const SizedBox(
              height: 16.0,
            ),
            const FunnelChart(),
            Text(
              "Number of closed wons",
              textAlign: TextAlign.left,
              style: TT.f22w700,
            ),
            const SizedBox(
              height: 16.0,
            ),
            const ColumnChart(),

          ],
        ),
      ),
    );
  }
}
