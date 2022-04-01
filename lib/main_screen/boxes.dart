import 'package:hive/hive.dart';
import 'data.dart';
//import 'package:hive_database_example/main_screen/data.dart';

class Boxes {
  static Box<Data> getTransactions() {
    return Hive.box<Data>('data');
  }
}
