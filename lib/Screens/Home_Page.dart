import 'package:flutter/material.dart';
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
                  print('next screen-----');
                },
                isLoading: false,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Mutual Fund',
                onPressed: () {},
                isLoading: false,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'SPI',
                onPressed: () {},
                isLoading: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
