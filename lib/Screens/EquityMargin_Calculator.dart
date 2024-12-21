// import 'package:flutter/material.dart';
// import 'package:stock_average_calculator/Utils/app_color_const.dart';
// import 'package:stock_average_calculator/Utils/custom_textformfield.dart';
// import 'package:textfield_search/textfield_search.dart';

// class Equity_Margin_calculator extends StatefulWidget {
//   const Equity_Margin_calculator({super.key});

//   @override
//   State<Equity_Margin_calculator> createState() =>
//       _Equity_Margin_calculatorState();
// }

// class _Equity_Margin_calculatorState extends State<Equity_Margin_calculator> {
//   final TextEditingController SearchController = TextEditingController();

//   final TextEditingController OrderPriceController = TextEditingController();
//   final TextEditingController ShareValueController = TextEditingController();

//   final FocusNode focusNode1 = FocusNode();
//   final FocusNode focusNode2 = FocusNode();

//   @override
//   void initState() {
//     FilteredCompaniesList = companies;

//     SearchController.addListener(SelectedCompany1);
//     CalculateOrder();
//     Add_company();
//     super.initState();
//   }

//   List<String> FilteredCompaniesList = [];

//   Map<String, double> CompanyBSEvalue = {
//     "Swiggy Ltd.": 594.80,
//     "Enviro infra Engineers Ltd.": 380.50,
//     "Tata Motors Ltd": 784.70
//   };
//   Map<String, double> Company_NSEvalue = {
//     "Swiggy Ltd.": 596.35,
//     "Enviro infra Engineers Ltd.": 269.62,
//     "Tata Motors Ltd": 784.80
//   };

//   List<String> companies = [
//     "Swiggy Ltd.",
//     "Enviro infra Engineers Ltd.",
//     "Tata Motors Ltd"
//   ];

//   List<Add_newCompany> AddmultipleMompanylist = [];
//   String selected_company = '';
//   String SelectedBuysellList = '';

//   String? SelectedBuysellvalue = 'BUY';
//   String? SelectedExchangevalue = 'NSE';

//   List<String> BuysellList = ['BUY', 'SELL']; //Option
//   List<String> ExchangeList = ['NSE', 'BSE']; //Option2

//   double MarginDelivery = 0.0;
//   double MarginIntraday = 0.0;

//   void SelectedCompany1() {
//     //
//     double companyvalue = 0.0;
//     String selectedCompany = SearchController.text.trim();

//     if (SelectedExchangevalue == 'NSE') {
//       if (Company_NSEvalue.containsKey(selectedCompany)) {
//         companyvalue = Company_NSEvalue[selectedCompany]!;
//       } else {
//         print("Company not found: $selectedCompany");
//       }
//     } else {
//       if (CompanyBSEvalue.containsKey(selectedCompany)) {
//         companyvalue = CompanyBSEvalue[selectedCompany]!;
//       } else {
//         print("Company not found: $selectedCompany");
//       }
//     }
//     if (companyvalue != 0.0) {
//       OrderPriceController.text = companyvalue.toStringAsFixed(2);
//     } else {
//       OrderPriceController.text = '';
//     }
//     setState(() {});
//   }

//   void CalculateOrder() {
//     //
//     String Ordervalue = OrderPriceController.text;
//     String Sharevalue = ShareValueController.text;

//     double parseToDouble(String input1) {
//       String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
//       return double.tryParse(cleanedInput1) ?? 0.0;
//     }

//     double OrderPrice = parseToDouble(Ordervalue);
//     double Sharevaluealue = parseToDouble(Sharevalue);

//     double RoundDelivery = OrderPrice * Sharevaluealue;
//     MarginDelivery = double.parse(RoundDelivery.toStringAsFixed(3));

//     double round_intraday = OrderPrice * Sharevaluealue * (20 / 100);

//     MarginIntraday = double.parse(round_intraday.toStringAsFixed(2));

//     if (SelectedBuysellvalue == 'BUY') {
//       SelectedBuysellList = MarginDelivery.toStringAsFixed(2);
//     } else {
//       SelectedBuysellList = '';
//       MarginDelivery = 0.0;
//     }

//     setState(() {});
//   }

//   void RemoveCompany(int index) {
//     setState(() {
//       AddmultipleMompanylist.removeAt(index);
//       if (selected_company == AddmultipleMompanylist[index]) {
//         selected_company = '';
//       }
//     });
//   }

