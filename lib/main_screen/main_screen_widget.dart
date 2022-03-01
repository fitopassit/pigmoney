import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/rendering.dart';
import 'package:vk/main_screen/sections.dart';
import 'package:ionicons/ionicons.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financial Report', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
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
            icon: Icon(Ionicons.arrow_down_outline),
            label: 'Income',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.arrow_up_outline),
            label: 'Expense',
          )
        ],
        onTap: onSelectTab,
      ),
    );
  }

  OutlinedButton _addWidget() {
    return OutlinedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/add');
      },
      child: Icon(Icons.add_circle_outline, color: Colors.black),
      style: OutlinedButton.styleFrom(
          primary: Colors.white,
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
            primary: Colors.white),
        onPressed: () {},
        icon: Icon(Ionicons.grid_outline, color: Colors.blue),
        label: Text(
          'Category',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ));
  }
}
