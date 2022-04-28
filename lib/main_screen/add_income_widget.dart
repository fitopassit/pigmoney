import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ionicons/ionicons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../generated/l10n.dart';
import 'boxes.dart';
import 'data.dart';

class addIncomeWidget extends StatefulWidget {
  addIncomeWidget({Key? key}) : super(key: key);

  @override
  State<addIncomeWidget> createState() => _addIncomeWidgetState();
}

class _addIncomeWidgetState extends State<addIncomeWidget> {
  //@override
  // void dispose() {
  //   Hive.box('data_income').close();
  //   super.dispose();
  // }
  DateTime _selectedDate = DateTime.now();
  late List<Color> colors = [
    Theme.of(context).bottomAppBarColor,
    Theme.of(context).bottomAppBarColor,
    Theme.of(context).bottomAppBarColor,
    Theme.of(context).bottomAppBarColor,
  ];
  late List<Color> textColors = [
    Theme.of(context).hintColor,
    Theme.of(context).hintColor,
    Theme.of(context).hintColor,
    Theme.of(context).hintColor,
  ];
  late DateTime _myDateTime;
  final controller = TextEditingController();
  final description_controller = TextEditingController();
  late String col;
  late String category_name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorLight,
          elevation: 0.0,
          title: Text(S.of(context).Income),
          centerTitle: true,
        ),
        //backgroundColor: Theme.of(context).backgroundColor,
        body: ListView(children: [
          Column(
            children: [
              Container(
                color: Theme.of(context).primaryColorLight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(S.of(context).How_Much_Income,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        controller: controller,
                        style: TextStyle(fontSize: 50, color: Colors.white),
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "0",
                            hintStyle: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 50,
                            )),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: Theme.of(context).bottomAppBarColor,
                      ),
                      width: double.infinity,
                      height: 572,
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _categoryButton(S.of(context).Category_Stock,
                                  Colors.pink, Ionicons.analytics_outline, 0),
                              _categoryButton(S.of(context).Category_Gifts,
                                  Colors.blue, Ionicons.gift_outline, 1),
                              _categoryButton(
                                  S.of(context).Category_Paycheck,
                                  Color.fromARGB(255, 56, 230, 192),
                                  Ionicons.cash_outline,
                                  2),
                              _categoryButton(
                                  S.of(context).Category_More,
                                  Color.fromARGB(255, 247, 7, 207),
                                  Ionicons.ellipsis_horizontal_outline,
                                  3),
                            ],
                          ),
                          SizedBox(height: 20),
                          _descriptionWidget(context),
                          Align(
                              alignment: Alignment.centerRight,
                              child: _dataButton(Ionicons.calendar_outline)),
                          Spacer(),
                          _continueWidget(context)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ]));
  }

  Padding _descriptionWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: TextField(
        controller: description_controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(15)),
          hintText: S.of(context).Add_Widget_Description,
        ),
      ),
    );
  }

  Padding _continueWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: OutlinedButton(
        onPressed: () {
          addTransaction(
              category_name,
              double.parse(controller.text),
              col,
              double.parse(controller.text) / 100,
              _selectedDate.toLocal().toString(),
              description_controller.text.toString());
          Navigator.of(context).pop();
        },
        child: Text(
          S.of(context).Add_Widget_Button,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        style: OutlinedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
      ),
    );
  }

  OutlinedButton _dataButton(IconData icon) {
    return OutlinedButton(
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
          if (_myDateTime != null && _myDateTime != _selectedDate) {
            setState(() {
              _selectedDate = _myDateTime;
            });
          }
        },
        child: Container(
          padding: EdgeInsets.all(7),
          child: Icon(icon, color: Color.fromARGB(255, 0, 0, 0), size: 30),
        ));
  }

  OutlinedButton _categoryButton(
      String name, Color color, IconData icon, int index) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: colors[index],
            minimumSize: Size.square(100),
            padding: EdgeInsets.all(10),
            side: BorderSide.none),
        onPressed: () {
          setState(() {
            col = color.alpha.toString() +
                ', ' +
                color.red.toString() +
                ', ' +
                color.green.toString() +
                ', ' +
                color.blue.toString() +
                ', ';
            category_name = name;
            for (int buttonIndex = 0;
                buttonIndex < colors.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                colors[buttonIndex] = color;
                textColors[buttonIndex] = Colors.white;
              } else {
                colors[buttonIndex] = Theme.of(context).bottomAppBarColor;
                textColors[buttonIndex] = Theme.of(context).hintColor;
              }
            }
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(7),
              child: Icon(icon, color: Colors.white, size: 50),
              decoration: new BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            Text(name,
                style: GoogleFonts.lato(
                    color: textColors[index],
                    fontSize: 12,
                    fontWeight: FontWeight.w700))
          ],
        ));
  }

  Future addTransaction(String name, double cost, String color, double percent,
      String date, String description) async {
    bool check = false;
    final data = Data()
      ..name = name
      ..cost = cost
      ..color = color
      ..percent = percent
      ..date = date
      ..description = description;
    final dataPie = DataPie()
      ..name = name
      ..cost = cost
      ..color = color
      ..percent = percent;
    final boxPie = Hive.box<DataPie>('data_income_pie');
    for (var transaction in boxPie.values.toList()) {
      if (transaction.name == dataPie.name) {
        transaction.cost += dataPie.cost;
        transaction.save();
        check = true;
      }
    }
    if (!check) {
      boxPie.add(dataPie);
    }
    Balance.balance += cost;
    final box = Boxes.getTransactionsIncome();
    Hive.box<double>('balance').put('bal', Balance.balance);
    box.add(data);
  }
}