//   // List<Widget> AddmultipleMompanylist = [];

//   void Add_company() {
//     setState(() {
//       AddmultipleMompanylist.add(Add_newCompany(
//         textfiledserch: TextFieldSearch(
//           decoration: InputDecoration(border: InputBorder.none),
//           initialList: FilteredCompaniesList,
//           controller: SearchController,
//           label: 'Search Company',
//           textStyle:
//               TextStyle(color: AppColors.primaryColorDark1, fontSize: 14),
//         ),
//         value1: SelectedBuysellvalue,
//         items1: BuysellList.toSet().toList(),
//         value2: SelectedExchangevalue,
//         items2: ExchangeList.toSet().toList(),
//         onchanged1: (newvalue) {
//           setState(() {
//             SelectedBuysellvalue = newvalue ?? "";
//             CalculateOrder();
//           });
//         },
//         onchanged2: (newvalue) {
//           setState(() {
//             SelectedBuysellvalue = newvalue ?? "";
//             // if (SelectedBuysellvalue != null) {
//             //   SelectedBuysellvalue!;
//             // }
//           });
//         },
//         customtextfield1: CustomTextFormField(
//           autofocus: true,
//           keyboardType: TextInputType.number,
//           focusNode: focusNode1,
//           controller: OrderPriceController,
//           icon: Icons.currency_rupee,
//           errorMessage: 'Order Price',
//           onchange: (value) {
//             setState(() {
//               CalculateOrder();
//             });
//           },
//         ),
//         customtextfield2: CustomTextFormField(
//           autofocus: true,
//           keyboardType: TextInputType.number,
//           focusNode: focusNode2,
//           controller: ShareValueController,
//           errorMessage: 'Invalid value Share',
//           onchange: (value) {
//             setState(() {
//               CalculateOrder();
//             });
//           },
//         ),
//         TextMarginDelivery:
//             SelectedBuysellvalue == "SELL" ? '0.0' : SelectedBuysellList,
//         TextmarginIntraday: "$MarginIntraday",
//       ));
//     });
//   }

//   @override
//   void dispose() {
//     focusNode1.dispose();
//     focusNode2.dispose();

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
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               // if (selected_company != null)
//               //   Add_newCompany(
//               //     textfiledserch: TextFieldSearch(
//               //       decoration: InputDecoration(border: InputBorder.none),
//               //       initialList: FilteredCompaniesList,
//               //       controller: SearchController,
//               //       label: 'Search Company',
//               //       textStyle: TextStyle(
//               //           color: AppColors.primaryColorDark1, fontSize: 14),
//               //     ),
//               //     value1: SelectedBuysellvalue,
//               //     items1: BuysellList,
//               //     value2: SelectedExchangevalue,
//               //     items2: ExchangeList,
//               //     customtextfield1: CustomTextFormField(
//               //       autofocus: true,
//               //       keyboardType: TextInputType.number,
//               //       focusNode: focusNode1,
//               //       controller: OrderPriceController,
//               //       icon: Icons.currency_rupee,
//               //       errorMessage: 'Order Price',
//               //       onchange: (value) {
//               //         setState(() {
//               //           CalculateOrder();
//               //         });
//               //       },
//               //     ),
//               //     customtextfield2: CustomTextFormField(
//               //       autofocus: true,
//               //       keyboardType: TextInputType.number,
//               //       focusNode: focusNode2,
//               //       controller: ShareValueController,
//               //       errorMessage: 'Invalid value Share',
//               //       onchange: (value) {
//               //         setState(() {
//               //           CalculateOrder();
//               //         });
//               //       },
//               //     ),
//               //     TextMarginDelivery: SelectedBuysellvalue == "SELL"
//               //         ? '0.0'
//               //         : SelectedBuysellList,
//               //     TextmarginIntraday: "$MarginIntraday",
//               //     onchanged1: (newvalue) {
//               //       setState(() {
//               //         SelectedBuysellvalue != newvalue;
//               //         if (SelectedBuysellvalue != null) {
//               //           SelectedBuysellvalue!;
//               //         }
//               //       });
//               //     },
//               //     onchanged2: (newvalue) {
//               //       setState(() {
//               //         SelectedBuysellvalue != newvalue;
//               //         if (SelectedBuysellvalue != null) {
//               //           SelectedBuysellvalue!;
//               //         }
//               //       });
//               //     },
//               //   ),
//               // SizedBox(
//               //   height: 10,
//               // ),
//               Container(
//                 height: 450,
//                 child: ListView.builder(
//                     itemCount: AddmultipleMompanylist.length,
//                     itemBuilder: (context, index) {
//                       final newcompanyadd = AddmultipleMompanylist[index];
//                       final defitem1 = newcompanyadd.items1.toSet().toList();
//                       final defitem2 = newcompanyadd.items2.toSet().toList();

