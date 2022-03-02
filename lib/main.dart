import 'package:flutter/material.dart';
import 'package:vk/auth/authentucation.dart';
import 'package:vk/main_screen/add_widget.dart';
import 'package:vk/main_screen/main_screen_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vk/theme/theme.dart';
import 'generated/l10n.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: LightTheme,
      dark: DarkTheme,
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) => MaterialApp(
        theme: light,
        darkTheme: dark,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Flutter Demo',
        routes: {
          //'/': (context) => AuthWidget(),
          '/main_screen': (context) => mainScreenWidget(),
          '/add': (context) => addWidget(),
        },
        initialRoute: '/main_screen',
      ),
    );
  }
}
