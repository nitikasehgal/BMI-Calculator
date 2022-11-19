import 'package:bmi_calculator/calculation.dart';
import 'package:bmi_calculator/inputpage.dart';
import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
        ),
        home: InputPage(),
        routes: {
          // 'result': (context) => Results(),
          'input': (context) => InputPage(),
        });
  }
}
