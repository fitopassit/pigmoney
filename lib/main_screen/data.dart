import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'data.g.dart';

@HiveType(typeId: 0)
class Data extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late double cost;
  @HiveField(2)
  late String color;
  @HiveField(3)
  late double percent;
  @HiveField(4)
  late String date;
  @HiveField(5)
  late String description;
}

@HiveType(typeId: 1)
class Balance extends HiveObject {
  @HiveField(0)
  static double balance = 0;
}

@HiveType(typeId: 2)
class DataPie extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late double cost;
  @HiveField(2)
  late String color;
  @HiveField(3)
  late double percent;
}
