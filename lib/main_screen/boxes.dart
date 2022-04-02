import 'package:hive/hive.dart';
import 'data.dart';
//import 'package:hive_database_example/main_screen/data.dart';

class Boxes {
  static Box<Data> getTransactionsExpense() {
    return Hive.box<Data>('data_expense');
  }

  static Box<Data> getTransactionsIncome() {
    return Hive.box<Data>('data_income');
  }
}
