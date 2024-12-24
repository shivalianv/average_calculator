// import 'package:flutter/material.dart';
// import 'package:stock_average_calculator/Screens/EquityMargin_Model.dart';
// import 'package:stock_average_calculator/Utils/app_color_const.dart';
// import 'package:stock_average_calculator/Utils/custom_textformfield.dart';
// import 'package:textfield_search/textfield_search.dart';

// class EquityMargincalculator extends StatefulWidget {
//   const EquityMargincalculator({super.key});

//   @override
//   State<EquityMargincalculator> createState() => _EquityMargincalculatorState();
// }

// class _EquityMargincalculatorState extends State<EquityMargincalculator> {
//   TextEditingController SearchController = TextEditingController();

//   List<TextEditingController> OrderPriceController = [];
//   List<TextEditingController> ShareValueController = [];

//   List<String> FilteredCompaniesList = [];
//   List<Add_newCompany> AddmultipleCompanylist = [];

//   final FocusNode focusNode1 = FocusNode();
//   final FocusNode focusNode2 = FocusNode();

//   @override
//   void initState() {
//     FilteredCompaniesList = companies;
//     SearchController.addListener(SelectedCompany1);
//     OrderPriceController =
//         List.generate(companies.length, (index) => TextEditingController());
//     ShareValueController =
//         List.generate(companies.length, (index) => TextEditingController());

//     OrderPriceController.forEach((controller) {
//       controller.addListener(() {
//         print("changed Order price............ ${controller.text}");
//       });
//     });
//     ShareValueController.forEach((controller) {
//       controller.addListener(SelectedCompany1);
//       print(controller);

//     });

//     Add_company();
//     CalculateOrder();
//     RemoveCompany;
//     super.initState();
//   }

//   Map<String, double> CompanyBSEvalue = <String, double>{
//     "Swiggy Ltd.": 594.80,
//     "Enviro infra Engineers Ltd.": 380.50,
//     "Tata Motors Ltd": 784.70
//   };
//   Map<String, double> CompanyNSEvalue = <String, double>{
//     "Swiggy Ltd.": 596.35,
//     "Enviro infra Engineers Ltd.": 269.62,
//     "Tata Motors Ltd": 784.80
//   };

//   List<String> companies = <String>[
//     "Swiggy Ltd.",
//     "Enviro infra Engineers Ltd.",
//     "Tata Motors Ltd"
//   ];

//   String selectedCompany = '';
//   String SelectedBuysellList = '';

//   String? SelectedBuysellvalue = 'BUY';
//   String? SelectedExchangevalue = 'NSE';

//   double MarginDelivery = 0.0;
//   double MarginIntraday = 0.0;

//   void filterCompanies(String query) {
//     setState(() {
//       FilteredCompaniesList = companies
//           .where(
//               (company) => company.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   Future<void> SelectedCompany1() async {
//     double companyvalue = 0.0;
//      selectedCompany = SearchController.text.trim();

//     if (SelectedExchangevalue == 'NSE') {
//       if (CompanyNSEvalue.containsKey(selectedCompany)) {
//         companyvalue = CompanyNSEvalue[selectedCompany]!;
//         print("selected Company NSEvalue........$companyvalue");
//       } else {
//         print("Company not found: $selectedCompany");
//       }
//     } else {
//       if (CompanyBSEvalue.containsKey(selectedCompany)) {
//         companyvalue = CompanyBSEvalue[selectedCompany]!;
//         print("selected Company BSEvalue........$companyvalue");
//       } else {
//         print("Company not found: $selectedCompany");
//       }
//     }
//     if (companyvalue != 0.0) {
//       int index = FilteredCompaniesList.indexOf(selectedCompany);
//       if (index != -1 && index < OrderPriceController.length) {
//         OrderPriceController[index].text = companyvalue.toStringAsFixed(2);
//         print(
//             "Updated OrderPriceController at index $index: ${OrderPriceController[index].text}");
//       }
//     } else {
//       for (var controller in OrderPriceController) {
//         controller.text = '';
//       }
//       print("Company not found, cleared OrderPriceControllers");
//     }
//     setState(() {});
//   }