//                       final value1 = defitem1.contains(
//                               newcompanyadd.value1) //selected_buysellvlaue
//                           ? newcompanyadd.value1
//                           : defitem1.isNotEmpty
//                               ? defitem1[0]
//                               : null;
//                       final value2 = defitem2.contains(
//                               newcompanyadd.value1) //SelectedExchangevalue
//                           ? newcompanyadd.value1
//                           : defitem2.isNotEmpty
//                               ? defitem2[0]
//                               : null;

//                       return Add_newCompany(
//                         textfiledserch: newcompanyadd.textfiledserch,
//                         items1: newcompanyadd.items1,
//                         items2: newcompanyadd.items2,
//                         value1: newcompanyadd.value1,
//                         value2: newcompanyadd.value2,
//                         onchanged1: (newvalue) {
//                           setState(() {
//                             SelectedBuysellvalue = newvalue ?? "";
//                             newcompanyadd.value1 == SelectedBuysellvalue;
//                             CalculateOrder();
//                           });
//                         },
//                         onchanged2: (newvalue) {
//                           setState(() {
//                             SelectedExchangevalue = newvalue ?? "";
//                             CalculateOrder();
//                           });
//                         },
//                         TextmarginIntraday: newcompanyadd.TextmarginIntraday,
//                         TextMarginDelivery: newcompanyadd.TextMarginDelivery,
//                         customtextfield1: newcompanyadd.customtextfield1,
//                         customtextfield2: newcompanyadd.customtextfield2,
//                       );
//                     }),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     width: 150,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: CustomButton(
//                           isLoading: false,
//                           text: 'Add Company',
//                           onPressed: () {
//                             setState(() {
//                               Add_company();
//                             });
//                           }),
//                     ),
//                   ),
//                   Container(
//                     width: 150,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: CustomButton(
//                           isLoading: false,
//                           text: 'Remove ',
//                           onPressed: () {
//                             setState(() {
//                               RemoveCompany;
//                             });
//                           }),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               // Container(
//               //   decoration: BoxDecoration(
//               //     border: Border.all(color: AppColors.primaryColorLight3),
//               //     borderRadius: BorderRadius.circular(10),
//               //   ),
//               //   child: Padding(
//               //     padding: const EdgeInsets.all(10.0),
//               //     child: Column(
//               //       crossAxisAlignment: CrossAxisAlignment.start,
//               //       children: [
//               //         Text(
//               //           "Total",
//               //           style: TextStyle(
//               //               color: AppColors.primaryColorDark2, fontSize: 15),
//               //         ),
//               //         Row(
//               //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //           children: [
//               //             Text(
//               //               "MARGIN FOR DELIVERY:",
//               //               style: TextStyle(
//               //                   color: AppColors.primaryColorDark2,
//               //                   fontSize: 15),
//               //             ),
//               //             Container(
//               //               width: 130,
//               //               height: 50,
//               //               decoration: BoxDecoration(
//               //                 border: Border.all(
//               //                     color: AppColors.primaryColorLight2),
//               //                 borderRadius: BorderRadius.circular(10),
//               //               ),
//               //               child: Center(child: Text("$MarginDelivery")),
//               //             ),
//               //           ],
//               //         ),
//               //         SizedBox(
//               //           height: 10,
//               //         ),
//               //         Row(
//               //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //           children: [
//               //             Text(
//               //               "MARGIN FOR INTRADAY:",
//               //               style: TextStyle(
//               //                   color: AppColors.primaryColorDark2,
//               //                   fontSize: 15),
//               //             ),
//               //             Container(
//               //                 width: 130,
//               //                 height: 50,
//               //                 decoration: BoxDecoration(
//               //                   border: Border.all(
//               //                       color: AppColors.primaryColorLight2),
//               //                   borderRadius: BorderRadius.circular(10),
//               //                 ),
//               //                 child: Center(child: Text("$MarginIntraday"))),
//               //           ],
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 10,
//               // ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                       width: 150,
//                       decoration: BoxDecoration(
//                           border:
//                               Border.all(color: AppColors.primaryColorLight3),
//                           borderRadius: BorderRadius.circular(10),
//                           color: AppColors.primaryBackgroundColor),
//                       child: TextButton(
//                           clipBehavior: Clip.antiAlias,
//                           onPressed: () {
//                             setState(() {
//                               CalculateOrder();
//                             });
//                           },
//                           child: Text(
//                             "Calculate",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ))),
//                   Container(
//                     width: 150,
//                     child: CustomButton(
//                         isLoading: false,
//                         text: 'Cancel',
//                         onPressed: () {
//                           OrderPriceController.clear();
//                           ShareValueController.clear();
//                           // MarginDelivery = 0.0;
//                           // MarginIntraday = 0.0;
//                         }),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Add_newCompany extends StatefulWidget {
//   // List initialList1;
//   final TextFieldSearch textfiledserch;
//   final CustomTextFormField customtextfield1;
//   final CustomTextFormField customtextfield2;
//   final List<String> items1;
//   final List<String> items2;
//   final dynamic value1;
//   final dynamic value2;
//   final String TextMarginDelivery;
//   final String TextmarginIntraday;

