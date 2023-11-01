import 'package:flutter/material.dart';
import 'package:flutter_leadify/model/funnel_data_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FunnelChart extends StatelessWidget {
  const FunnelChart({super.key});

  final List<FunnelData> chartData = const [
    FunnelData('Awareness', 50),
    FunnelData('Interest', 20),
    FunnelData('Desire', 10),
    FunnelData('Action', 3),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: SfFunnelChart(
        series: FunnelSeries<FunnelData, String>(
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.inside,
              builder: (data, point, series, pointIndex, seriesIndex) {
                return Text(data.x + "-" + data.y.toString());
              },
            ),
            dataSource: chartData,
            xValueMapper: (FunnelData data, abc) => data.x,
            yValueMapper: (FunnelData data, _) => data.y),
      ),
    );
  }
}
