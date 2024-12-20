import 'package:flutter/material.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';
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
        title: Text("Home Page"),
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
                  Navigator.of(context).pushNamed('/Stock_Average_Calculator');
                },
                isLoading: false,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Mutual Fund Return',
                onPressed: () {
                  Navigator.of(context).pushNamed('/Mutual_Fund_Return');
                },
                isLoading: false,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'SIP',
                onPressed: () {
                  Navigator.of(context).pushNamed('/Systemetic_Investment');
                },
                isLoading: false,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Equity Margin calculator',
                onPressed: () {
                  Navigator.of(context).pushNamed('/Equity_Margin_calculator');
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