//   Future<void> CalculateOrder() async {
//     // String Ordervalue = OrderPriceController.text;
//     // String Sharevalue = ShareValueController.text;
//     List<TextEditingController> Ordervalue = OrderPriceController;
//     List<TextEditingController> Sharevalue = ShareValueController;

//     double parseToDouble(String input1) {
//       String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
//       return double.tryParse(cleanedInput1) ?? 0.0;
//     }

//     double OrderPrice = parseToDouble(Ordervalue.toString());
//     double Sharevaluealue = parseToDouble(Sharevalue.toString());

//     double RoundDelivery = OrderPrice * Sharevaluealue;
//     MarginDelivery = double.parse(RoundDelivery.toStringAsFixed(3));

//     double roundIntraday = OrderPrice * Sharevaluealue * (20 / 100);

//     MarginIntraday = double.parse(roundIntraday.toStringAsFixed(2));

//     if (SelectedBuysellvalue == 'BUY') {
//       SelectedBuysellList = MarginDelivery.toStringAsFixed(2);
//     } else {
//       SelectedBuysellList = '';
//       MarginDelivery = 0.0;
//     }

//     setState(() {});
//   }

//   Future<void> Add_company() async {
//     AddmultipleCompanylist.add(Add_newCompany(
//       textfiledserch: TextFieldSearch(
//         decoration: InputDecoration(border: InputBorder.none),
//         initialList: FilteredCompaniesList,
//         // controller: TextEditingController(),
//         controller: SearchController,
//         label: 'Search Company',
//         textStyle: TextStyle(color: AppColors.primaryColorDark1, fontSize: 14),
//       ),
//       ontap1: () {
//         if (mounted) {
//           setState(() {
//             filterCompanies(SearchController.text);
//           });
//         }
//       },
//       value1: SelectedBuysellvalue,
//       items1: ['BUY', 'SELL'],
//       value2: SelectedExchangevalue,
//       items2: ['NSE', 'BSE'],
//       onchanged1: (newvalue) {
//         print('Print onchange2.............$newvalue');
//         setState(() {
//           SelectedBuysellvalue = newvalue;
//           CalculateOrder();
//         });
//         print('Print onchange1.............$SelectedBuysellvalue');
//       },
//       onchanged2: (newvalue) {
//         print('Print onchange2.............$newvalue');
//         setState(() {
//           SelectedExchangevalue = newvalue;
//           CalculateOrder();
//         });
//         print('Print onchange2.............$SelectedExchangevalue');
//       },
//       customtextfield1: CustomTextFormField(
//         autofocus: true,
//         keyboardType: TextInputType.number,
//         focusNode: focusNode1,
//         controller: OrderPriceController[0],
//         icon: Icons.currency_rupee,
//         errorMessage: 'Order Price',
//         onchange: (value) {
//           setState(() {
//             OrderPriceController[0].text = value;
//             CalculateOrder();
//           });
//           print("orderprice..........${OrderPriceController[0].text}");
//         },
//       ),
//       customtextfield2: CustomTextFormField(
//         autofocus: true,
//         keyboardType: TextInputType.number,
//         focusNode: focusNode2,
//         controller: ShareValueController[0],
//         errorMessage: 'Invalid value Share',
//         onchange: (value) {
//           setState(() {
//             ShareValueController[0].text = value;
//             CalculateOrder();
//           });
//           print("sharevalue..........${ShareValueController[0].text}");
//         },
//       ),
//       TextMarginDelivery:
//           SelectedBuysellvalue == "SELL" ? '0.0' : SelectedBuysellList,
//       TextmarginIntraday: "$MarginIntraday",
//       DeleteOntap: () {
//         if (mounted) {
//           RemoveCompany;
//         }
//         setState(() {});
//       },
//     ));
//     setState(() {});
//   }

//   void RemoveCompany(int index) {
//     if (AddmultipleCompanylist.length > 1) {
//       AddmultipleCompanylist.removeAt(index);
//     }
//   }

//   @override
//   void dispose() {
//     // for (TextEditingController controller in ShareValueController) {
//     //   controller.dispose();
//     // }
//     // for (TextEditingController controller in OrderPriceController) {
//     //   controller.dispose();
//     // }
//     // for (TextEditingController  controller in SearchController) {
//     //   controller.dispose();
//     // }
//     // SearchController.dispose();
//     focusNode1.dispose();
//     focusNode2.dispose();
//     // OrderPriceController.dispose();
//     // ShareValueController.dispose();
//     OrderPriceController.forEach((controller) {
//       controller.dispose();
//     });
//     ShareValueController.forEach((controller) {
//       controller.dispose();
//     });

