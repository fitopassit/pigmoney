import 'package:flutter/material.dart';

class Data {
  final String name;
  final double cost;
  final Color color;
  final double percent;

  Data(this.name, this.cost, this.color, this.percent);
}

class PieData {
  static List<Data> dataEx = [
    Data('Train', 100, Colors.blue, 10),
    Data('Education', 400, Colors.red, 40),
    Data('Cigarets', 200, Colors.green, 20),
    Data('Beer', 300, Colors.orange, 30),
  ];
}
