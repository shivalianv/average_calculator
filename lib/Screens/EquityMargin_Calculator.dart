import 'package:flutter/material.dart';
import 'package:stock_average_calculator/Screens/EquityMargin_Model.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';
import 'package:stock_average_calculator/Utils/custom_textformfield.dart';
import 'package:textfield_search/textfield_search.dart';

class EquityMargincalculator extends StatefulWidget {
  const EquityMargincalculator({super.key});

  @override
  State<EquityMargincalculator> createState() => _EquityMargincalculatorState();
}

class _EquityMargincalculatorState extends State<EquityMargincalculator> {
  TextEditingController SearchController = TextEditingController();
  // final TextEditingController OrderPriceController = TextEditingController();
  // final TextEditingController ShareValueController = TextEditingController();

  List<TextEditingController> OrderPriceController = <TextEditingController>[];
  List<TextEditingController> ShareValueController = <TextEditingController>[];
  List<String> FilteredCompaniesList = <String>[];

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();

  @override
  void initState() {
    RemoveCompany;
    FilteredCompaniesList = companies;
    OrderPriceController = List.generate(5, (index) => TextEditingController());
    ShareValueController = List.generate(5, (index) => TextEditingController());
    OrderPriceController.forEach((controller) {
      controller.addListener(SelectedCompany1);
    });
    ShareValueController.forEach((controller) {
      controller.addListener(SelectedCompany1);
    });
    // ShareValueController.addListener(SelectedCompany1);
    // OrderPriceController.addListener(SelectedCompany1);
    SearchController.addListener(SelectedCompany1);
    CalculateOrder();
    Add_company();
    SelectedCompany1();

    super.initState();
  }

  Map<String, double> CompanyBSEvalue = <String, double>{
    "Swiggy Ltd.": 594.80,
    "Enviro infra Engineers Ltd.": 380.50,
    "Tata Motors Ltd": 784.70
  };
  Map<String, double> CompanyNSEvalue = <String, double>{
    "Swiggy Ltd.": 596.35,
    "Enviro infra Engineers Ltd.": 269.62,
    "Tata Motors Ltd": 784.80
  };

  List<String> companies = <String>[
    "Swiggy Ltd.",
    "Enviro infra Engineers Ltd.",
    "Tata Motors Ltd"
  ];

  List<Add_newCompany> AddmultipleMompanylist = <Add_newCompany>[];
  String SelectedCompany = '';
  String SelectedBuysellList = '';

  String? SelectedBuysellvalue = 'BUY';
  String? SelectedExchangevalue = 'NSE';

  List<String> BuysellList = <String>['BUY', 'SELL']; //Option
  List<String> ExchangeList = <String>['NSE', 'BSE']; //Option2

  double MarginDelivery = 0.0;
  double MarginIntraday = 0.0;

  Future<void> SelectedCompany1() async {
    //
    double companyvalue = 0.0;
    String selectedCompany = SearchController.text.trim();

    if (SelectedExchangevalue == 'NSE') {
      if (CompanyNSEvalue.containsKey(selectedCompany)) {
        companyvalue = CompanyNSEvalue[selectedCompany]!;
        print(CompanyNSEvalue);
      } else {
        print("Company not found: $selectedCompany");
      }
    } else {
      if (CompanyBSEvalue.containsKey(selectedCompany)) {
        companyvalue = CompanyBSEvalue[selectedCompany]!;
        print(CompanyBSEvalue);
      } else {
        print("Company not found: $selectedCompany");
      }
    }
    if (companyvalue != 0.0) {
      OrderPriceController = [];
      //  OrderPriceController.text = companyvalue.toStringAsFixed(2);
      print(OrderPriceController);
    } else {
      OrderPriceController = [];
      // OrderPriceController.text = '';
      print(OrderPriceController);
    }
    setState(() {});
  }

