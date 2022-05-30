import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vk/main_screen/data.dart';
import '../generated/l10n.dart';
import '../main.dart';
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
        title: Text(S.of(context).Piggy_banks),
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
                        return Text(S.of(context).Total_in_piggy +
                            "\n" +
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
                      child: Text(S.of(context).Nothing_there),
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
                child: Text(
                    S.of(context).Collected + cost_now.toStringAsFixed(2),
                    style: GoogleFonts.lato(fontSize: 16)),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(S.of(context).Goal + cost.toString()),
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
