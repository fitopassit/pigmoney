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

@HiveType(typeId: 3)
class MoneyBox extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String startDate;
  @HiveField(2)
  late double cost;
  @HiveField(3)
  late String endDate;
  @HiveField(4)
  late double costNow;
  @HiveField(5)
  late List<String> moneyBoxIncome;
}

@HiveType(typeId: 4)
class BalanceMoneyBox extends HiveObject {
  @HiveField(0)
  static double balance = 0;
}
