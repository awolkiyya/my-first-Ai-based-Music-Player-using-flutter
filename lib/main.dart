import 'package:flutter/material.dart';
import 'package:my_startup/screen/homePage.dart';

void main() {
  runApp(MyAppOne());
}

class MyAppOne extends StatelessWidget {
  const MyAppOne({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
