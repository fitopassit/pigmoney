import 'package:fl_chart/fl_chart.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

import 'boxes.dart';
import 'data.dart';

List<PieChartSectionData> getSections(Box<DataPie> type) => type.values
    .toList()
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
      //final isTouched = index == touchedIndex;
      //final double fontSize = isTouched ? 25 : 16;
      //final double radius = isTouched ? 100 : 80;
      double sum = 0;
      for (var transaction in type.values.toList()) {
        sum += transaction.cost;
      }
      data.percent = double.parse(((data.cost / sum) * 100).toStringAsFixed(2));
      final Color color = Color.fromARGB(
          int.parse(data.color.split(', ')[0]),
          int.parse(data.color.split(', ')[1]),
          int.parse(data.color.split(', ')[2]),
          int.parse(data.color.split(', ')[3]));
      final value = PieChartSectionData(
        radius: 100,
        color: color,
        value: data.percent,
        title: '${data.percent}%',
        showTitle: false,
        //radius: radius,
        titleStyle: TextStyle(
          //fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      );

      return MapEntry(index, value);
    })
    .values
    .toList();
