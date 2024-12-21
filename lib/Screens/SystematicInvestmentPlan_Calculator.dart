import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';
import 'package:stock_average_calculator/Utils/custom_textformfield.dart';
import 'dart:math';

class Systemetic_Investment extends StatefulWidget {
  const Systemetic_Investment({super.key});

  @override
  State<Systemetic_Investment> createState() => _Systemetic_InvestmentState();
}

class _Systemetic_InvestmentState extends State<Systemetic_Investment> {
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();

//chart list
  List<Map<String, dynamic>>? spidata; //pie chart
  List<Map<String, dynamic>>? spidata2; //bar chart

  @override
  void initState() {
    _MonthlyInvestment_Controller.addListener(Calculate_sip);
    Expactedreturnrate_Controller.addListener(Calculate_sip);
    _sipTimeperiod_Controller.addListener(Calculate_sip);

    _MonthlyInvestment_Controller.text = formatnumber1(sippercentage1);
    Expactedreturnrate_Controller.text = formatnumber2(sippercentage2);
    _sipTimeperiod_Controller.text = formatnumber3(_sippercentage3);
    Calculate_sip();

    super.initState();
  }

  String formatnumber1(double value) {
    return value == value.toInt()
        ? value.toInt().toString()
        : value.toStringAsFixed(0);
  }

  String formatnumber2(double value) {
    return value == value.toInt()
        ? value.toInt().toString()
        : (value * 100).toStringAsFixed(0) + '%';
  }

  String formatnumber3(double value) {
    return value == value.toInt()
        ? value.toInt().toString()
        : value.toStringAsFixed(0) + 'Yr';
  }

  //////////////sip calculator////////////////
  final TextEditingController _MonthlyInvestment_Controller =
      TextEditingController();
  final TextEditingController Expactedreturnrate_Controller =
      TextEditingController();
  final TextEditingController _sipTimeperiod_Controller =
      TextEditingController();

  int siptotalvalue = 0;
  //total investment
  double sippercentage1 = 100.0;
  double minivalue1 = 100.0;
  double maxvalue1 = 1000000.0;
  double monthInvestments = 0.0;
  int round_sipinve = 0;

//Expacted_rat
  double sippercentage2 = 0.01;
  double minivalue2 = 0.01;
  double maxvalue2 = 0.30;
  double total_sipEST_return = 0.0;
  int round_sipestr = 0;

  double _sippercentage3 = 1.0;
  double minivalue3 = 1.0;
  double maxvalue3 = 40.0;
  int round_sipval = 0;

