import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const ShopEasyApp());
}

class ShopEasyApp extends StatelessWidget {
  const ShopEasyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'ShopEasy',

      theme: ThemeData(primarySwatch: Colors.blue),

      home: const HomeScreen(),
    );
  }
}
