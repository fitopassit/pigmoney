import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:vk/main_screen/sections.dart';

class mainScreenWidget extends StatefulWidget {
  mainScreenWidget({Key? key}) : super(key: key);

  @override
  State<mainScreenWidget> createState() => _mainScreenWidgetState();
}

class _mainScreenWidgetState extends State<mainScreenWidget> {
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
                SizedBox(height: 40),
                _switchButton(),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [_categoryWidget(), Spacer(), _addWidget()]),
                ),
              ],
            )
          ],
        ),
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
        icon: Icon(Icons.arrow_downward, color: Colors.blue),
        label: Text(
          'Category',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ));
  }

  ToggleButtons _switchButton() {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(25),
      fillColor: Colors.blueAccent,
      color: Colors.black,
      selectedColor: Colors.white,
      isSelected: isSelected,
      onPressed: (int newIndex) {
        if (newIndex == 0) {}
        setState(() {
          for (int index = 0; index < isSelected.length; index++) {
            if (index == newIndex) {
              isSelected[index] = true;
            } else {
              isSelected[index] = false;
            }
          }
        });
      },
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Text(
            'Expense',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Text(
            'Income',
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
