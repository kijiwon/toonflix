import 'package:flutter/material.dart';
import 'package:toonfilx/screens/home_screen.dart';
import 'package:toonfilx/services/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
    );
  }
}
