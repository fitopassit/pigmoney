import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/rendering.dart';
import 'package:vk/main_screen/sections.dart';
import 'package:ionicons/ionicons.dart';

import '../generated/l10n.dart';
import '../main.dart';

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
        title: Text(
          S.of(context).Financial_Report,
        ),
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
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 250,
                  height: 250,
                  child: PieChart(PieChartData(
                      sections: getSections(), centerSpaceRadius: 80)),
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
                _widgetOptions[_selectedTab],
              ],
            )
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
