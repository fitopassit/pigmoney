import 'package:hive/hive.dart';
import 'data.dart';

class Boxes {
  static Box<Data> getTransactions() => Hive.box<Data>('data');
}
