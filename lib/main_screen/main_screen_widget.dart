import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vk/main_screen/sections.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../generated/l10n.dart';
import '../main.dart';
import 'boxes.dart';
import 'data.dart';

class mainScreenWidget extends StatefulWidget {
  mainScreenWidget({Key? key}) : super(key: key);

  @override
  State<mainScreenWidget> createState() => _mainScreenWidgetState();
}

class _mainScreenWidgetState extends State<mainScreenWidget> {
  int _selectedTab = 0;
  String dropdownValue = 'Акции';
  late DateTime _myDateTime;
  DateTime _selectedDate = DateTime.now();
  List<Data> sorted_income = Hive.box<Data>('data_income').values.toList();
  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Income',
    ),
    Text(
      'Expense',
    ),
  ];

  List<bool> isSelected = [true, false];
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: ValueListenableBuilder(
            valueListenable: Hive.box<double>('balance').listenable(),
            builder: (context, box, _) {
              return Text(
                S.of(context).Balance +
                    (Hive.box<double>('balance').get('bal') == null
                        ? "0"
                        : Hive.box<double>('balance')
                            .get('bal')!
                            .toStringAsFixed(1)) +
                    '\₽',
              );
            }),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: Drawer(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SafeArea(
              child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: ThemeSwitcher(
                  clipper: const ThemeSwitcherBoxClipper(),
                  builder: (context) {
                    return IconButton(
                      onPressed: () async {
                        var themeName = ThemeModelInheritedNotifier.of(context)
                                    .theme
                                    .brightness ==
                                Brightness.light
                            ? 'dark'
                            : 'light';
                        var service = await ThemeService.instance
                          ..save(themeName);
                        var theme = service.getByName(themeName);
                        ThemeSwitcher.of(context).changeTheme(theme: theme);
                      },
                      icon: const Icon(Ionicons.moon_outline, size: 25),
                    );
                  },
                ),
              )
            ],
          )),
          ListTile(
            leading: const Icon(Ionicons.home_outline, size: 25),
            title: Text(
              S.of(context).Main,
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/main_screen');
            },
          ),
          ListTile(
            leading: const Icon(Ionicons.wallet_outline, size: 25),
            title: Text(
              S.of(context).Piggy_bank,
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/moneyBox');
            },
          ),
        ],
      )),
      body: Container(
        //color: Theme.of(context).primaryColorLight,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 100.0.w,
              height: 30.0.h,
              child: ValueListenableBuilder(
                  valueListenable: listen(),
                  builder: (context, box, _) {
                    //final transactions = box.values.toList().cast<Data>();

                    return PieChart(PieChartData(
                        sections: getSections(getBox()),
                        centerSpaceRadius: 0,
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 0));
                  }),
            ),
            //SizedBox(height: 40),
            // _switchButton(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [_categoryWidget(), Spacer(), _addWidget()]),
            ),
            SizedBox(height: 20),
            ValueListenableBuilder<Box<Data>>(
                valueListenable: listen(),
                builder: (context, box, _) {
                  final transactions = box.values.toList().cast<Data>();
                  if (transactions.isEmpty) {
                    return Center(
                      child: Text(S.of(context).Nothing_there),
                    );
                  }
                  return Expanded(
                    //height: 30.0.h,
                    child: ListView.builder(
                        reverse: true,
                        padding: EdgeInsets.all(8),
                        itemCount: transactions.length,
                        itemBuilder: (BuildContext context, int index) {
                          final transaction = transactions[index];
                          return buildTransaction(transaction, context);
                        }),
                  );
                }),
            //_widgetOptions[_selectedTab],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.arrow_down_outline,
            ),
            label: S.of(context).Income,
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.arrow_up_outline),
            label: S.of(context).Expense,
          )
        ],
        onTap: onSelectTab,
      ),
    );
  }

  ValueListenable<Box<Data>> listen() {
    ValueListenable<Box<Data>> value = _selectedTab == 0
        ? Boxes.getTransactionsIncome().listenable()
        : Boxes.getTransactionsExpense().listenable();
    return value;
  }

  Box<DataPie> getBox() {
    Box<DataPie> data = _selectedTab == 0
        ? Hive.box<DataPie>('data_income_pie')
        : Hive.box<DataPie>('data_expense_pie');
    return data;
  }

  Widget buildTransaction(Data data, BuildContext context) {
    final color = Color.fromARGB(
        int.parse(data.color.split(', ')[0]),
        int.parse(data.color.split(', ')[1]),
        int.parse(data.color.split(', ')[2]),
        int.parse(data.color.split(', ')[3]));
    bool isExpense = _selectedTab == 0 ? false : true;
    final cost = '\₽' + data.cost.toStringAsFixed(2);
    final name = data.name;
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: UniqueKey(),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible:
            DismissiblePane(onDismissed: () => deleteTransaction(data)),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (BuildContext context) => deleteTransaction(data),
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: S.of(context).Delete,
          ),
        ],
      ),
      endActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        //dismissible: DismissiblePane(onDismissed: () => {}),

        // All actions are defined in the children parameter.
        children: [
          SlidableAction(
            onPressed: (BuildContext context) => {
              // Navigator.push(
              //     context,
              //     PageRouteBuilder(
              //         opaque: false,
              //         pageBuilder: (BuildContext context, _, __) => editScreen(
              //               name: data.name,
              //               cost: data.cost,
              //               date: data.date,
              //               description: data.description,
              //             )))
              showAlertDialog(context, data)
            },
            backgroundColor: Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.info,
            label: S.of(context).Info,
          ),
        ],
      ),
      child: Card(
        color: isExpense == false
            ? Color.fromARGB(255, 43, 148, 106)
            : Color.fromARGB(255, 224, 67, 75),
        child: ExpansionTile(
          title: Text(
            name,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          trailing: Text(
            cost,
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
      ),
    );
  }

  showAlertDialog(BuildContext context, Data transaction) async {
    final date_controller = TextEditingController();
    final description_controller = TextEditingController();
    final cost_controller = TextEditingController();
    String hint_date = DateTime.parse(transaction.date).day.toString() +
        '.' +
        DateTime.parse(transaction.date).month.toString() +
        '.' +
        DateTime.parse(transaction.date).year.toString();
    // List<String> data_income = ["Акции", "Подарки", "Зарплата", "Ещё"];
    // List<String> data_expense = [
    //   "Образование",
    //   "Тренировка",
    //   "Транспорт",
    //   "Семья",
    //   "Продукты",
    //   "Подарки",
    //   "Кафе",
    //   "Ещё"
    // ];
    // String dropdownValue = _selectedTab == 0 ? "Акции" : "Образование";

    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text(S.of(context).Change_Transaction)),
            content: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(S.of(context).Category_one),
                      SizedBox(
                        width: 40,
                      ),
                      Expanded(
                          child: TextField(
                        //controller: cost_controller,
                        enabled: false,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                            hintText: transaction.name.toString(),
                            hintStyle: GoogleFonts.lato(
                              //color: Colors.white,
                              fontSize: 15,
                            )),
                      ))
                      // DropdownButton<String>(
                      //   value: dropdownValue,
                      //   icon: const Icon(Icons.arrow_downward),
                      //   elevation: 16,
                      //   //style: const TextStyle(color: Colors.deepPurple),
                      //   underline: Container(
                      //     height: 2,
                      //     color: Theme.of(context).shadowColor,
                      //   ),
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       dropdownValue = newValue!;
                      //     });
                      //   },
                      //   items: (_selectedTab == 0 ? data_income : data_expense)
                      //       .map<DropdownMenuItem<String>>((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(S.of(context).Cost),
                      SizedBox(width: 40),
                      Expanded(
                          child: TextFormField(
                        enabled: false,
                        controller: cost_controller,
                        style: TextStyle(fontSize: 15),
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: transaction.cost.toString(),
                            hintStyle: GoogleFonts.lato(
                              //color: Colors.white,
                              fontSize: 15,
                            )),
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Text(S.of(context).Date),
                      SizedBox(width: 40),
                      Expanded(
                          child: TextFormField(
                        enabled: false,
                        //controller: controller,
                        style: TextStyle(fontSize: 15),
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: hint_date,
                            hintStyle: GoogleFonts.lato(
                              //color: Colors.white,
                              fontSize: 15,
                            )),
                      )),
                    ],
                  ),
                  Row(children: [
                    Text(S.of(context).Description),
                    SizedBox(width: 20),
                    Expanded(
                        child: TextField(
                      enabled: false,
                      controller: description_controller,
                      style: TextStyle(fontSize: 15),
                      //keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: transaction.description.toString(),
                          hintStyle: GoogleFonts.lato(
                            //color: Colors.white,
                            fontSize: 15,
                          )),
                    ))
                  ])
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
                  editTransaction(
                      transaction,
                      double.parse(cost_controller.text),
                      _selectedDate.toString(),
                      description_controller.text.toString());
                  Navigator.pop(context);
                },
                child: Text(S.of(context).Ok),
              ),
            ],
          );
        });
  }

  OutlinedButton _addWidget() {
    return OutlinedButton(
      onPressed: () {
        if (_selectedTab == 0) {
          Navigator.of(context).pushNamed('/addIncome');
        } else {
          Navigator.of(context).pushNamed('/addExpense');
        }
      },
      child: Icon(
        Icons.add_circle_outline,
        color: Theme.of(context).shadowColor,
      ),
      style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  OutlinedButton _categoryWidget() {
    return OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          onSurface: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          //primary: Theme.of(context).primaryColorLight
        ),
        onPressed: () {
          if (_selectedTab == 0) {
            sorted_income = Hive.box<Data>('data_income').values.toList();
            // List<Data> sorted = Hive.box<Data>('data_income').values.toList();
            sorted_income.sort((a, b) {
              int aDate = DateTime.parse(a.date).microsecondsSinceEpoch;
              int bDate = DateTime.parse(b.date).microsecondsSinceEpoch;
              return aDate.compareTo(bDate);
            });
          }
        },
        icon: Icon(Ionicons.grid_outline, color: Theme.of(context).shadowColor),
        label: Text(
          S.of(context).Category,
          style: TextStyle(color: Theme.of(context).shadowColor, fontSize: 15),
        ));
  }

  void deleteTransaction(Data data) {
    bool isExpense = _selectedTab == 0 ? false : true;
    final boxPie;
    if (isExpense == false) {
      Balance.balance -= data.cost;
      boxPie = Hive.box<DataPie>('data_income_pie');
    } else {
      Balance.balance += data.cost;
      boxPie = Hive.box<DataPie>('data_expense_pie');
    }
    // isExpense == false
    //     ? Balance.balance -= data.cost
    //     : Balance.balance += data.cost;
    for (var transaction in boxPie.values.toList()) {
      if (transaction.name == data.name) {
        transaction.cost -= data.cost;
        transaction.save();
        if (transaction.cost == 0) {
          transaction.delete();
        }
        break;
      }
    }
    Hive.box<double>('balance').put('bal', Balance.balance);
    data.delete();
  }

  void editTransaction(
      Data transaction, double cost, String date, String description) {
    String category = transaction.name;
    final boxPie = _selectedTab == 0
        ? Hive.box<DataPie>('data_income_pie')
        : Hive.box<DataPie>('data_expense_pie');
    double real_cost = cost - transaction.cost;

    bool check = false;
    if (transaction.name == category) {
      for (var data in boxPie.values.toList()) {
        if (data.name == transaction.name) {
          data.cost += real_cost;
          data.save();
        }
      }
    } else {
      for (var data in boxPie.values.toList()) {
        if (data.name == transaction.name) {
          data.cost -= data.cost;
          data.save();
        }
      }
      for (var data in boxPie.values.toList()) {
        if (data.name == category) {
          data.cost += cost;
          data.save;
          check = true;
        }
      }
    }

    Balance.balance += _selectedTab == 0 ? real_cost : (-real_cost);
    Hive.box<double>('balance').put('bal', Balance.balance);

    final box = _selectedTab == 0
        ? Boxes.getTransactionsIncome()
        : Boxes.getTransactionsExpense();
    transaction.name = category;
    transaction.cost = cost;
    transaction.date = date;
    transaction.description = description;
    transaction.save();
  }

  // Widget buildSwitch() {
  //   return Switch(
  //       value: isSwitched,
  //       onChanged: (value) {
  //         setState(() {
  //           isSwitched = value;
  //           if (isSwitched) {
  //             ThemeProvider.controllerOf(context)
  //                 .setTheme('default_dark_theme');
  //           } else {
  //             ThemeProvider.controllerOf(context)
  //                 .setTheme('default_light_theme');
  //           }
  //         });
  //       });
  // }

}

