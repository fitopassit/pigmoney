import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:vk/auth/authentucation.dart';
import 'package:vk/main_screen/add_widget.dart';
import 'package:vk/main_screen/main_screen_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vk/theme/theme.dart';
import 'generated/l10n.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
        defaultThemeId: 'default_light_theme',
        themes: [
          AppTheme.light(),
          AppTheme.dark(),
        ],
        saveThemesOnChange: true,
        loadThemeOnInit: false,
        onInitCallback: (controller, previouslySavedThemeFuture) async {
          String? savedTheme = await previouslySavedThemeFuture;

          if (savedTheme != null) {
            // If previous theme saved, use saved theme
            controller.setTheme(savedTheme);
          } else {
            // If previous theme not found, use platform default
            Brightness platformBrightness =
                SchedulerBinding.instance!.window.platformBrightness;
            if (platformBrightness == Brightness.dark) {
              controller.setTheme('default_dark_theme');
            } else {
              controller.setTheme('light');
            }
            // Forget the saved theme(which were saved just now by previous lines)
            controller.forgetSavedTheme();
          }
        },
        child: ThemeConsumer(
            child: Builder(
                builder: (themeContext) => MaterialApp(
                      theme: ThemeProvider.themeOf(themeContext).data,
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
                    ))));
  }
}
