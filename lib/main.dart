import 'package:bitcoin_ticker_tutorial/screens/price_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blue, scaffoldBackgroundColor: Colors.white),
      home: PriceScreen(),
    );
  }
}
