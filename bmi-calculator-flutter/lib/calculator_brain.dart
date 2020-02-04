

import 'dart:math';

class CalculatorBrain{

  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({this.weight,this.height});

  String calculateBMI(){
    _bmi = weight / pow (height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi>=25){
      return 'overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }


  String getInterpretation(){
    if (_bmi>=25){
      return 'overweight, exercise and lose weight';
    } else if (_bmi > 18.5) {
      return 'Normal, you are good';
    } else {
      return 'Underweight, you need to gain some weight mate';
    }
  }
}