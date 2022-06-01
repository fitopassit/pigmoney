import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vk/main_screen/data.dart';

import '../generated/l10n.dart';

class editMoneyBox extends StatefulWidget {
  // final String name;
  // final String start_date;
  // final double cost;
  // final double costNow;
  // final String endDate;
  final MoneyBox moneyBox;
  editMoneyBox(
      {Key? key,
      // required this.name,
      // required this.start_date,
      // required this.cost,
      // required this.costNow,
      // required this.endDate
      required this.moneyBox})
      : super(key: key);

  @override
  State<editMoneyBox> createState() => _editMoneyBoxState();
}

class _editMoneyBoxState extends State<editMoneyBox> {
  TextEditingController moneyBoxName = new TextEditingController();
  late DateTime _myDateTime;
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedDateEnd = DateTime.now();
  TextEditingController startDate = new TextEditingController();
  TextEditingController moneyBoxCost = new TextEditingController();
  TextEditingController endDate = new TextEditingController();
  TextEditingController incomeMoneyBox = new TextEditingController();
  TextEditingController expenseMoneyBox = new TextEditingController();
  late bool deleted;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moneyBoxName.text = widget.moneyBox.name;
    moneyBoxCost.text = widget.moneyBox.cost.toStringAsFixed(2);
    endDate.text = DateTime.parse(widget.moneyBox.endDate).day.toString() +
        '.' +
        DateTime.parse(widget.moneyBox.endDate).month.toString() +
        '.' +
        DateTime.parse(widget.moneyBox.endDate).year.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text(S.of(context).History_trans),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () async {
                await showDeleteAlertDialog(context);
                if (deleted == true) {
                  Navigator.of(context).pop();
                }
                //Navigator.of(context).pop();
              },
              icon: Icon(Ionicons.trash_outline, size: 25))
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              showExpenseAlertDialog(context, widget.moneyBox);
              // widget.moneyBox.moneyBoxIncome.add("Expense, num");
              // widget.moneyBox.costNow -= 2000;
              // widget.moneyBox.save();
            },
            backgroundColor: Colors.red,
            child: const Icon(Ionicons.remove_outline,
                size: 30, color: Colors.white),
            heroTag: null,
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              showIncomeAlertDialog(context, widget.moneyBox);
            },
            backgroundColor: Colors.green,
            child:
                const Icon(Ionicons.add_outline, size: 30, color: Colors.white),
            heroTag: null,
          ),
        ],
      ),
      body: Container(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: SizedBox(
              height: 20.h,
              width: 20.h,
              child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  color: Colors.purple,
                  strokeWidth: 10,
                  value: widget.moneyBox.costNow / widget.moneyBox.cost),
            ),
          ),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: Padding(
          //     padding:
          //         const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
          //     child: Text(
          //       "Название копилки",
          //       style: GoogleFonts.lato(fontSize: 15),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding:
          //       const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 20),
          //   child: TextField(
          //       enabled: false,
          //       controller: (moneyBoxName),
          //       style: GoogleFonts.lato(fontSize: 20),
          //       decoration: InputDecoration(
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(15)),
          //       )),
          // ),
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
                      enabled: false,
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
          Center(
              child: Text(
            S.of(context).History,
            style: GoogleFonts.lato(fontSize: 18),
          )),
          ValueListenableBuilder<List<String>>(
              valueListenable: ValueNotifier(
                widget.moneyBox.moneyBoxIncome,
              ),
              builder: (context, box, _) {
                final data = widget.moneyBox.moneyBoxIncome;
                if (data.isEmpty) {
                  return Center(
                    child: Text(S.of(context).Nothing_there),
                  );
                }
                return Expanded(
                  //height: 40.0.h,
                  child: ListView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final datas = data[index];
                        return buildTransactionMoneyBox(datas, context);
                      }),
                );
              }),
        ],
      )),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  showExpenseAlertDialog(BuildContext context, MoneyBox data) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text(S.of(context).Adding_in_Pig)),
            content: SizedBox(
              height: 150,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(S.of(context).Taking_from_the_piggy,
                          style: GoogleFonts.lato(fontSize: 15))),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Expanded(
                        child: TextField(
                            keyboardType: TextInputType.datetime,
                            controller: expenseMoneyBox,
                            style: GoogleFonts.lato(fontSize: 15),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                hintText: '0',
                                hintStyle: GoogleFonts.lato(
                                  //color: Colors.white,
                                  fontSize: 15,
                                )))),
                  )
                ],
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.of(context).Cancel),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    data.moneyBoxIncome.add("Expense, " + expenseMoneyBox.text);
                    data.costNow -= double.parse(expenseMoneyBox.text);
                    Balance.balance += double.parse(expenseMoneyBox.text);
                    Hive.box<double>('balance').put('bal', Balance.balance);
                    BalanceMoneyBox.balance -=
                        double.parse(expenseMoneyBox.text);
                    Hive.box<double>('balance_money_box')
                        .put('bal', BalanceMoneyBox.balance);
                    data.save();
                  });
                  Navigator.pop(context);
                },
                child: Text(S.of(context).Ok),
              ),
            ],
          );
        });
  }

  showIncomeAlertDialog(BuildContext context, MoneyBox data) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text(S.of(context).Adding_in_Pig)),
            content: SizedBox(
              height: 150,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(S.of(context).Piggy_add,
                          style: GoogleFonts.lato(fontSize: 15))),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Expanded(
                        child: TextField(
                            keyboardType: TextInputType.datetime,
                            controller: incomeMoneyBox,
                            style: GoogleFonts.lato(fontSize: 15),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                hintText: '0',
                                hintStyle: GoogleFonts.lato(
                                  //color: Colors.white,
                                  fontSize: 15,
                                )))),
                  )
                ],
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.of(context).Cancel),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    data.moneyBoxIncome.add("Income, " + incomeMoneyBox.text);
                    data.costNow += double.parse(incomeMoneyBox.text);
                    Balance.balance -= double.parse(incomeMoneyBox.text);
                    Hive.box<double>('balance').put('bal', Balance.balance);
                    BalanceMoneyBox.balance +=
                        double.parse(incomeMoneyBox.text);
                    Hive.box<double>('balance_money_box')
                        .put('bal', BalanceMoneyBox.balance);
                    data.save();
                  });
                  Navigator.pop(context);
                },
                child: Text(S.of(context).Ok),
              ),
            ],
          );
        });
  }

  showDeleteAlertDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text(S.of(context).Piggy_delete)),
            actions: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    deleted = true;
                    Balance.balance += widget.moneyBox.costNow;
                    Hive.box<double>('balance').put('bal', Balance.balance);
                    BalanceMoneyBox.balance -= widget.moneyBox.costNow;
                    Hive.box<double>('balance_money_box')
                        .put('bal', BalanceMoneyBox.balance);
                    widget.moneyBox.delete();
                  });
                  Navigator.pop(context);
                },
                child: Text(S.of(context).Yes),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    deleted = false;
                  });
                  Navigator.pop(context);
                },
                child: Text(S.of(context).No),
              ),
            ],
          );
        });
  }

  Widget buildTransactionMoneyBox(String datas, BuildContext context) {
    // final color = Color.fromARGB(
    //     int.parse(data.color.split(', ')[0]),
    //     int.parse(data.color.split(', ')[1]),
    //     int.parse(data.color.split(', ')[2]),
    //     int.parse(data.color.split(', ')[3]));
    // bool isExpense = _selectedTab == 0 ? false : true;
    // final cost = '\₽' + data.cost.toStringAsFixed(2);
    // final name = data.name;
    var trans = datas.split(', ');
    final name = trans[0];
    final cost = double.parse(trans[1]);
    bool isExpense = name == S.of(context).Expense ? true : false;
    String titl = isExpense == true ? S.of(context).Taken : S.of(context).Added;
    String sign = isExpense == true ? '-' : '+';
    return Card(
      color: isExpense == false
          ? Color.fromARGB(255, 43, 148, 106)
          : Color.fromARGB(255, 224, 67, 75),
      child: ExpansionTile(
        title: Text(
          titl,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        trailing: Text(
          sign + cost.toString(),
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        children: [
          // OutlinedButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           PageRouteBuilder(
          //               opaque: false,
          //               pageBuilder: (BuildContext context, _, __) =>
          //                   editScreen()));
          //     },
          //     child: Text("Edit",
          //         style: TextStyle(fontSize: 16, color: Colors.white)),
          //     style: OutlinedButton.styleFrom(side: BorderSide.none))
        ],
      ),
    );
  }
}
