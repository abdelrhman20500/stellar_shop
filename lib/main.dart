import 'package:flutter/material.dart';
import 'package:stellar_shop/Features/Splash/presentation/view/splash_screen.dart';
import 'package:stellar_shop/Features/layout/presentation/view/layout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: LayoutScreen(),
    );
  }
}
