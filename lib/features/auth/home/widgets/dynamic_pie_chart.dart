import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DynamicPieChart extends StatelessWidget {
  final int maleEmployees; // Number of male employees
  final int femaleEmployees; // Number of female employees

  const DynamicPieChart({
    super.key,
    required this.maleEmployees,
    required this.femaleEmployees,
  });

  @override
  Widget build(BuildContext context) {
    final totalEmployees = maleEmployees + femaleEmployees;

    return SizedBox(
      height: 120, // Further reduced size
      width: 120,  // Further reduced size
      child: PieChart(
        PieChartData(
          sectionsSpace: 2, // Slight spacing between chart sections
          centerSpaceRadius: 20, // Smaller center space for compactness
          sections: [
            PieChartSectionData(
              value: maleEmployees.toDouble(),
              color: Colors.blue,
              radius: 40,
              title: '👨 ${(maleEmployees / totalEmployees * 100).toStringAsFixed(1)}%',
              titleStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            PieChartSectionData(
              value: femaleEmployees.toDouble(),
              color: Colors.purple,
              radius: 40,
              title: '👩 ${(femaleEmployees / totalEmployees * 100).toStringAsFixed(1)}%',
              titleStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeeComposition extends StatelessWidget {
  final int maleEmployees;
  final int femaleEmployees;

  const EmployeeComposition({
    super.key,
    required this.maleEmployees,
    required this.femaleEmployees,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Employee Composition Title
        const Text(
          'Employee Composition',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),

        // Pie Chart with Embedded Icons
        Center(
          child: DynamicPieChart(
            maleEmployees: maleEmployees,
            femaleEmployees: femaleEmployees,
          ),
        ),

        // Total breakdown information
        const SizedBox(height: 20),
        Text(
          'Total Employees: ${maleEmployees + femaleEmployees}',
          style: const TextStyle(fontSize: 14),
        ),
        Text(
          'Male: ${(maleEmployees / (maleEmployees + femaleEmployees) * 100).toStringAsFixed(2)}%',
          style: const TextStyle(fontSize: 14, color: Colors.blue),
        ),
        Text(
          'Female: ${(femaleEmployees / (maleEmployees + femaleEmployees) * 100).toStringAsFixed(2)}%',
          style: const TextStyle(fontSize: 14, color: Colors.purple),
        ),
      ],
    );
  }
}
