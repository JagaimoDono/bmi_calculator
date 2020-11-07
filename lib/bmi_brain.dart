import 'dart:math';

import 'package:flutter/cupertino.dart';

class BmiBrain {
  final int height;
  final int weight;

  double _bmi;

  BmiBrain({@required this.height, @required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'OK';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Watch out what you eat!';
    } else if (_bmi > 18.5) {
      return 'Great result, continue like that!';
    } else {
      return 'Time to bulk!';
    }
  }
}