  Future<void> CalculateOrder() async {
    List<TextEditingController> Ordervalue = OrderPriceController;
    List<TextEditingController> Sharevalue = ShareValueController;

    // String Ordervalue = OrderPriceController.text;
    // String Sharevalue = ShareValueController.text;

    double parseToDouble(String input1) {
      String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
      return double.tryParse(cleanedInput1) ?? 0.0;
    }

    // double OrderPrice = parseToDouble(Ordervalue);
    // double Sharevaluealue = parseToDouble(Sharevalue);
    double OrderPrice = parseToDouble(Ordervalue.toString());
    double Sharevaluealue = parseToDouble(Sharevalue.toString());

    double RoundDelivery = OrderPrice * Sharevaluealue;
    MarginDelivery = double.parse(RoundDelivery.toStringAsFixed(3));

    double roundIntraday = OrderPrice * Sharevaluealue * (20 / 100);

    MarginIntraday = double.parse(roundIntraday.toStringAsFixed(2));

    if (SelectedBuysellvalue == 'BUY') {
      SelectedBuysellList = MarginDelivery.toStringAsFixed(2);
    } else {
      SelectedBuysellList = '';
      MarginDelivery = 0.0;
    }

    setState(() {});
  }

  Future<void> Add_company() async {
    final TextEditingController OrderPriceController = TextEditingController();
    final TextEditingController ShareValueController = TextEditingController();


  //   OrderPriceController.add(OrderPriceController);
  // ShareValueController.add(ShareValueController);

    AddmultipleMompanylist.add(Add_newCompany(
      textfiledserch: TextFieldSearch(
        decoration: InputDecoration(border: InputBorder.none),
        initialList: FilteredCompaniesList,
        controller: TextEditingController(),
        // controller:SearchController ,
        label: 'Search Company',
        textStyle: TextStyle(color: AppColors.primaryColorDark1, fontSize: 14),
      ),
      value1: SelectedBuysellvalue,
      // items1: BuysellList,
      items1: BuysellList.toSet().toList(),
      value2: SelectedExchangevalue,
      // items2: ExchangeList,
      items2: ExchangeList.toSet().toList(),
      onchanged1: (newvalue) {
        print('Print onchange1.............');
        setState(() {
          SelectedBuysellvalue = newvalue!;
          CalculateOrder();
        });
      },
      onchanged2: (newvalue) {
        print('Print onchange2.............');

        setState(() {
          SelectedBuysellvalue = newvalue!;
          CalculateOrder();
        });
      },
      customtextfield1: CustomTextFormField(
        autofocus: true,
        keyboardType: TextInputType.number,
        focusNode: focusNode1,
        controller: OrderPriceController,
        icon: Icons.currency_rupee,
        errorMessage: 'Order Price',
        onchange: (value) {
          print("orderprice..........$OrderPriceController");

          setState(() {
            OrderPriceController != value;
            CalculateOrder();
          });
        },
      ),
      customtextfield2: CustomTextFormField(
        autofocus: true,
        keyboardType: TextInputType.number,
        focusNode: focusNode2,
        controller: ShareValueController,
        errorMessage: 'Invalid value Share',
        onchange: (value) {
          print("sharevalue..........$ShareValueController");
          setState(() {
            ShareValueController!=value;
            CalculateOrder();
          });
        },
      ),
      TextMarginDelivery:
          SelectedBuysellvalue == "SELL" ? '0.0' : SelectedBuysellList,
      TextmarginIntraday: "$MarginIntraday",
      // AddOntap: () {},
      DeleteOntap: () {
        if (mounted) {
          RemoveCompany;
        }
        setState(() {});
      },
    ));
    setState(() {});
  }

  void RemoveCompany(int index) {
   

    if (AddmultipleMompanylist.length > 1) {
      AddmultipleMompanylist.removeAt(index);
    }
    
  }

