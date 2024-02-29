import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class moodChart extends StatelessWidget {
  const moodChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, right: 16),
      child: AspectRatio(
        aspectRatio: 1,
        child: BarChart(
          BarChartData(
            barGroups: [
              BarChartGroupData(x: 0, barRods: [
                BarChartRodData(y: 57, colors: [Color(0xFF79AEFC)])
              ]),
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(y: 100, colors: [Color(0xFF66C0A6)])
              ]),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(y: 77, colors: [Color(0xFFFBADEE)])
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(y: 30, colors: [Color(0xFFFF4B4B)])
              ]),
            ],
            titlesData: FlTitlesData(
              leftTitles: SideTitles(showTitles: true),
              rightTitles: SideTitles(showTitles: false),
              topTitles: SideTitles(showTitles: false),
              bottomTitles: SideTitles(
                showTitles: true,
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Week 1';
                    case 1:
                      return 'Week 2';
                    case 2:
                      return 'Week 3';
                    case 3:
                      return 'Week 4';
                    default:
                      return '';
                  }
                },
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: const Color(0xff37434d),
                width: 1,
              ),
            ),
            gridData: FlGridData(show: false),
          ),
        ),
      ),
    );
  }
}
