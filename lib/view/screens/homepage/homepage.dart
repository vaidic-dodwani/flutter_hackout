import 'package:flutter/material.dart';
import 'package:flutter_leadify/utils/constants/typography_constants.dart';
import 'package:flutter_leadify/view/screens/homepage/widgets/column_chart.dart';
import 'package:flutter_leadify/view/screens/homepage/widgets/funnel_chart.dart';
import 'package:flutter_leadify/view/screens/homepage/widgets/home_overview_item_tile.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  final List<Map<String, dynamic>> homeTile = const [
    {
      'title': 'Active',
      'color': Color(0xffFFC107),
      'number': 120,
      'iconData': Icons.person
    },
    {
      'title': 'Won',
      'color': Color(0xff4CAF50),
      'number': 49,
      'iconData': Icons.check_circle_outline
    },
    {
      'title': 'Lost',
      'color': Color(0xffF44336),
      'number': 11,
      'iconData': Icons.cancel_outlined
    },
    {
      'title': 'Unqualified',
      'color': Color(0xff9E9E9E),
      'number': 40,
      'iconData': Icons.cancel_outlined
    },
    {
      'title': 'Unreachable',
      'color': Color(0xff9E9E9E),
      'number': 5,
      'iconData': Icons.cancel_outlined
    },
    {
      'title': 'Uncontacted',
      'color': Color(0xff9E9E9E),
      'number': 20,
      'iconData': Icons.cancel_outlined
    },
  ];

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
                itemCount: homeTile.length,
                itemBuilder: (BuildContext context, int index) {
                  return HomeOverviewItemTile(
                      title: homeTile[index]['title'],
                      color: homeTile[index]['color'],
                      number: homeTile[index]['number'],
                      iconData: homeTile[index]['iconData']);
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
