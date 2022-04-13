import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
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
                "Баланс: " +
                    (Hive.box<double>('balance').get('bal') == null
<<<<<<< HEAD
                        ? "0" + '\₽'
                        : Hive.box<double>('balance')
                            .get('bal')!
                            .toStringAsFixed(1)) +
                    '\₽',
=======
                        ? "0"
                        : Hive.box<double>('balance')
                            .get('bal')!
                            .toStringAsFixed(1)),
>>>>>>> 3ce7ce50cd477f2915cf851b1318b1898284a685
              );
            }),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: Drawer(
          child: SafeArea(
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
      ))),
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
                      child: Text("Nothing there"),
                    );
                  }
                  return SizedBox(
                    height: 35.0.h,
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
            label: 'Delete',
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
        ),
      ),
    );
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
        onPressed: () {},
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
