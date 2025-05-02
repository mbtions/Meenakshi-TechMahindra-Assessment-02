import 'package:flutter/material.dart';
import 'package:calculator_app/widgets/calculator.dart';

void main() {
  runApp(MyCalculatorApp());
}

class MyCalculatorApp extends StatelessWidget {
  const MyCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Calculator'), centerTitle: true),
        body: Calculator(),
      ),
    );
  }
}