//     // SearchController.dispose();
//     SearchController.removeListener(SelectedCompany1);

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryBackgroundColor,
//       appBar: AppBar(
//         title: Text(
//           "Equity Margin Calculator",
//         ),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: AppColors.primaryColorDark1,
//             )),
//         backgroundColor: AppColors.primaryBackgroundColor,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 3,
//             child: ListView.builder(
//                 itemCount: AddmultipleCompanylist.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final Add_newCompany newcompanyadd =
//                       AddmultipleCompanylist[index];
//                   final List<String> defitem1 =
//                       newcompanyadd.items1.toSet().toList();
//                   final List<String> defitem2 =
//                       newcompanyadd.items2.toSet().toList();
//                   final value1 = defitem1.contains(
//                           newcompanyadd.value1) //selected_buysellvlaue
//                       ? newcompanyadd.value1
//                       : defitem1.isNotEmpty
//                           ? defitem1[0]
//                           : null;
//                   final value2 = defitem2.contains(
//                           newcompanyadd.value1) //SelectedExchangevalue
//                       ? newcompanyadd.value1
//                       : defitem2.isNotEmpty
//                           ? defitem2[0]
//                           : null;

//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Add_newCompany(
//                       textfiledserch: newcompanyadd.textfiledserch,
//                       // ontap1: newcompanyadd.ontap1,
//                       ontap1: () {
//                         if (mounted) {
//                           setState(() {
//                             filterCompanies(SearchController.text);
//                           });
//                         }
//                       },
//                       items1: newcompanyadd.items1,
//                       items2: newcompanyadd.items2,
//                       value1: newcompanyadd.value1,
//                       value2: newcompanyadd.value2,
//                       onchanged1: (newvalue) {
//                         setState(() {
//                           print("value onchange1,,,,,,,,,,,,,,");

//                           newcompanyadd.value1 = newvalue!;
//                           newcompanyadd.onchanged1!(newvalue);
//                         });
//                         CalculateOrder();
//                         SelectedCompany1();
//                       },
//                       onchanged2: (newvalue) {
//                         print("value onchange2,,,,,,,,,,,,,,");
//                         setState(() {
//                           newcompanyadd.value2 = newvalue!;
//                           newcompanyadd.onchanged2!(newvalue);
//                         });
//                         CalculateOrder();
//                         SelectedCompany1();
//                       },
//                       customtextfield1: CustomTextFormField(
//                         autofocus: true,
//                         keyboardType: TextInputType.number,
//                         focusNode: focusNode1,
//                         controller: OrderPriceController[index],
//                         icon: Icons.currency_rupee,
//                         errorMessage: 'Order Price',
//                         onchange: (value) {
//                           setState(() {
//                             CalculateOrder();
//                           });
//                           print(
//                               "orderprice..........${OrderPriceController[index].text}");
//                         },
//                       ),
//                       customtextfield2: CustomTextFormField(
//                         autofocus: true,
//                         keyboardType: TextInputType.number,
//                         focusNode: focusNode2,
//                         controller: ShareValueController[index],
//                         errorMessage: 'Invalid value Share',
//                         onchange: (value) {
//                           setState(() {
//                             // CalculateOrder();
//                           });
//                           print(
//                               "sharevalue..........${ShareValueController[index].text}");
//                         },
//                       ),

//                       TextmarginIntraday: newcompanyadd.TextmarginIntraday,
//                       TextMarginDelivery: newcompanyadd.TextMarginDelivery,

