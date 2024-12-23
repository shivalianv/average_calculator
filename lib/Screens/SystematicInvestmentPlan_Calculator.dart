import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';
import 'package:stock_average_calculator/Utils/custom_textformfield.dart';
import 'dart:math';

class SystemeticInvestment extends StatefulWidget {
  const SystemeticInvestment({super.key});

  @override
  State<SystemeticInvestment> createState() => _SystemeticInvestmentState();
}

class _SystemeticInvestmentState extends State<SystemeticInvestment> {
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();

//chart list
  List<Map<String, dynamic>>? spidata; //pie chart
  List<Map<String, dynamic>>? spidata2; //bar chart

  @override
  void initState() {
    MonthlyInvestmentController.addListener(CalculateSip);
    ExpactedreturnrateController.addListener(CalculateSip);
    SipTimeperiodController.addListener(CalculateSip);

    MonthlyInvestmentController.text = formatnumber1(sippercentage1);
    ExpactedreturnrateController.text = formatnumber2(sippercentage2);
    SipTimeperiodController.text = formatnumber3(sippercentage3);
    CalculateSip();

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
  final TextEditingController MonthlyInvestmentController =
      TextEditingController();
  final TextEditingController ExpactedreturnrateController =
      TextEditingController();
  final TextEditingController SipTimeperiodController = TextEditingController();

  int siptotalvalue = 0;
  //total investment
  double sippercentage1 = 100.0;
  double minivalue1 = 100.0;
  double maxvalue1 = 1000000.0;
  double monthInvestments = 0.0;
  int roundSipinve = 0;

//Expacted_rat
  double sippercentage2 = 0.01;
  double minivalue2 = 0.01;
  double maxvalue2 = 0.30;
  double TotalSipESTReturn = 0.0;
  int roundSipestr = 0;

  double sippercentage3 = 1.0;
  double minivalue3 = 1.0;
  double maxvalue3 = 40.0;
  int roundSipValue = 0;

  void CalculateSip() {
    String InvestmentSip = MonthlyInvestmentController.text;
    String ExpectedReturnsSip = ExpactedreturnrateController.text;
    String TimePeriodSip = SipTimeperiodController.text;

    double parseToDouble(String input1) {
      String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
      return double.tryParse(cleanedInput1) ?? 0.0;
    }

    double monthInvestments = parseToDouble(InvestmentSip);
    double ExpectedreturnRat = parseToDouble(ExpectedReturnsSip);
    double sipTimePeriod = parseToDouble(TimePeriodSip);

    double CalculateTotalsip(double monthInvestments, double ExpectedreturnRat,
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

    double TotalSipESTReturn =
        CalculateTotalsip(monthInvestments, ExpectedreturnRat, sipTimePeriod);

    double totalinvestment = monthInvestments * sipTimePeriod * 12;

    double totalETCrat = TotalSipESTReturn - totalinvestment;

    roundSipinve = totalinvestment.toInt();
    roundSipestr = totalETCrat.toInt();
    roundSipValue = TotalSipESTReturn.toInt();

//Pie Chart
    spidata = [
      {
        'category': 'Investment',
        'value': (monthInvestments / TotalSipESTReturn) * 100,
        'color': AppColors.primaryColor2,
      },
      {
        'category': 'Expected Return',
        'value': (totalETCrat / TotalSipESTReturn) * 100,
        'color': AppColors.GreenColor,
      },
    ];
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();

    MonthlyInvestmentController.dispose();
    ExpactedreturnrateController.dispose();
    SipTimeperiodController.dispose();

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
                              mainAxisAlignment: MainAxisAlignment
                                  .start, // Align items horizontally
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
                                Text(
                                  "Investment: ",
                                  style: TextStyle(
                                      color: AppColors.primaryColorDark2,
                                      fontSize: 14),
                                ),
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
                                  Text(
                                    "Profit ",
                                    style: TextStyle(
                                        color: AppColors.primaryColorDark2,
                                        fontSize: 14),
                                  ),
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
                              controller: MonthlyInvestmentController,
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
                              MonthlyInvestmentController.text =
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
                              controller: ExpactedreturnrateController,
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
                              ExpactedreturnrateController.text =
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
                              focusNode: focusNode3,
                              controller: SipTimeperiodController,
                              errorMessage: 'Time Period',
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          value: sippercentage3,
                          min: minivalue3,
                          max: maxvalue3,
                          divisions: 100,
                          label: formatnumber3(sippercentage3),
                          onChanged: (value) {
                            setState(() {
                              sippercentage3 = value;
                              SipTimeperiodController.text =
                                  formatnumber3(sippercentage3);
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
                                color: AppColors.primaryColorDark2,
                                fontSize: 15),
                          ),
                          Text(
                            '$roundSipinve',
                            style: TextStyle(
                                color: AppColors.primaryColorDark,
                                fontSize: 15),
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
                                color: AppColors.primaryColorDark2,
                                fontSize: 15),
                          ),
                          Text(
                            '$roundSipestr',
                            style: TextStyle(
                                color: AppColors.primaryColorDark,
                                fontSize: 15),
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
                            '$roundSipValue',
                            style: TextStyle(
                                color: AppColors.primaryColorDark,
                                fontSize: 15),
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
                          border:
                              Border.all(color: AppColors.primaryColorLight3),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryBackgroundColor),
                      child: TextButton(
                          clipBehavior: Clip.antiAlias,
                          onPressed: () {
                            CalculateSip();
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
                          MonthlyInvestmentController.clear();
                          ExpactedreturnrateController.clear();
                          SipTimeperiodController.clear();
                          setState(() {
                            sippercentage1 = minivalue1;
                            sippercentage2 = minivalue2;
                            sippercentage3 = minivalue3;
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
