import 'package:flutter/material.dart';
import 'package:stock_average_calculator/Screens/Home_Page.dart';
import 'package:stock_average_calculator/Screens/Stock_Average_Calculator.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: AppColors.primaryColor,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/Stock_Average_Calculator': (context) => Stock_Average_Calculator(),
      },
    );
  }
}
