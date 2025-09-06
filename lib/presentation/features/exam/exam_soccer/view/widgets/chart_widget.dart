import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key, required this.percentage,});

  final double percentage;


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: PieChart(
                PieChartData(
                  startDegreeOffset: 260,
                  sectionsSpace: 8,
                  centerSpaceRadius: 65, // مساحة فاضية في النص
                  sections: [
                    PieChartSectionData(
                      color: AppColors.blue,
                      value: percentage,
                      radius: 8,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      color: AppColors.red,
                      value: 100 - percentage,
                      radius: 8,
                      showTitle: false,

                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${percentage.toStringAsFixed(0)}%",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
