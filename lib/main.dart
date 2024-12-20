import 'package:flutter/material.dart';

import 'electricity-bill.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  ElectricityBillCalculator()

    );
  }


}