//                       // AddOntap: () {},
//                       DeleteOntap: () {
//                         if (mounted) {
//                           setState(() {
//                             RemoveCompany(index);
//                           });
//                           // RemoveCompany(AddmultipleCompanylist.indexOf(newcompanyadd));
//                         }
//                       },
//                     ),
//                   );
//                 }),
//           ),
//           Container(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       width: 150,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CustomButton(
//                             isLoading: false,
//                             text: 'Add Company',
//                             onPressed: () {
//                               setState(() {
//                                 Add_company();
//                               });
//                             }),
//                       ),
//                     ),
//                     Container(
//                       width: 150,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CustomButton(
//                             isLoading: false,
//                             text: 'Remove ',
//                             onPressed: () {
//                               setState(() {
//                                 print("pressed remove");
//                                 if (mounted) {
//                                   RemoveCompany;
//                                 }
//                               });
//                             }),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 // Container(
//                 //   decoration: BoxDecoration(
//                 //     border: Border.all(color: AppColors.primaryColorLight3),
//                 //     borderRadius: BorderRadius.circular(10),
//                 //   ),
//                 //   child: Padding(
//                 //     padding: const EdgeInsets.all(10.0),
//                 //     child: Column(
//                 //       crossAxisAlignment: CrossAxisAlignment.start,
//                 //       children: [
//                 //         Text(
//                 //           "Total",
//                 //           style: TextStyle(
//                 //               color: AppColors.primaryColorDark2, fontSize: 15),
//                 //         ),
//                 //         Row(
//                 //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 //           children: [
//                 //             Text(
//                 //               "Margin For Delivery:",
//                 //               style: TextStyle(
//                 //                   color: AppColors.primaryColorDark2,
//                 //                   fontSize: 15),
//                 //             ),
//                 //             Container(
//                 //               width: 130,
//                 //               height: 50,
//                 //               decoration: BoxDecoration(
//                 //                 border: Border.all(
//                 //                     color: AppColors.primaryColorLight2),
//                 //                 borderRadius: BorderRadius.circular(10),
//                 //               ),
//                 //               child: Center(child: Text("$MarginDelivery")),
//                 //             ),
//                 //           ],
//                 //         ),
//                 //         SizedBox(
//                 //           height: 10,
//                 //         ),
//                 //         Row(
//                 //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 //           children: [
//                 //             Text(
//                 //               "Margin For Intraday:",
//                 //               style: TextStyle(
//                 //                   color: AppColors.primaryColorDark2,
//                 //                   fontSize: 15),
//                 //             ),
//                 //             Container(
//                 //                 width: 130,
//                 //                 height: 50,
//                 //                 decoration: BoxDecoration(
//                 //                   border: Border.all(
//                 //                       color: AppColors.primaryColorLight2),
//                 //                   borderRadius: BorderRadius.circular(10),
//                 //                 ),
//                 //                 child: Center(child: Text("$MarginIntraday"))),
//                 //           ],
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                         width: 150,
//                         decoration: BoxDecoration(
//                             border:
//                                 Border.all(color: AppColors.primaryColorLight3),
//                             borderRadius: BorderRadius.circular(10),
//                             color: AppColors.primaryBackgroundColor),
//                         child: TextButton(
//                             clipBehavior: Clip.antiAlias,
//                             onPressed: () {
//                               setState(() {
//                                 // CalculateOrder();
//                               });
//                             },
//                             child: Text(
//                               "Calculate",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ))),
//                     Container(
//                       width: 150,
//                       child: CustomButton(
//                           isLoading: false,
//                           text: 'Cancel',
//                           onPressed: () {
//                             OrderPriceController.clear();
//                             ShareValueController.clear();
//                             MarginDelivery = 0.0;
//                             MarginIntraday = 0.0;
//                           }),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

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
  List<TextEditingController> SearchController = [];
  List<TextEditingController> OrderPriceController = [];
  List<TextEditingController> ShareValueController = [];

  List<String> FilteredCompaniesList = []; //only companyname
  List<Add_newCompany> AddmultipleCompanylist = [];

  List<FocusNode> focusNodes = [];

  @override
  void initState() {
    FilteredCompaniesList = companies;
    SearchController =List.generate(companies.length, (index) => TextEditingController());
    OrderPriceController =List.generate(companies.length, (index) => TextEditingController());
    ShareValueController =List.generate(companies.length, (index) => TextEditingController());
    focusNodes =List.generate(companies.length, (index) => FocusNode());

    SearchController.forEach((controller) {
      controller.addListener(SelectedCompany1);
      print("searchcontroller............ ${controller.text}");
    });
    OrderPriceController.forEach((controller) {
      controller.addListener(SelectedCompany1);
      print("changed Order price............ ${controller.text}");
    });
    ShareValueController.forEach((controller) {
      controller.addListener(SelectedCompany1);
      print("changed Share vlaue.......... ${controller.text}");
    });

    // for (int i = 0; i < companies.length; i++) {
    //   focusNodes.add(FocusNode());
    //   SearchController.add(TextEditingController());
    //   OrderPriceController.add(TextEditingController());
    //   ShareValueController.add(TextEditingController());
    //   // controllers[i].dispose();
    // }

    Add_company();
    CalculateOrder();
    // RemoveCompany;
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

  // String SelectedCompany = '';
  String SelectedBuysellList = '';

  String? SelectedBuysellvalue = 'BUY';
  String? SelectedExchangevalue = 'NSE';

  double MarginDelivery = 0.0;
  double MarginIntraday = 0.0;

  void filterCompanies(String query) {
    setState(() {
      FilteredCompaniesList = companies
          .where(
              (company) => company.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> SelectedCompany1() async {
    double companyvalue = 0.0;
    String selectedCompany = SearchController[0].text.trim();

    if (SelectedExchangevalue == 'NSE') {
      if (CompanyNSEvalue.containsKey(selectedCompany)) {
        companyvalue = CompanyNSEvalue[selectedCompany]!;
        print("selected Company NSEvalue........$companyvalue");
      } else {
        print("Company not found: $selectedCompany");
      }
    } else {
      if (CompanyBSEvalue.containsKey(selectedCompany)) {
        companyvalue = CompanyBSEvalue[selectedCompany]!;
        print("selected Company BSEvalue........$companyvalue");
      } else {
        print("Company not found: $selectedCompany");
      }
    }
    if (companyvalue != 0.0) {
      int index = FilteredCompaniesList.indexOf(selectedCompany);
      if (index != -1 && index < OrderPriceController.length) {
        OrderPriceController[index].text = companyvalue.toStringAsFixed(2);
        print(
            "Updated OrderPriceController at index $index: ${OrderPriceController[index].text}");
      }
    } else {
      for (var controller in OrderPriceController) {
        controller.text = '';
      }
      print("Company not found, cleared OrderPriceControllers");
    }
    setState(() {});
  }

  Future<void> CalculateOrder() async {
    List<TextEditingController> Ordervalue = OrderPriceController;
    List<TextEditingController> Sharevalue = ShareValueController;
    // double totalMarginDelivery = 0.0;
    // double totalMarginIntraday = 0.0;

    double parseToDouble(String input1) {
      String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
      return double.tryParse(cleanedInput1) ?? 0.0;
    }

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

    // for(String Company in companies){
    //  double OrderPrice = double.tryParse(companies.OrderPriceController.text)??0.0;
    //  double sharevalue = double.tryParse(companies.ShareValueController.text)??0.0;
    // }
    // //total margin
    //  totalMarginDelivery += OrderPrice;
    //  totalMarginIntraday += sharevalue;

    setState(() {});
  }

  Future<void> Add_company() async {
    setState(() {
      companies.add("${companies.length+1}");
       
      SearchController.add(TextEditingController());
      OrderPriceController.add(TextEditingController());
      ShareValueController.add(TextEditingController());
       focusNodes.add(FocusNode());
    });
    
    await Future.delayed(Duration(seconds: 2));//delay 

    AddmultipleCompanylist.add(Add_newCompany(
      textfiledserch: TextFieldSearch(
        decoration: InputDecoration(border: InputBorder.none),
        initialList: FilteredCompaniesList,
        controller: SearchController[0],
        label: 'Search Company',
        textStyle: TextStyle(color: AppColors.primaryColorDark1, fontSize: 14),
      ),
      ontap1: () {
        if (mounted) {
          setState(() {
            filterCompanies(SearchController[0].text);
          });
        }
      },
      value1: SelectedBuysellvalue,
      items1: ['BUY', 'SELL'],
      value2: SelectedExchangevalue,
      items2: ['NSE', 'BSE'],
      onchanged1: (newvalue) {
        print('Print onchange2.............$newvalue');

        setState(() {
          SelectedBuysellvalue = newvalue;
          CalculateOrder();
        });
        print('Print onchange1.............$SelectedBuysellvalue');
      },
      onchanged2: (newvalue) {
        print('Print onchange2.............$newvalue');
        setState(() {
          SelectedExchangevalue = newvalue;
          CalculateOrder();
        });
        print('Print onchange2.............$SelectedExchangevalue');
      },
      customtextfield1: CustomTextFormField(
        autofocus: true,
        keyboardType: TextInputType.number,
        focusNode: focusNodes[0],
        controller: OrderPriceController[0],
        icon: Icons.currency_rupee,
        errorMessage: 'Order Price',
        onchange: (value) {
          setState(() {
            OrderPriceController[0].text = value;
            CalculateOrder();
          });
          print("orderprice..........${OrderPriceController[0].text}");
        },
      ),
      customtextfield2: CustomTextFormField(
        autofocus: true,
        keyboardType: TextInputType.number,
        focusNode: focusNodes[0],
        controller: ShareValueController[0],
        errorMessage: 'Invalid value Share',
        onchange: (value) {
          setState(() {
            double sharevalue = double.tryParse(value)??1.0;
              if(sharevalue<1){
                sharevalue =1.0;
                print("minimum sharevalue$sharevalue");
              }
            ShareValueController[0].text = sharevalue.toStringAsFixed(2);
            CalculateOrder();
          });
          print("sharevalue..........${ShareValueController[0].text}");
        },
      ),
      TextMarginDelivery:
          SelectedBuysellvalue == "SELL" ? '0.0' : SelectedBuysellList,
      TextmarginIntraday: "$MarginIntraday",
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
    SearchController[index].dispose();
    OrderPriceController[index].dispose();
    ShareValueController[index].dispose();
    focusNodes[index].dispose();

    if (AddmultipleCompanylist.length > 1) {
      AddmultipleCompanylist.removeAt(index);
      SearchController.removeAt(index);
      OrderPriceController.removeAt(index);
      ShareValueController.removeAt(index);
      focusNodes.removeAt(index);
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < SearchController.length; i++) {
      SearchController[i].dispose();
    }
    for (int i = 0; i < OrderPriceController.length; i++) {
      OrderPriceController[i].dispose();
    }
    for (int i = 0; i < ShareValueController.length; i++) {
      ShareValueController[i].dispose();
    }
    for (int i = 0; i < focusNodes.length; i++) {
      focusNodes[i].dispose();
    }

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
                itemCount: AddmultipleCompanylist.length,
                itemBuilder: (BuildContext context, int index) {
                  final Add_newCompany newcompanyadd =
                      AddmultipleCompanylist[index];
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
                      textfiledserch: TextFieldSearch(
                        decoration: InputDecoration(border: InputBorder.none),
                        initialList: FilteredCompaniesList,
                        controller: SearchController[index],
                        label: 'Search Company',
                        textStyle: TextStyle(
                            color: AppColors.primaryColorDark1, fontSize: 14),
                      ),
                      ontap1: newcompanyadd.ontap1,
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
                        focusNode: focusNodes[index],
                        controller: OrderPriceController[index],
                        icon: Icons.currency_rupee,
                        errorMessage: 'Order Price',
                        onchange: (value) {
                          setState(() {
                            // OrderPriceController[index].text = value;
                            // CalculateOrder();
                          });
                          print(
                              "orderprice..........${OrderPriceController[index].text}");
                        },
                      ),
                      customtextfield2: CustomTextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        focusNode: focusNodes[index],
                        controller: ShareValueController[index],
                        errorMessage: 'Invalid value Share',
                        onchange: (value) {
                          setState(() {
                            //  OrderPriceController[index].text = value;

                            // CalculateOrder();
                          });
                          print(
                              "sharevalue..........${ShareValueController[index].text}");
                        },
                      ),

                      TextmarginIntraday: newcompanyadd.TextmarginIntraday,
                      TextMarginDelivery: newcompanyadd.TextMarginDelivery,

                      // AddOntap: () {},
                      DeleteOntap: () {
                        if (mounted) {
                          setState(() {
                            RemoveCompany(index);
                          });
                          // RemoveCompany(AddmultipleCompanylist.indexOf(newcompanyadd));
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
                                // CalculateOrder();
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
