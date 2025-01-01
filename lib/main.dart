import 'package:flutter/material.dart';
import 'package:stock_average_calculator/Screens/equityMargin_calculator.dart';
import 'package:stock_average_calculator/Screens/home_screen.dart';
import 'package:stock_average_calculator/Screens/mutualFund_calculatore.dart';
import 'package:stock_average_calculator/Screens/stockAverage_calculator.dart';
import 'package:stock_average_calculator/Screens/systematicInvestmentPlan_calculator.dart';
import 'package:stock_average_calculator/Screens/margin_calculator2.dart';
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
        '/StockAverageCalculator': (context) => StockAverageCalculator(),
        '/MutualFundReturn': (context) => MutualFundReturn(),
        '/SystemeticInvestment': (context) =>SystemeticInvestment(),
        '/EquityMargincalculator': (context) => EquityMargincalculator(),
        '/MarginCalculator': (context) => MarginCalculator(),
      },
    );
  }
}
