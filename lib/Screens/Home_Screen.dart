import 'package:flutter/material.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';
import 'package:stock_average_calculator/Utils/common_text.dart';
import 'package:stock_average_calculator/Utils/custom_textformfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        title: CommonText(
          text: 'Home Page',
          fontSize: 22,
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: 'Stock Average calculator',
                onPressed: () {
                  Navigator.of(context).pushNamed('/StockAverageCalculator');
                },
                isLoading: false,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Mutual Fund Return',
                onPressed: () {
                  Navigator.of(context).pushNamed('/MutualFundReturn');
                },
                isLoading: false,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'SIP',
                onPressed: () {
                  Navigator.of(context).pushNamed('/SystemeticInvestment');
                },
                isLoading: false,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Equity Margin Calculators',
                onPressed: () {
                  Navigator.of(context).pushNamed('/EquityMargincalculator');
                },
                isLoading: false,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Equity Margin Calculator2',
                onPressed: () {
                  Navigator.of(context).pushNamed('/MarginCalculator');
                },
                isLoading: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
