import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:vk/main_screen/data.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:vk/main_screen/sections.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../generated/l10n.dart';
import '../main.dart';
import 'data.dart';

import 'EditMoneyBox.dart';

class moneyBoxPage extends StatefulWidget {
  moneyBoxPage({Key? key}) : super(key: key);

  @override
  State<moneyBoxPage> createState() => _moneyBoxPageState();
}

class _moneyBoxPageState extends State<moneyBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text('Копилки'),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/addMoneyBox');
              },
              icon: Icon(Ionicons.add_circle_outline, size: 25))
        ],
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
              "Главная",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/main_screen');
            },
          ),
          ListTile(
            leading: const Icon(Ionicons.wallet_outline, size: 25),
            title: Text(
              "Копилка",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/moneyBox');
            },
          ),
        ],
      )),
      body: Container(
        child: Column(
          children: [
            SafeArea(
                child: Card(
              margin: EdgeInsets.only(top: 20, bottom: 20, right: 8, left: 8),
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(15)),
              //color: Colors.blue,
              child: ListTile(
                  //isThreeLine: true,
                  leading: Container(
                    padding: EdgeInsets.all(7),
                    child: const Icon(
                      Ionicons.cash_outline,
                      size: 30,
                      color: Colors.white,
                    ),
                    decoration: new BoxDecoration(
                      color: Theme.of(context).hoverColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  // subtitle: Column(
                  //   children: [
                  //     Align(
                  //         alignment: Alignment.bottomRight,
                  //         child: Text("Накопить стоко та до 21.02.2022")),
                  //     // Align(
                  //     //     alignment: Alignment.bottomCenter,
                  //     //     child: LinearProgressIndicator(
                  //     //       value:
                  //     //     ),
                  //     //     )
                  //   ],
                  // ),
                  title: ValueListenableBuilder(
                      valueListenable:
                          Hive.box<double>('balance_money_box').listenable(),
                      builder: (context, box, _) {
                        return Text("Всего в копилках:\n" +
                            (Hive.box<double>('balance_money_box').get('bal') ==
                                    null
                                ? "0"
                                : Hive.box<double>('balance_money_box')
                                    .get('bal')!
                                    .toStringAsFixed(2)));
                      })),
            )),
            // SafeArea(
            //   child: SizedBox(
            //     height: 70.0.h,
            //     child: ListView(
            //       children: [
            //         Card(
            //           child: ListTile(
            //               leading: const Icon(Ionicons.cash_outline, size: 20),
            //               title: Text("Всего в копилках:\n0Р")),
            //         ),
            //         Card(
            //           child: ListTile(
            //               leading: const Icon(Ionicons.cash_outline, size: 20),
            //               title: Text("Всего в копилках:\n0Р")),
            //         ),
            //         Card(
            //           child: ListTile(
            //               leading: const Icon(Ionicons.cash_outline, size: 20),
            //               title: Text("Всего в копилках:\n0Р")),
            //         )
            //       ],
            //     ),
            //   ),
            // )
            ValueListenableBuilder<Box<MoneyBox>>(
                valueListenable: Hive.box<MoneyBox>('money_box').listenable(),
                builder: (context, box, _) {
                  final boxes = box.values.toList().cast<MoneyBox>();
                  if (boxes.isEmpty) {
                    return Center(
                      child: Text("Nothing there"),
                    );
                  }
                  return Expanded(
                    //height: 60.0.h,
                    child: ListView.builder(
                        padding: EdgeInsets.all(8),
                        itemCount: boxes.length,
                        itemBuilder: (BuildContext context, int index) {
                          final box = boxes[index];
                          return buildMoneyBox(box, context);
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget buildMoneyBox(MoneyBox data, BuildContext context) {
    final start_date = data.startDate;
    final end_date = data.endDate;
    final cost = '\₽' + data.cost.toStringAsFixed(2);
    final name = data.name;
    final cost_now = data.costNow;
    return Card(
        child: ListTile(
      onTap: () {
        // Navigator.of(context).pushNamed('/editMoneyBox');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => editMoneyBox(
                      moneyBox: data,
                    )));
      },
      title: Text(name, style: GoogleFonts.lato(fontSize: 24)),
      subtitle: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text("Собрано: " + cost_now.toStringAsFixed(2),
                    style: GoogleFonts.lato(fontSize: 16)),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text("Цель: " + cost.toString()),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: data.costNow / data.cost,
            backgroundColor: Colors.grey,
            color: Colors.purple,
            minHeight: 10,
            semanticsLabel: "wehjgfui",
            semanticsValue: "gilerjihgiouher",
          )
        ],
      ),
    ));
  }
}
