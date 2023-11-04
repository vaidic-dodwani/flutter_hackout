import 'package:flutter/material.dart';
import 'package:flutter_hackout/model/closed_cases_data_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatelessWidget {
  const ColumnChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        axes: <ChartAxis>[
          NumericAxis(
            opposedPosition: true, // Position the axis on the right side
            title: AxisTitle(text: 'Left Axis'),
          ),
        ],
        series: <ChartSeries>[
          ColumnSeries<ClosedCasesData, String>(
            dataSource: <ClosedCasesData>[
              ClosedCasesData('Jan', 35),
              ClosedCasesData('Feb', 28),
              ClosedCasesData('Mar', 34),
              ClosedCasesData('Apr', 32),
              ClosedCasesData('May', 40),
            ],
            xValueMapper: (ClosedCasesData sales, _) => sales.month,
            yValueMapper: (ClosedCasesData sales, _) => sales.primaryAxisValue,
            yAxisName: 'Primary',
            name: 'Primary Axis',
          ),
          ColumnSeries<ClosedCasesData, String>(
            dataSource: <ClosedCasesData>[
              ClosedCasesData('Jan', 20),
              ClosedCasesData('Feb', 30),
              ClosedCasesData('Mar', 20),
              ClosedCasesData('Apr', 26),
              ClosedCasesData('May', 22),
            ],
            xValueMapper: (ClosedCasesData sales, _) => sales.month,
            yValueMapper: (ClosedCasesData sales, _) => sales.primaryAxisValue,
            yAxisName: 'Secondary',
            name: 'Secondary Axis',
          ),
        ],
      ),
    );
  }
}