class InfoScreen extends StatefulWidget {
  final String name;
  final double cost;
  final String date;
  final String description;
  InfoScreen(
      {Key? key,
      required this.name,
      required this.cost,
      required this.date,
      required this.description})
      : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String dropdownValue = 'Акции';
  late DateTime _myDateTime;
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(S.of(context).Change_Transaction)),
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            Row(
              children: [
                Text(S.of(context).Category_one),
                SizedBox(
                  width: 40,
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  //style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Theme.of(context).shadowColor,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>[
                    S.of(context).Category_Stock,
                    S.of(context).Category_Gifts,
                    S.of(context).Category_Paycheck,
                    S.of(context).Category_More
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            Row(
              children: [
                Text(S.of(context).Cost),
                SizedBox(width: 40),
                Expanded(
                    child: TextField(
                  //controller: controller,
                  enabled: false,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: widget.cost.toString(),
                      hintStyle: GoogleFonts.lato(
                        //color: Colors.white,
                        fontSize: 15,
                      )),
                ))
              ],
            ),
            Row(
              children: [
                Text(S.of(context).Date),
                SizedBox(width: 40),
                Expanded(
                    child: TextField(
                  enabled: false,
                )),
              ],
            ),
            Row(children: [
              Text(S.of(context).Description),
              SizedBox(width: 20),
              Expanded(
                  child: TextField(
                enabled: false,
              ))
            ])
          ],
        ),
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(S.of(context).More),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(S.of(context).Less),
        ),
      ],
    );
  }
}
