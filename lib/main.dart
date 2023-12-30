import 'package:flutter/material.dart';
import 'package:flutter_application_try/pages/intro_page.dart';
import 'package:flutter_application_try/pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        './intro': (context) => const IntroPage(),
        '/menu': (context) => const MenuPage(),
      },
    );
  }
}
