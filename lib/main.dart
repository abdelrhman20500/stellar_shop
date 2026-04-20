import 'package:flutter/material.dart';
import 'package:stellar_shop/Features/Auth/presentation/view/sign_up_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
