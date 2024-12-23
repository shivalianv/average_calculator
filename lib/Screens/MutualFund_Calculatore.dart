import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';
import 'package:stock_average_calculator/Utils/custom_textformfield.dart';
import 'dart:math';

class MutualFundReturn extends StatefulWidget {
  const MutualFundReturn({super.key});

  @override
  State<MutualFundReturn> createState() => _MutualFundReturnState();
}

class _MutualFundReturnState extends State<MutualFundReturn> {
  int totalvalue = 0;
  double percentage1 = 500.0;
  double minimumvalue1 = 500.0;
  double maximumvalue1 = 10000000.0;
  double Investments = 0.0;
  int round_inve = 0;
  int round_profit = 0;

  final TextEditingController Investment_Controller = TextEditingController();

//Expacted_rat
  double percentage2 = 0.01;
  double minimumvalue2 = 0.01;
  double maximumvalue2 = 0.50;
  // double ExpectedRat = 0.0;
  double total_EST_return = 0.0;
  int round_estr = 0;

  final TextEditingController Expactedrat_Controller = TextEditingController();
  //Time_period
  double percentage3 = 1.0;
  double minimumvalue3 = 1.0;
  double maximumvalue3 = 40.0;
  // double TimePeriod = 0.0;
  int round_val = 0;
  final TextEditingController Timeperiod_Controller = TextEditingController();

