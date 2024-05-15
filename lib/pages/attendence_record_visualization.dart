import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AttendenceRecordVisualization extends StatefulWidget {
  const AttendenceRecordVisualization({super.key});

  @override
  State<AttendenceRecordVisualization> createState() =>
      _AttendenceRecordVisualizationState();
}

class _AttendenceRecordVisualizationState
    extends State<AttendenceRecordVisualization> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Barchart"),
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                      startDegreeOffset: 90,
                      sectionsSpace: 3,
                      centerSpaceRadius: 90,
                      sections: [
                        PieChartSectionData(
                            value: 15,
                            radius: 45,
                            color: Colors.greenAccent,
                            showTitle: true),
                        PieChartSectionData(
                            value: 50,
                            radius: 50,
                            color: Colors.greenAccent.shade100,
                            showTitle: true),
                        PieChartSectionData(
                            value: 25,
                            radius: 40,
                            color: Colors.greenAccent.shade400,
                            showTitle: true),
                        PieChartSectionData(
                            value: 10,
                            radius: 60,
                            color: Colors.greenAccent.shade700,
                            showTitle: true),
                      ]),
                ),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 10.0,
                                spreadRadius: 10.0,
                                offset: const Offset(3, 3),
                              )
                            ]),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // const CustomRadialChart(),
          
        ],
      ),
    );
  }
}

class CustomRadialChart extends StatelessWidget {
  const CustomRadialChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PieChart(PieChartData(sections: [
        PieChartSectionData(
            value: 25,
            radius: 40,
            color: const Color.fromARGB(255, 0, 35, 230),
            showTitle: true),
      ])),
    );
  }
}
