import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:vk/main_screen/expense.dart';
import 'package:vk/main_screen/add_income_widget.dart';
import 'package:vk/main_screen/main_screen_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vk/main_screen/onboarding_screen_page.dart';
import 'package:vk/theme/theme.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vk/main_screen/data.dart';
import '../generated/l10n.dart';

class addMoneyBoxWidget extends StatefulWidget {
  addMoneyBoxWidget({Key? key}) : super(key: key);

  @override
  State<addMoneyBoxWidget> createState() => _addMoneyBoxWidgetState();
}

class _addMoneyBoxWidgetState extends State<addMoneyBoxWidget> {
  TextEditingController moneyBoxName = new TextEditingController();
  TextEditingController startDate = new TextEditingController();
  TextEditingController moneyBoxCost = new TextEditingController();
  TextEditingController endDate = new TextEditingController();
  late DateTime _myDateTime;
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedDateEnd = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text(S.of(context).New_money),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 20),
              child: TextField(
                  controller: moneyBoxName,
                  style: GoogleFonts.lato(fontSize: 20),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: S.of(context).Enter_name_money,
                      hintStyle: GoogleFonts.lato(
                        //color: Colors.white,
                        fontSize: 20,
                      ))),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                child: Text(
                  S.of(context).Date_create_pig,
                  style: GoogleFonts.lato(fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        enabled: false,
                        controller: startDate,
                        style: GoogleFonts.lato(fontSize: 15),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          // hintText: _selectedDate.day.toString() +
                          //     '.' +
                          //     _selectedDate.month.toString() +
                          //     '.' +
                          //     _selectedDate.year.toString(),
                          // hintStyle: GoogleFonts.lato(
                          //   //color: Colors.white,
                          //   fontSize: 15,
                          // )
                        )),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(5),
                        side: BorderSide.none,
                        shape: CircleBorder(side: BorderSide(width: 1.0)),
                      ),
                      onPressed: () async {
                        _myDateTime = (await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        ))!;
                        if (_myDateTime != null &&
                            _myDateTime != _selectedDate) {
                          setState(() {
                            _selectedDate = _myDateTime;
                            startDate.text = _myDateTime.day.toString() +
                                '.' +
                                _myDateTime.month.toString() +
                                '.' +
                                _myDateTime.year.toString();
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(7),
                        child: Icon(Ionicons.calendar_outline,
                            color: Color.fromARGB(255, 0, 0, 0), size: 25),
                      ))
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                child: Text(
                  S.of(context).Goal_data,
                  style: GoogleFonts.lato(fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                        keyboardType: TextInputType.datetime,
                        //enabled: false,
                        controller: moneyBoxCost,
                        style: GoogleFonts.lato(fontSize: 15),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: '0',
                            hintStyle: GoogleFonts.lato(
                              //color: Colors.white,
                              fontSize: 15,
                            ))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                        enabled: false,
                        controller: endDate,
                        style: GoogleFonts.lato(fontSize: 15),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          // hintText: _selectedDateEnd.day.toString() +
                          //     '.' +
                          //     _selectedDateEnd.month.toString() +
                          //     '.' +
                          //     _selectedDateEnd.year.toString(),
                          // hintStyle: GoogleFonts.lato(
                          //   //color: Colors.white,
                          //   fontSize: 15,
                          // )
                        )),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(5),
                        side: BorderSide.none,
                        shape: CircleBorder(side: BorderSide(width: 1.0)),
                      ),
                      onPressed: () async {
                        _myDateTime = (await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        ))!;
                        if (_myDateTime != null &&
                            _myDateTime != _selectedDateEnd) {
                          setState(() {
                            _selectedDateEnd = _myDateTime;
                            endDate.text = _myDateTime.day.toString() +
                                '.' +
                                _myDateTime.month.toString() +
                                '.' +
                                _myDateTime.year.toString();
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(7),
                        child: Icon(Ionicons.calendar_outline,
                            color: Color.fromARGB(255, 0, 0, 0), size: 25),
                      )),
                ],
              ),
            ),
            _continueWidget(context)
          ],
        ),
      ),
    );
  }

  Expanded _continueWidget(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: OutlinedButton(
              onPressed: () {
                addMoneyBox(
                    moneyBoxName.text,
                    _selectedDate.toString(),
                    double.parse(moneyBoxCost.text),
                    _selectedDateEnd.toString());
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).Add_Widget_Button,
                  style: GoogleFonts.lato(fontSize: 18, color: Colors.white)),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Theme.of(context).primaryColorDark,
              ),
            )),
      ),
    );
  }

  Future addMoneyBox(
      String name, String start_date, double cost, String end_date) async {
    final box = MoneyBox()
      ..name = name
      ..startDate = start_date
      ..cost = cost
      ..costNow = 0
      ..moneyBoxIncome = <String>[]
      ..endDate = end_date;
    // if (Hive.box<MoneyBox>('money_box').values.toList().isEmpty) {
    //   Hive.box<BalanceMoneyBox>('balance_money_box')
    //       .add(BalanceMoneyBox()..balance=cost);
    // }
    // else{
    //   Hive.box<BalanceMoneyBox>('balance_money_box').values.toList()[0]+=cost
    // }
    Hive.box<MoneyBox>('money_box').add(box);
    // bool check = false;
    // final data = Data()
    //   ..name = name
    //   ..cost = cost
    //   ..color = color
    //   ..percent = percent
    //   ..date = date
    //   ..description = description;
    // final dataPie = DataPie()
    //   ..name = name
    //   ..cost = cost
    //   ..color = color
    //   ..percent = percent;
    // final boxPie = Hive.box<DataPie>('data_income_pie');
    // for (var transaction in boxPie.values.toList()) {
    //   if (transaction.name == dataPie.name) {
    //     transaction.cost += dataPie.cost;
    //     transaction.save();
    //     check = true;
    //   }
    // }
    // if (!check) {
    //   boxPie.add(dataPie);
    // }
    // Balance.balance += cost;
    // final box = Boxes.getTransactionsIncome();
    // Hive.box<double>('balance').put('bal', Balance.balance);
    // box.add(data);
  }
}