//   Function(dynamic)? onchanged1;
//   Function(dynamic)? onchanged2;

//   Add_newCompany({
//     super.key,
//     required this.textfiledserch,
//     required this.value2,
//     required this.TextMarginDelivery,
//     required this.TextmarginIntraday,
//     required this.items1,
//     required this.value1,
//     required this.onchanged1,
//     required this.onchanged2,
//     required this.items2,
//     required this.customtextfield1,
//     required this.customtextfield2,
//   });

//   @override
//   State<Add_newCompany> createState() => _Add_newCompanyState();
// }

// class _Add_newCompanyState extends State<Add_newCompany> {
//   final TextEditingController SearchController = TextEditingController();

//   List<String> companies = [
//     "Swiggy Ltd.",
//     "Enviro infra Engineers Ltd.",
//     "Tata Motors Ltd"
//   ];
//   String? SelectedBuysellvalue = 'BUY';
//   String? SelectedExchangevalue = 'NSE';

//   List<String> FilteredCompaniesList = [];

//   void filterCompanies(String query) {
//     setState(() {
//       FilteredCompaniesList = companies
//           .where(
//               (company) => company.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//     final TextEditingController OrderPriceController = TextEditingController();
//   final TextEditingController ShareValueController = TextEditingController();

//   final FocusNode focusNode1 = FocusNode();
//   final FocusNode focusNode2 = FocusNode();

//   @override
//   void dispose() {
//     focusNode1.dispose();
//     focusNode2.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(
//     BuildContext context,
//   ) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColors.primaryColorLight2),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               "Company:",
//               style:
//                   TextStyle(color: AppColors.primaryColorDark2, fontSize: 14),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: AppColors.primaryColorLight2),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       filterCompanies(SearchController.text);
//                     });
//                   },
//                   child: widget.textfiledserch),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       "BUY/SELL:",
//                       style: TextStyle(
//                           color: AppColors.primaryColorDark2, fontSize: 15),
//                     ),
//                     Container(
//                       width: 150,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.primaryColorLight2),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: DropdownButtonFormField(
//                         decoration: InputDecoration(border: InputBorder.none),
//                         value: widget.value1,
//                         items: widget.items1.map((String item) {
//                           return DropdownMenuItem<String>(
//                               value: item,
//                               child: Center(
//                                 child: Text(
//                                   item,
//                                   style: TextStyle(
//                                       color: AppColors.primaryColorDark1,
//                                       fontSize: 15),
//                                 ),
//                               ));
//                         }).toList(),
//                         onChanged: (newvalue) {
//                           setState(() {
//                             SelectedBuysellvalue != newvalue;
//                             if (widget.onchanged1 != null) {
//                               widget.onchanged1!(newvalue);
//                             }
//                           });
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       "Exchange:",
//                       style: TextStyle(
//                           color: AppColors.primaryColorDark2, fontSize: 15),
//                     ),
//                     Container(
//                       width: 150,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.primaryColorLight2),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: DropdownButtonFormField(
//                         alignment: AlignmentDirectional.center,
//                         decoration: InputDecoration(border: InputBorder.none),
//                         value: widget.value2,
//                         items: widget.items2.map((String item) {
//                           return DropdownMenuItem<String>(
//                               alignment: AlignmentDirectional.center,
//                               value: item,
//                               child: Text(
//                                 item,
//                                 style: TextStyle(
//                                     color: AppColors.primaryColorDark1,
//                                     fontSize: 15),
//                               ));
//                         }).toList(),
//                         onChanged: (newvalue) {
//                           setState(() {
//                             SelectedExchangevalue != newvalue;
//                             if (widget.onchanged2 != null) {
//                               widget.onchanged2!(newvalue);
//                             }
//                           });
//                           // setState(() {
//                           //   SelectedExchangevalue != newvalue2;
//                           //   // SelectedExchangevalue = newvalue2!;
//                           // });