  @override
  void initState() {
    Investment_Controller.addListener(Calculate_EST_Returns);
    Expactedrat_Controller.addListener(Calculate_EST_Returns);
    Timeperiod_Controller.addListener(Calculate_EST_Returns);

    Investment_Controller.text = formatnumber1(percentage1);
    Expactedrat_Controller.text = formatnumber2(percentage2);
    Timeperiod_Controller.text = formatnumber3(percentage3);

    Calculate_EST_Returns();
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

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  List<Map<String, dynamic>>? data;
  List<Map<String, dynamic>>? data2;

  void Calculate_EST_Returns() {
    String invs_co = Investment_Controller.text;
    String excrat_co = Expactedrat_Controller.text;
    String tim_co = Timeperiod_Controller.text;

    double parseToDouble(String input) {
      String cleanedInput = input.replaceAll(RegExp(r'[^0-9.]'), '');

      return double.tryParse(cleanedInput) ?? 0.0;
    }

    double Investments = parseToDouble(invs_co);
    double ExpectedRat = parseToDouble(excrat_co);
    double TimePeriod = parseToDouble(tim_co);

    double calExpectedRat(
        double Investments, double ExpectedRat, double TimePeriod) {
      return Investments * pow(1 + (ExpectedRat / 100), TimePeriod);
    }

    total_EST_return =
        calExpectedRat(Investments, ExpectedRat, TimePeriod) - Investments;

    double totalValue = Investments + total_EST_return;

    round_inve = Investments.toInt();
    round_estr = total_EST_return.toInt();
    round_val = totalValue.toInt();

    double total_profit = totalValue - Investments;
    round_profit = total_profit.toInt();

    data = [
      {
        'category': 'Investment',
        'value': (Investments / totalValue) * 100,
        'color': AppColors.primaryColor2,
      },
      {
        'category': 'Expected Return',
        'value': (total_EST_return / totalValue) * 100,
        'color': AppColors.GreenColor,
      },
    ];

    data2 = [
      {
        'category': '1 Yr',
        'value': (1 / TimePeriod) * maximumvalue1,
        'color': AppColors.primaryColor2,
      },
      {
        'category': '3 Yr',
        'value': (3 / TimePeriod) * maximumvalue1,
        'color': AppColors.primaryColor2,
      },
      {
        'category': '5 Yr',
        'value': (5 / TimePeriod) * maximumvalue1,
        'color': AppColors.primaryColor2,
      },
      {
        'category': '10 Yr',
        'value': (10 / TimePeriod) * maximumvalue1,
        'color': AppColors.primaryColor2,
      },
    ];
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    Investment_Controller.dispose();
    Expactedrat_Controller.dispose();
    Timeperiod_Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryBackgroundColor,
        appBar: AppBar(
          title: Text(
            "Mutual Fund Returns",
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.primaryColorDark1,
              )),
          backgroundColor: AppColors.primaryBackgroundColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                                  sections: data!.map((item) {
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
                                  Text("Investment ",),
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColorLight2),
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
                              "Total Investment :",
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
                                focusNode: focusNode1,
                                controller: Investment_Controller,
                                icon: Icons.currency_rupee,
                                errorMessage: 'Total Investment',
                              ),
                            ),
                          ],
                        ),
                        Slider(
                            value: percentage1,
                            min: minimumvalue1,
                            max: maximumvalue1,
                            divisions: 100,
                            label: formatnumber1(percentage1),
                            onChanged: (value) {
                              setState(() {
                                percentage1 = value;
                                Investment_Controller.text =
                                    formatnumber1(percentage1);
                              });
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Expected Returns Rat:",
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
                                controller: Expactedrat_Controller,
                                errorMessage: 'Expected Returns Rat',
                              ),
                            ),
                          ],
                        ),
                        Slider(
                          value: percentage2,
                          min: minimumvalue2,
                          max: maximumvalue2,
                          divisions: 100,
                          label: formatnumber2(percentage2),
                          onChanged: (value) {
                            setState(() {
                              percentage2 = value;
                              Expactedrat_Controller.text =
                                  formatnumber2(percentage2);
                            });
                          },
                        ),
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
                                color: AppColors.primaryBackgroundColor,
                                border: Border.all(
                                    color: AppColors.primaryColorLight3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CustomTextFormField(
                                autofocus: true,
                                keyboardType: TextInputType.number,
                                focusNode: focusNode3,
                                controller: Timeperiod_Controller,
                                errorMessage: 'Time Period',
                              ),
                            ),
                          ],
                        ),
                        Slider(
                            value: percentage3,
                            min: minimumvalue3,
                            max: maximumvalue3,
                            divisions: 100,
                            label: formatnumber3(percentage3),
                            onChanged: (value) {
                              setState(() {
                                percentage3 = value;
                                Timeperiod_Controller.text =
                                    formatnumber3(percentage3);
                              });
                            }),
                      ],
                    ),
                  ),
                ),
                                        SizedBox(height: 10),

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Investment',
                              style: TextStyle(
                                  color: AppColors.primaryColorDark2,
                                  fontSize: 15),
                            ),
                            Text(
                              '$round_inve',
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
                              'Expected Rat: ',
                              style: TextStyle(
                                  color: AppColors.primaryColorDark2,
                                  fontSize: 15),
                            ),
                            Text(
                              '$round_estr',
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
                                  color: AppColors.primaryColorDark2,
                                  fontSize: 15),
                            ),
                            Text(
                              '$round_val',
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
                Container(
                  width: 360,
                  height: 360,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.primaryColorLight3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BarChart(
                      BarChartData(
                          barTouchData: BarTouchData(enabled: false),
                          gridData: FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                          titlesData: FlTitlesData(
                            show: true,
                            topTitles: AxisTitles(
                                sideTitles: SideTitles(
                                    showTitles: false, reservedSize: 21)),
                            rightTitles: AxisTitles(
                                sideTitles: SideTitles(
                                    showTitles: false, reservedSize: 20)),
                            leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                    showTitles: false, reservedSize: 20)),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  List<String> categories = [
                                    '1 Yr',
                                    '3 Yr',
                                    '5 Yr',
                                    '10 Yr'
                                  ];
                                  int index = value.toInt();
                                  if (index >= 0 && index < categories.length) {
                                    return Text(categories[index]);
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ),
                          ),
                          barGroups: data2!.map((item) {
                            int index = data2!.indexOf(item);
                            return BarChartGroupData(x: index, barRods: [
                              BarChartRodData(
                                  toY: item['value'],
                                  color: item['color'],
                                  width: 20,
                                  borderRadius: BorderRadius.zero,
                                  rodStackItems: [
                                    BarChartRodStackItem(
                                      0.0,
                                      Investments,
                                      Color.fromARGB(255, 102, 96, 172),
                                    ),
                                    BarChartRodStackItem(
                                      Investments,
                                      Investments + round_profit,
                                      Color(0xFF6DD194),
                                    ),
                                  ])
                            ]);
                          }).toList()),
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
                              Calculate_EST_Returns();
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
                            Investment_Controller.clear();
                            Expactedrat_Controller.clear();
                            Timeperiod_Controller.clear();
                            setState(() {
                              percentage1 = minimumvalue1;
                              percentage2 = minimumvalue2;
                              percentage3 = minimumvalue3;
                            });
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
