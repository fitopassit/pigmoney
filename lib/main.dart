import 'package:flutter/material.dart';
import 'package:vk/auth/authentucation.dart';
import 'package:vk/main_screen/add_widget.dart';
import 'package:vk/main_screen/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.blue)),
      routes: {
        '/': (context) => AuthWidget(),
        '/main_screen': (context) => mainScreenWidget(),
        '/add': (context) => addWidget(),
      },
      initialRoute: '/main_screen',
    );
  }
}