//                           // SelectedCompany1();
//                           // CalculateOrder();
//                         },
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       "Order Price:",
//                       style: TextStyle(
//                           color: AppColors.primaryColorDark2, fontSize: 15),
//                     ),
//                     Container(
//                       width: 150,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.primaryColorLight2),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: widget.customtextfield1,
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       "Share:",
//                       style: TextStyle(
//                           color: AppColors.primaryColorDark2, fontSize: 15),
//                     ),
//                     Container(
//                         width: 150,
//                         decoration: BoxDecoration(
//                           border:
//                               Border.all(color: AppColors.primaryColorLight2),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: widget.customtextfield2),
//                   ],
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "MARGIN FOR DELIVERY:",
//                   style: TextStyle(
//                       color: AppColors.primaryColorDark2, fontSize: 15),
//                 ),
//                 Container(
//                   width: 310,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: AppColors.primaryColorLight2),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Center(child: Text(widget.TextMarginDelivery ?? "")),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "MARGIN FOR INTRADAY:",
//                   style: TextStyle(
//                       color: AppColors.primaryColorDark2, fontSize: 15),
//                 ),
//                 Container(
//                   width: 310,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: AppColors.primaryColorLight2),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Center(child: Text(widget.TextmarginIntraday ?? "")),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:stock_average_calculator/Screens/EquityMargin_Model.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';
import 'package:stock_average_calculator/Utils/custom_textformfield.dart';
import 'package:textfield_search/textfield_search.dart';

class Equity_Margin_calculator extends StatefulWidget {
  const Equity_Margin_calculator({super.key});

  @override
  State<Equity_Margin_calculator> createState() =>
      _Equity_Margin_calculatorState();
}

class _Equity_Margin_calculatorState extends State<Equity_Margin_calculator> {
  final TextEditingController SearchController = TextEditingController();

  // final TextEditingController OrderPriceController = TextEditingController();
  // final TextEditingController ShareValueController = TextEditingController();
  List<TextEditingController> OrderPriceController = [];
  List<TextEditingController> ShareValueController = [];

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();

  @override
  void initState() {
    RemoveCompany;
    FilteredCompaniesList = companies;

    SearchController.addListener(SelectedCompany1);
    CalculateOrder();
    Add_company();

    super.initState();
  }

  List<String> FilteredCompaniesList = [];

  Map<String, double> CompanyBSEvalue = {
    "Swiggy Ltd.": 594.80,
    "Enviro infra Engineers Ltd.": 380.50,
    "Tata Motors Ltd": 784.70
  };
  Map<String, double> Company_NSEvalue = {
    "Swiggy Ltd.": 596.35,
    "Enviro infra Engineers Ltd.": 269.62,
    "Tata Motors Ltd": 784.80
  };

  List<String> companies = [
    "Swiggy Ltd.",
    "Enviro infra Engineers Ltd.",
    "Tata Motors Ltd"
  ];

  List<Add_newCompany> AddmultipleMompanylist = [];
  String selected_company = '';
  String SelectedBuysellList = '';

  String? SelectedBuysellvalue = 'BUY';
  String? SelectedExchangevalue = 'NSE';

  List<String> BuysellList = ['BUY', 'SELL']; //Option
  List<String> ExchangeList = ['NSE', 'BSE']; //Option2

