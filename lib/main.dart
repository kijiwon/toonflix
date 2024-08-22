import 'package:flutter/material.dart';
import 'package:toonfilx/widgets/Button.dart';
import 'package:toonfilx/widgets/currency_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0; // counter는 변경된 값으로 덮어 씌워지기 때문에 final을 사용하지 않음

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB), // custom color
        body: Center(),
      ),
    );
  }
}
