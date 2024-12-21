import 'package:flutter/material.dart';
import 'package:stock_average_calculator/Screens/Home_Screen.dart';
import 'package:stock_average_calculator/Screens/MutualFund_Calculatore.dart';
import 'package:stock_average_calculator/Screens/StockAverage_Calculator.dart';
import 'package:stock_average_calculator/Screens/SystematicInvestmentPlan_Calculator.dart';
import 'package:stock_average_calculator/Screens/EquityMargin_Calculator.dart';
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
        '/Mutual_Fund_Return': (context) => Mutual_Fund_Return(),
        '/Systemetic_Investment': (context) =>Systemetic_Investment(),
        '/Equity_Margin_calculator': (context) => Equity_Margin_calculator(),
      },
    );
  }
}
