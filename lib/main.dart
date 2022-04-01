import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vk/main_screen/add_expence_widget.dart';
import 'package:vk/main_screen/add_income_widget.dart';
import 'package:vk/main_screen/main_screen_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vk/theme/theme.dart';
import 'generated/l10n.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
//import 'package:theme_provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeServise = await ThemeService.instance;
  var initTheme = themeServise.initial;
  runApp(MyApp(theme: initTheme));
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
  const MyApp({
    Key? key,
    required this.theme,
  }) : super(key: key);
  final ThemeData theme;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: theme,
      builder: (_, theme) {
        return MaterialApp(
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
            '/main_screen': (context) => mainScreenWidget(),
            '/addExpense': (context) => addExpenseWidget(),
            '/addIncome': (context) => addIncomeWidget(),
          },
          initialRoute: '/main_screen',
        );
      },
    );
  }
}





// import 'package:hive/hive.dart';

// @HiveType(typeId: 0)
// class Transaction extends HiveObject {
// 	@HiveField(0)
// 	late String name;

// 	@HiveField(1)
// 	late DateTime createdDate;

// 	@HiveField(2)
// 	late bool isExpense = true;

// 	@HiveField(3)
// 	late double amount; 
// }