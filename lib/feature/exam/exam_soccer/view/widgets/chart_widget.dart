import 'package:exam_app/feature/exam/domain/entities/check_question_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key, required this.percentage,});

  final CheckQuestionEntity percentage;


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    String raw = percentage.total ?? "0";
    String cleaned = raw.replaceAll("%", "").trim();
    double value = double.tryParse(cleaned) ?? 0;
    String displayValue = "${value.toStringAsFixed(0)}%";

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
                      value: value,
                      radius: 8,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      color: AppColors.red,
                      value: 100-value,
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
                displayValue,
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
