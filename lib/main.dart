import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:vk/main_screen/expense.dart';
import 'package:vk/main_screen/add_income_widget.dart';
import 'package:vk/main_screen/main_screen_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vk/main_screen/onboarding_screen_page.dart';
import 'package:vk/theme/theme.dart';
import 'generated/l10n.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'main_screen/data.dart';
//import 'package:theme_provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DataAdapter());
  await Hive.openBox<Data>('data_expense');
  await Hive.openBox<Data>('data_income');
  Hive.registerAdapter(DataPieAdapter());
  await Hive.openBox<DataPie>('data_expense_pie');
  await Hive.openBox<DataPie>('data_income_pie');
  //Hive.box<DataPie>('data_income_pie').clear();
  //Hive.box<DataPie>('data_expense_pie').clear();
  await Hive.openBox<double>('balance');
  //Hive.box<double>('balance').clear();
  if (Hive.box<double>('balance').get('bal') == null) {
    Hive.box<double>('balance').put('bal', 0.0);
  }
  Balance.balance = Hive.box<double>('balance').get('bal')!;
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  final themeServise = await ThemeService.instance;
  var initTheme = themeServise.initial;
  runApp(MyApp(theme: initTheme, showHome: showHome));
}

class ThemeService {
  ThemeService._();
  static late SharedPreferences prefs;
  static ThemeService? _instance;

  static Future<ThemeService> get instance async {
    if (_instance == null) {
      prefs = await SharedPreferences.getInstance();
      _instance = ThemeService._();
    }
    return _instance!;
  }

  final allThemes = <String, ThemeData>{
    'dark': darkTheme,
    'light': lightTheme,
  };

  String get previousThemeName {
    String? themeName = prefs.getString('previousThemeName');
    if (themeName == null) {
      final isPlatformDark =
          WidgetsBinding.instance!.window.platformBrightness == Brightness.dark;
      themeName = isPlatformDark ? 'light' : 'dark';
    }
    return themeName;
  }

  get initial {
    String? themeName = prefs.getString('theme');
    if (themeName == null) {
      final isPlatformDark =
          WidgetsBinding.instance!.window.platformBrightness == Brightness.dark;
      themeName = isPlatformDark ? 'dark' : 'light';
    }
    return allThemes[themeName];
  }

  save(String newThemeName) {
    var currentThemeName = prefs.getString('theme');
    if (currentThemeName != null) {
      prefs.setString('previousThemeName', currentThemeName);
    }
    prefs.setString('theme', newThemeName);
  }

  ThemeData getByName(String name) {
    return allThemes[name]!;
  }
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this.theme, required this.showHome})
      : super(key: key);
  final ThemeData theme;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: theme,
      builder: (_, theme) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: 'Flutter Demo',
              theme: theme,
              routes: {
                //'/': (context) => AuthWidget(),
                '/onBoardingScreen': (context) => OnbordingPage(),
                '/main_screen': (context) => mainScreenWidget(),
                '/addExpense': (context) => addExpenseWidget(),
                '/addIncome': (context) => addIncomeWidget(),
              },
              initialRoute: showHome ? '/main_screen' : '/onBoardingScreen',
            );
          },
        );
      },
    );
  }
}