  double MarginDelivery = 0.0;
  double MarginIntraday = 0.0;

  Future<void> SelectedCompany1() async {
    //
    double companyvalue = 0.0;
    String selectedCompany = SearchController.text.trim();

    if (SelectedExchangevalue == 'NSE') {
      if (Company_NSEvalue.containsKey(selectedCompany)) {
        companyvalue = Company_NSEvalue[selectedCompany]!;
      } else {
        print("Company not found: $selectedCompany");
      }
    } else {
      if (CompanyBSEvalue.containsKey(selectedCompany)) {
        companyvalue = CompanyBSEvalue[selectedCompany]!;
      } else {
        print("Company not found: $selectedCompany");
      }
    }
    if (companyvalue != 0.0) {
      OrderPriceController;
      // OrderPriceController = companyvalue.toStringAsFixed(2);
    } else {
      OrderPriceController;
      // OrderPriceController = '';
    }
    setState(() {});
  }

  Future<void> CalculateOrder() async {
    //
    List<TextEditingController> Ordervalue = OrderPriceController;
    List<TextEditingController> Sharevalue = ShareValueController;

    double parseToDouble(String input1) {
      String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
      return double.tryParse(cleanedInput1) ?? 0.0;
    }

    double OrderPrice = parseToDouble(Ordervalue.toString());
    double Sharevaluealue = parseToDouble(Sharevalue.toString());

    double RoundDelivery = OrderPrice * Sharevaluealue;
    MarginDelivery = double.parse(RoundDelivery.toStringAsFixed(3));

    double round_intraday = OrderPrice * Sharevaluealue * (20 / 100);

    MarginIntraday = double.parse(round_intraday.toStringAsFixed(2));

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

    AddmultipleMompanylist.add(Add_newCompany(
      textfiledserch: TextFieldSearch(
        decoration: InputDecoration(border: InputBorder.none),
        initialList: FilteredCompaniesList,
        controller: TextEditingController(),
        // controller: SearchController,
        label: 'Search Company',
        textStyle: TextStyle(color: AppColors.primaryColorDark1, fontSize: 14),
      ),
      value1: SelectedBuysellvalue,
      items1: BuysellList.toSet().toList(),
      value2: SelectedExchangevalue,
      items2: ExchangeList.toSet().toList(),
      onchanged1: (newvalue) {
        setState(() {
          SelectedBuysellvalue = newvalue ?? "";
          CalculateOrder();
        });
      },
      onchanged2: (newvalue) {
        setState(() {
          SelectedBuysellvalue = newvalue ?? "";
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
          setState(() {
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
          setState(() {
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

  Future<void> RemoveCompany(int index) async {
    if (AddmultipleMompanylist.length > 1) {
       await AddmultipleMompanylist.removeAt(index);
      // setState(() {});
    }
  }

  // void RemoveCompany(int index) {
  //   var removecomapny = AddmultipleMompanylist[index];

  //   if (AddmultipleMompanylist.isNotEmpty &&
  //       index >= 0 &&
  //       index < AddmultipleMompanylist.length) {
  //     AddmultipleMompanylist.removeAt(index);
  //      OrderPriceController.removeAt(index).dispose();
  //     ShareValueController.removeAt(index).dispose();
  //   }

  //   if (selected_company == removecomapny) {
  //     selected_company = '';
  //   }
  //   AddmultipleMompanylist.removeLast();

  //   setState(() {});
  // }

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
                itemBuilder: (context, index) {
                  final newcompanyadd = AddmultipleMompanylist[index];
                  final defitem1 = newcompanyadd.items1.toSet().toList();
                  final defitem2 = newcompanyadd.items2.toSet().toList();
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
                          SelectedBuysellvalue = newvalue ?? "";
                          newcompanyadd.value1 == SelectedBuysellvalue;
                          CalculateOrder();
                        });
                      },
                      onchanged2: (newvalue) {
                        setState(() {
                          SelectedExchangevalue = newvalue ?? "";
                          CalculateOrder();
                        });
                      },
                      TextmarginIntraday: newcompanyadd.TextmarginIntraday,
                      TextMarginDelivery: newcompanyadd.TextMarginDelivery,
                      customtextfield1: newcompanyadd.customtextfield1,
                      customtextfield2: newcompanyadd.customtextfield2,
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
