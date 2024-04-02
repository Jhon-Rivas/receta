import 'package:flutter/material.dart';
import '../config/theme/app_theme.dart';
import '../screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 2).themeData(),
      home: const HomeScreen(),
    );
  }
}
