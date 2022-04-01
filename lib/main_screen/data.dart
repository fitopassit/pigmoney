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
  late int color;
  @HiveField(3)
  late double percent;
}
