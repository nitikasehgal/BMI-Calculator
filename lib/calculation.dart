import 'dart:math';

class calculation {
  calculation(this.height, this.weight);
  int height;
  int weight;

  double _bmi = 0.0;
  String calculateres() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight.Try to exercise more!";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight.Good job!";
    } else {
      return "You have a normal body weight.Eat more!";
    }
  }
}
