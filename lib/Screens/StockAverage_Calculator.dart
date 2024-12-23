import 'package:flutter/material.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';
import 'package:stock_average_calculator/Utils/custom_textformfield.dart';


class StockAverageCalculator extends StatefulWidget {
  const StockAverageCalculator({super.key});

  @override
  State<StockAverageCalculator> createState() =>
      _StockAverageCalculatorState();
}

class _StockAverageCalculatorState extends State<StockAverageCalculator> {
  final TextEditingController BuyPriceController1 = TextEditingController();
  final TextEditingController QuantiyController1 = TextEditingController();
  final TextEditingController BuyPriceController2 = TextEditingController();
  final TextEditingController QuantiyController2 = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  double TotalAmount = 0.0;
  int TotalQuantity = 00;
  double roundAveragePrice = 0.0;
  double roundTotalAmount = 0.0;

  @override
  void initState() {
    BuyPriceController1.addListener(calculateAverage);
    QuantiyController1.addListener(calculateAverage);
    BuyPriceController2.addListener(calculateAverage);
    QuantiyController2.addListener(calculateAverage);
    calculateAverage();
    super.initState();
  }

  Future<void> calculateAverage() async {
    double buyPrice1 = double.tryParse(BuyPriceController1.text) ?? 0.0;
    int quantity1 = int.tryParse(QuantiyController1.text) ?? 00;
    double buyPrice2 = double.tryParse(BuyPriceController2.text) ?? 0.0;
    int quantity2 = int.tryParse(QuantiyController2.text) ?? 00;

     TotalAmount = buyPrice1 * quantity1 + buyPrice2 * quantity2;
    TotalQuantity = quantity1 + quantity2;

    if (TotalQuantity > 0) {
      double Average_Price = TotalAmount / TotalQuantity;

      if (Average_Price.isNaN || Average_Price.isInfinite) {
        roundAveragePrice = 0.0;
      } else {
        roundAveragePrice = double.parse(Average_Price.toStringAsFixed(0));
      }
      if (roundTotalAmount.isNaN || roundTotalAmount.isInfinite) {
        roundTotalAmount = 0.0;
      } else {
        roundTotalAmount = double.parse(TotalAmount.toStringAsFixed(0));
      }
    } else {
      roundAveragePrice = 0.0;
      roundTotalAmount = 0.0;
    }
    setState(() {});
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    BuyPriceController1.dispose();
    QuantiyController1.dispose();
    BuyPriceController2.dispose();
    QuantiyController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.primaryColorDark1,
              )),
          title: Text(
            "Stock Average calculator",
            style: TextStyle(
              color: AppColors.primaryColorDark1,
            ),
          ),
          backgroundColor: AppColors.primaryBackgroundColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:AppColors.primaryColorLight3),
                    borderRadius: BorderRadius.circular(10),
                   
                   
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Buy Price:",
                              style: TextStyle(
                                  color: AppColors.primaryColorDark1,
                                  fontSize: 15),
                            ),
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                                                    border: Border.all(color: AppColors.primaryColorLight3),

                                  borderRadius: BorderRadius.circular(10),
                                 ),
                              child: CustomTextFormField(
                                autofocus: true,
                                keyboardType: TextInputType.number,
                                focusNode: focusNode1,
                                controller: BuyPriceController1,
                                icon: Icons.currency_rupee,
                                errorMessage: 'Buy Price',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Quantity:",
                              style: TextStyle(
                                  color: AppColors.primaryColorDark1,
                                  fontSize: 15),
                            ),
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColorLight3),
                                  borderRadius: BorderRadius.circular(10),
                                 ),
                              child: CustomTextFormField(
                                autofocus: true,
                                keyboardType: TextInputType.number,
                                focusNode: focusNode2,
                                controller: QuantiyController1,
                                icon: Icons.currency_rupee,
                                errorMessage: 'Quantity',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primaryColorLight3
                      ),
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Buy Price:",
                              style: TextStyle(
                                  color: AppColors.primaryColorDark1,
                                  fontSize: 15),
                            ),
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                              
                    border: Border.all(color: AppColors.primaryColorLight3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CustomTextFormField(
                                autofocus: true,
                                keyboardType: TextInputType.number,
                                focusNode: focusNode3,
                                controller: BuyPriceController2,
                                icon: Icons.currency_rupee,
                                errorMessage: 'Buy Price',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  color: AppColors.primaryColorDark1,
                                  fontSize: 15),
                            ),
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColorLight3),
                                  borderRadius: BorderRadius.circular(10),
                                  ),
                              child: CustomTextFormField(
                                autofocus: true,
                                keyboardType: TextInputType.number,
                                focusNode: focusNode4,
                                controller: QuantiyController2,
                                icon: Icons.currency_rupee,
                                errorMessage: 'Quantity',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.primaryColorLight3),
                  
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Share:',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.primaryColorDark1,
                              ),
                            ),
                            Text(
                              '${(TotalQuantity ?? 0.0).toStringAsFixed(0)}  ₹',
                              style: TextStyle(
                                  color: AppColors.primaryColorDark, fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Amount:',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.primaryColorDark1,
                              ),
                            ),
                            Text(
                              '${(roundTotalAmount ?? 0.0).toStringAsFixed(0)} ₹',
                              style: TextStyle(
                                  color: AppColors.primaryColorDark, fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Average Price:',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.primaryColorDark1,
                              ),
                            ),
                            Text(
                              '${(roundAveragePrice ?? 0.0).toStringAsFixed(0)} ₹',
                              style: TextStyle(
                                  color: AppColors.primaryColorDark, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColorLight3),
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primaryBackgroundColor),
                        child: TextButton(
                            clipBehavior: Clip.antiAlias,
                            onPressed: () {
                              calculateAverage();
                            },
                            child: Text(
                              "Calculate",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ))),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.10),
                      ),
                      child: CustomButton(
                          isLoading: false,
                          text: 'Cancel',
                          onPressed: () {
                            BuyPriceController1.clear();
                            QuantiyController1.clear();
                            BuyPriceController2.clear();
                            QuantiyController2.clear();
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