  @override
  void dispose() {
    // for (var controller in ShareValueController) {
    //   controller.dispose();
    // }
    // for (var controller in OrderPriceController) {
    //   controller.dispose();
    // }
    // SearchController.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    // OrderPriceController.dispose();
    // ShareValueController.dispose();
    OrderPriceController.forEach((controller) {
      controller.dispose();
    });
    ShareValueController.forEach((controller) {
      controller.dispose();
    });
   

    // SearchController.dispose();
    SearchController.removeListener(SelectedCompany1);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Equity Margin Calculator",
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
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView.builder(
                itemCount: AddmultipleMompanylist.length,
                itemBuilder: (BuildContext context, int index) {
                  final Add_newCompany newcompanyadd =
                      AddmultipleMompanylist[index];
                  final List<String> defitem1 =
                      newcompanyadd.items1.toSet().toList();
                  final List<String> defitem2 =
                      newcompanyadd.items2.toSet().toList();
                  final value1 = defitem1.contains(
                          newcompanyadd.value1) //selected_buysellvlaue
                      ? newcompanyadd.value1
                      : defitem1.isNotEmpty
                          ? defitem1[0]
                          : null;
                  final value2 = defitem2.contains(
                          newcompanyadd.value1) //SelectedExchangevalue
                      ? newcompanyadd.value1
                      : defitem2.isNotEmpty
                          ? defitem2[0]
                          : null;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Add_newCompany(
                      textfiledserch: newcompanyadd.textfiledserch,
                      items1: newcompanyadd.items1,
                      items2: newcompanyadd.items2,
                      value1: newcompanyadd.value1,
                      value2: newcompanyadd.value2,
                      onchanged1: (newvalue) {
                        setState(() {
                          print("value onchange1,,,,,,,,,,,,,,");

                          newcompanyadd.value1 = newvalue!;
                          newcompanyadd.onchanged1!(newvalue);
                        });
                        CalculateOrder();
                      },
                      onchanged2: (newvalue) {
                        print("value onchange2,,,,,,,,,,,,,,");
                        setState(() {
                          newcompanyadd.value2 = newvalue!;
                          newcompanyadd.onchanged2!(newvalue);
                        });
                        CalculateOrder();
                        SelectedCompany1();
                      },
                      customtextfield1: CustomTextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        focusNode: focusNode1,
                        controller: OrderPriceController[index],
                        icon: Icons.currency_rupee,
                        errorMessage: 'Order Price',
                        onchange: (value) {
                          print("orderprice..........$OrderPriceController");

                          setState(() {
                            CalculateOrder();
                          });
                        },
                      ),
                      customtextfield2: CustomTextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        focusNode: focusNode2,
                        controller: ShareValueController[index],
                        errorMessage: 'Invalid value Share',
                        onchange: (value) {
                          print("sharevalue..........$ShareValueController");
                          setState(() {
                            CalculateOrder();
                          });
                        },
                      ),
                      // customtextfield1: newcompanyadd.customtextfield1,
                      // customtextfield2: newcompanyadd.customtextfield2,
                      TextmarginIntraday: newcompanyadd.TextmarginIntraday,
                      TextMarginDelivery: newcompanyadd.TextMarginDelivery,
                      // customtextfield1: newcompanyadd.customtextfield1,
                      // customtextfield2: newcompanyadd.customtextfield2,
                      
                      // AddOntap: () {},
                      DeleteOntap: () {
                        if (mounted) {
                          setState(() {
                            RemoveCompany(index);
                          });
                          // RemoveCompany(AddmultipleMompanylist.indexOf(newcompanyadd));
                        }
                      },
                    ),
                  );
                }),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                            isLoading: false,
                            text: 'Add Company',
                            onPressed: () {
                              setState(() {
                                Add_company();
                              });
                            }),
                      ),
                    ),
                    Container(
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                            isLoading: false,
                            text: 'Remove ',
                            onPressed: () {
                              setState(() {
                                print("pressed remove");
                                if (mounted) {
                                  RemoveCompany;
                                }
                              });
                            }),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     border: Border.all(color: AppColors.primaryColorLight3),
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(10.0),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           "Total",
                //           style: TextStyle(
                //               color: AppColors.primaryColorDark2, fontSize: 15),
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: [
                //             Text(
                //               "Margin For Delivery:",
                //               style: TextStyle(
                //                   color: AppColors.primaryColorDark2,
                //                   fontSize: 15),
                //             ),
                //             Container(
                //               width: 130,
                //               height: 50,
                //               decoration: BoxDecoration(
                //                 border: Border.all(
                //                     color: AppColors.primaryColorLight2),
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Center(child: Text("$MarginDelivery")),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: [
                //             Text(
                //               "Margin For Intraday:",
                //               style: TextStyle(
                //                   color: AppColors.primaryColorDark2,
                //                   fontSize: 15),
                //             ),
                //             Container(
                //                 width: 130,
                //                 height: 50,
                //                 decoration: BoxDecoration(
                //                   border: Border.all(
                //                       color: AppColors.primaryColorLight2),
                //                   borderRadius: BorderRadius.circular(10),
                //                 ),
                //                 child: Center(child: Text("$MarginIntraday"))),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
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
                              setState(() {
                                CalculateOrder();
                              });
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
                            OrderPriceController.clear();
                            ShareValueController.clear();
                            MarginDelivery = 0.0;
                            MarginIntraday = 0.0;
                          }),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