  void Calculate_sip() {
    String invs_sip = _MonthlyInvestment_Controller.text;
    String excrat_sip = Expactedreturnrate_Controller.text;
    String tim_sip = _sipTimeperiod_Controller.text;

    double parseToDouble(String input1) {
      String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
      return double.tryParse(cleanedInput1) ?? 0.0;
    }

    double monthInvestments = parseToDouble(invs_sip);
    double ExpectedreturnRat = parseToDouble(excrat_sip);
    double sipTimePeriod = parseToDouble(tim_sip);

    double cal_totalsip(double monthInvestments, double ExpectedreturnRat,
        double sipTimePeriod) {
      double monthlyrate = ExpectedreturnRat / 12 / 100;
      int totalMonths = (sipTimePeriod * 12).toInt();

      if (monthInvestments <= 0 ||
          ExpectedreturnRat <= 0 ||
          sipTimePeriod <= 0) {
        return 0.0;
      }
      return monthInvestments *
          ((pow(1 + monthlyrate, totalMonths) - 1) / monthlyrate) *
          (1 + monthlyrate);
    }

    double total_sipEST_return =
        cal_totalsip(monthInvestments, ExpectedreturnRat, sipTimePeriod);

    double totalinvestment = monthInvestments * sipTimePeriod * 12;

    double totalETCrat = total_sipEST_return - totalinvestment;

    round_sipinve = totalinvestment.toInt();
    round_sipestr = totalETCrat.toInt();
    round_sipval = total_sipEST_return.toInt();

//Pie Chart
    spidata = [
      {
        'category': 'Investment',
        'value': (monthInvestments / total_sipEST_return) * 100,
        'color': AppColors.primaryColor2,
      },
      {
        'category': 'Expected Return',
        'value': (totalETCrat / total_sipEST_return) * 100,
        'color': AppColors.GreenColor,
      },
    ];
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    _focusNode3.dispose();

    _MonthlyInvestment_Controller.dispose();
    Expactedreturnrate_Controller.dispose();
    _sipTimeperiod_Controller.dispose();

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
        title: Text("SIP"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
                Container(
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColorLight3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              child: PieChart(
                                PieChartData(
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 40,
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sections: spidata!.map((item) {
                                      return PieChartSectionData(
                                          radius: 30,
                                          value: item['value'],
                                          color: item['color'],
                                          showTitle: false,
                                          titleStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ));
                                    }).toList()),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                   mainAxisAlignment: MainAxisAlignment.start, // Align items horizontally
                crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor2,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        width: 10,
                                      ),
                                    ),
                                    Text("Investment: ",style: TextStyle(
                                      color: AppColors.primaryColorDark2,
                                      fontSize: 14),),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 35),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 10,
                                           decoration: BoxDecoration(
                                          color: AppColors.GreenColor,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          width: 10,
                                        ),
                                      ),
                                      Text("Profit ",style: TextStyle(
                                      color: AppColors.primaryColorDark2,
                                      fontSize: 14),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                               SizedBox(height: 10),

             
              Container(
                height: 320,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColorLight3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Monthly Investment:",
                            style: TextStyle(
                                color: AppColors.primaryColorDark2,
                                fontSize: 15),
                          ),
                          Container(
                            width: 150,
                           decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.primaryColorLight3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                            child: CustomTextFormField(
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              icon: Icons.currency_rupee,
                              focusNode: focusNode1,
                              controller: _MonthlyInvestment_Controller,
                              errorMessage: 'Monthly Investment',
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          value: sippercentage1,
                          min: minivalue1,
                          max: maxvalue1,
                          divisions: 100,
                          label: formatnumber1(sippercentage1),
                          onChanged: (value) {
                            setState(() {
                              sippercentage1 = value;
                              _MonthlyInvestment_Controller.text =
                                  formatnumber1(sippercentage1);
                            });
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Expected Returns Rate:",
                            style: TextStyle(
                                color: AppColors.primaryColorDark2,
                                fontSize: 15),
                          ),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.primaryColorLight3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                            child: CustomTextFormField(
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              focusNode: focusNode2,
                              controller: Expactedreturnrate_Controller,
                              errorMessage: 'Expected Returns Rate',
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          value: sippercentage2,
                          min: minivalue2,
                          max: maxvalue2,
                          divisions: 100,
                          label: formatnumber2(sippercentage2),
                          onChanged: (value) {
                            setState(() {
                              sippercentage2 = value;
                              Expactedreturnrate_Controller.text =
                                  formatnumber2(sippercentage2);
                            });
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Time Period :",
                            style: TextStyle(
                                color: AppColors.primaryColorDark2,
                                fontSize: 15),
                          ),
                          Container(
                            width: 150,
                           decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.primaryColorLight3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                            child: CustomTextFormField(
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              focusNode: _focusNode3,
                              controller: _sipTimeperiod_Controller,
                              errorMessage: 'Time Period',
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          value: _sippercentage3,
                          min: minivalue3,
                          max: maxvalue3,
                          divisions: 100,
                          label: formatnumber3(_sippercentage3),
                          onChanged: (value) {
                            setState(() {
                              _sippercentage3 = value;
                              _sipTimeperiod_Controller.text =
                                  formatnumber3(_sippercentage3);
                            });
                          }),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColorLight3),
                  borderRadius: BorderRadius.circular(10),
                  
                 
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Investment Amount',
                            style: TextStyle(
                                color: AppColors.primaryColorDark2, fontSize: 15),
                          ),
                          Text(
                            '$round_sipinve',
                             style: TextStyle(
                                    color: AppColors.primaryColorDark, fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Expected Rate: ',
                            style: TextStyle(
                                color: AppColors.primaryColorDark2, fontSize: 15),
                          ),
                          Text(
                            '$round_sipestr',
                             style: TextStyle(
                                    color: AppColors.primaryColorDark, fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Value: ',
                            style: TextStyle(
                                color: AppColors.primaryColorDark2, fontSize: 15),
                          ),
                          Text(
                            '$round_sipval',
                              style: TextStyle(
                                    color: AppColors.primaryColorDark, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                            Calculate_sip();
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
                    child: CustomButton(
                        isLoading: false,
                        text: 'Cancel',
                        onPressed: () {
                          _MonthlyInvestment_Controller.clear();
                          Expactedreturnrate_Controller.clear();
                          _sipTimeperiod_Controller.clear();
                          setState(() {
                            sippercentage1 = minivalue1;
                            sippercentage2 = minivalue2;
                            _sippercentage3 = minivalue3;
                          });
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
