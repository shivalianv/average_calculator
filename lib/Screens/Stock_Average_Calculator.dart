import 'package:flutter/material.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';
import 'package:stock_average_calculator/Utils/custom_textformfield.dart';

class Stock_Average_Calculator extends StatefulWidget {
  const Stock_Average_Calculator({super.key});

  @override
  State<Stock_Average_Calculator> createState() =>
      _Stock_Average_CalculatorState();
}

class _Stock_Average_CalculatorState extends State<Stock_Average_Calculator> {
  final TextEditingController _BuyPriceController1 = TextEditingController();
  final TextEditingController _QuantiyController1 = TextEditingController();
  final TextEditingController _BuyPriceController2 = TextEditingController();
  final TextEditingController _QuantiyController2 = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  FocusNode _focusNode4 = FocusNode();


  double TotalAmount = 0.0;
  int TotalQuantity = 0; //totalshare
  int roundAveragePrice = 0;
  int roundTotalAmount = 0;

  void calculateAverage() {

    double buyPrice1 = double.tryParse(_BuyPriceController1.text) ?? 0.0;
    int quantity1 = int.tryParse(_QuantiyController1.text) ?? 0;
    double buyPrice2 = double.tryParse(_BuyPriceController2.text) ?? 0.0;
    int quantity2 = int.tryParse(_QuantiyController2.text) ?? 0;

    TotalAmount = buyPrice1 * quantity1 + buyPrice2 * quantity2;
    TotalQuantity = quantity1 + quantity2;
    double Average_Price = TotalAmount / TotalQuantity;
    roundAveragePrice = Average_Price.round(); //convert double to int vlaue
    roundTotalAmount = TotalAmount.round(); //convert double to int vlaue

    setState(() {
      
    });
    // print("total share:-----$TotalQuantity");
    // print("total Amount-----------$TotalAmount");
    // print("average price:-----$roundAveragePrice");
    // print("round total Amount price:-----$roundTotalAmount");
  }

  void dispose(){
  _focusNode1.dispose();
  _focusNode2.dispose();
  _focusNode3.dispose();
  _focusNode4.dispose();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stock Average calculator",
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Share 1:"),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.10),
                      border: Border.all(
                          width: 0.2, color: AppColors.primaryColor3)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Buy Price"),
                        CustomTextFormField(
                          focusNode:_focusNode1,
                          hintText: 'Enter Buy Price',
                          labelText: 'Buy Price',
                          controller: _BuyPriceController1,
                          icon: Icons.currency_rupee,
                          errorMessage: 'Buy Price',
                        ),
                        SizedBox(height: 20),
                        Text("Quantity"),
                        CustomTextFormField(
                          focusNode:_focusNode2,
                          hintText: 'Enter Quantity',
                          labelText: 'Quantity',
                          controller: _QuantiyController1,
                          icon: Icons.currency_rupee,
                          errorMessage: 'Quantity',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Share 2:"),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.10),
                      border: Border.all(
                          width: 0.2, color: AppColors.primaryColor3)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Buy Price"),
                        CustomTextFormField(
                          focusNode: _focusNode3,
                          hintText: 'Enter Buy Price',
                          labelText: 'Buy Price',
                          controller: _BuyPriceController2,
                          icon: Icons.currency_rupee,
                          errorMessage: 'Buy Price',
                        ),
                        SizedBox(height: 20),
                        Text("Quantity"),
                        CustomTextFormField(     
                          focusNode: _focusNode4,                     
                          hintText: 'Enter Quantity',
                          labelText: 'Quantity',
                          controller: _QuantiyController2,
                          icon: Icons.currency_rupee,
                          errorMessage: 'Quantity',                          
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButton(
                    isLoading: false,
                    text: 'Calculate Average',
                    onPressed: () {
                      calculateAverage();
                    }),
                Divider(
                  thickness: 1,
                  color: AppColors.primaryColorDark2,
                ),
                if (TotalQuantity > 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Quantity: $TotalQuantity',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Total Amount: ${roundTotalAmount}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Average Price: ${roundAveragePrice}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
             
              ],
            ),
          ),
        ),
      ),
    );
  }
}
