import 'package:flutter/material.dart';
import 'package:quotes_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quotes App",
      home: HomeScreen(),
    );
  }
}
