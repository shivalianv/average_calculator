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
//   final TextEditingController searchController = TextEditingController();

//   final TextEditingController Order_PriceController = TextEditingController();
//   final TextEditingController Share_valueController = TextEditingController();

//   final FocusNode focusNode1 = FocusNode();
//   final FocusNode focusNode2 = FocusNode();

//   @override
//   void initState() {
//     filteredCompanies = companies;

//     searchController.addListener(print_selectedcompany);
//     calculate_Order();
//     Add_company();
//     super.initState();
//   }

//   List<String> filteredCompanies = [];

//   Map<String, double> Company_BSEvalue = {
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

//   List<Add_newCompany> addmultiple_companylist = [];
//   String selected_company = '';
//   String selected_buysell_list = '';

//   String? selected_buysellvalue = 'BUY';
//   String? selected_exchangevalue = 'NSE';

//   List<String> buysell_list = ['BUY', 'SELL']; //Option
//   List<String> exchange_list = ['NSE', 'BSE']; //Option2

//   double Margin_delivery = 0.0;
//   double Margin_intraday = 0.0;

//   void print_selectedcompany() {
//     //
//     double companyvalue = 0.0;
//     String selectedCompany = searchController.text.trim();

//     if (selected_exchangevalue == 'NSE') {
//       if (Company_NSEvalue.containsKey(selectedCompany)) {
//         companyvalue = Company_NSEvalue[selectedCompany]!;
//       } else {
//         print("Company not found: $selectedCompany");
//       }
//     } else {
//       if (Company_BSEvalue.containsKey(selectedCompany)) {
//         companyvalue = Company_BSEvalue[selectedCompany]!;
//       } else {
//         print("Company not found: $selectedCompany");
//       }
//     }
//     if (companyvalue != 0.0) {
//       Order_PriceController.text = companyvalue.toStringAsFixed(2);
//     } else {
//       Order_PriceController.text = '';
//     }
//     setState(() {});
//   }

//   void calculate_Order() {
//     //
//     String order_value = Order_PriceController.text;
//     String share_v = Share_valueController.text;

//     double parseToDouble(String input1) {
//       String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
//       return double.tryParse(cleanedInput1) ?? 0.0;
//     }

//     double Order_Price = parseToDouble(order_value);
//     double Share_value = parseToDouble(share_v);

//     double round_delivery = Order_Price * Share_value;
//     Margin_delivery = double.parse(round_delivery.toStringAsFixed(3));

//     double round_intraday = Order_Price * Share_value * (20 / 100);

//     Margin_intraday = double.parse(round_intraday.toStringAsFixed(2));

//     if (selected_buysellvalue == 'BUY') {
//       selected_buysell_list = Margin_delivery.toStringAsFixed(2);
//     } else {
//       selected_buysell_list = '';
//       Margin_delivery = 0.0;
//     }

//     setState(() {});
//   }

//   void remove_company(int index) {
//     setState(() {
//       addmultiple_companylist.removeAt(index);
//       if (selected_company == addmultiple_companylist[index]) {
//         selected_company = '';
//       }
//     });
//   }

//   // List<Widget> addmultiple_companylist = [];

//   void Add_company() {
//     setState(() {
//       addmultiple_companylist.add(Add_newCompany(
//         textfiledserch: TextFieldSearch(
//           decoration: InputDecoration(border: InputBorder.none),
//           initialList: filteredCompanies,
//           controller: searchController,
//           label: 'Search Company',
//           textStyle:
//               TextStyle(color: AppColors.primaryColorDark1, fontSize: 14),
//         ),
//         value1: selected_buysellvalue,
//         items1: buysell_list.toSet().toList(),
//         value2: selected_exchangevalue,
//         items2: exchange_list.toSet().toList(),
//         onchanged1: (newvalue) {
//           setState(() {
//             selected_buysellvalue = newvalue ?? "";
//             calculate_Order();
//           });
//         },
//         onchanged2: (newvalue) {
//           setState(() {
//             selected_buysellvalue = newvalue ?? "";
//             // if (selected_buysellvalue != null) {
//             //   selected_buysellvalue!;
//             // }
//           });
//         },
//         customtextfield1: CustomTextFormField(
//           autofocus: true,
//           keyboardType: TextInputType.number,
//           focusNode: focusNode1,
//           controller: Order_PriceController,
//           icon: Icons.currency_rupee,
//           errorMessage: 'Order Price',
//           onchange: (value) {
//             setState(() {
//               calculate_Order();
//             });
//           },
//         ),
//         customtextfield2: CustomTextFormField(
//           autofocus: true,
//           keyboardType: TextInputType.number,
//           focusNode: focusNode2,
//           controller: Share_valueController,
//           errorMessage: 'Invalid value Share',
//           onchange: (value) {
//             setState(() {
//               calculate_Order();
//             });
//           },
//         ),
//         textmargin_delivery:
//             selected_buysellvalue == "SELL" ? '0.0' : selected_buysell_list,
//         textmargin_intraday: "$Margin_intraday",
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
//               //       initialList: filteredCompanies,
//               //       controller: searchController,
//               //       label: 'Search Company',
//               //       textStyle: TextStyle(
//               //           color: AppColors.primaryColorDark1, fontSize: 14),
//               //     ),
//               //     value1: selected_buysellvalue,
//               //     items1: buysell_list,
//               //     value2: selected_exchangevalue,
//               //     items2: exchange_list,
//               //     customtextfield1: CustomTextFormField(
//               //       autofocus: true,
//               //       keyboardType: TextInputType.number,
//               //       focusNode: focusNode1,
//               //       controller: Order_PriceController,
//               //       icon: Icons.currency_rupee,
//               //       errorMessage: 'Order Price',
//               //       onchange: (value) {
//               //         setState(() {
//               //           calculate_Order();
//               //         });
//               //       },
//               //     ),
//               //     customtextfield2: CustomTextFormField(
//               //       autofocus: true,
//               //       keyboardType: TextInputType.number,
//               //       focusNode: focusNode2,
//               //       controller: Share_valueController,
//               //       errorMessage: 'Invalid value Share',
//               //       onchange: (value) {
//               //         setState(() {
//               //           calculate_Order();
//               //         });
//               //       },
//               //     ),
//               //     textmargin_delivery: selected_buysellvalue == "SELL"
//               //         ? '0.0'
//               //         : selected_buysell_list,
//               //     textmargin_intraday: "$Margin_intraday",
//               //     onchanged1: (newvalue) {
//               //       setState(() {
//               //         selected_buysellvalue != newvalue;
//               //         if (selected_buysellvalue != null) {
//               //           selected_buysellvalue!;
//               //         }
//               //       });
//               //     },
//               //     onchanged2: (newvalue) {
//               //       setState(() {
//               //         selected_buysellvalue != newvalue;
//               //         if (selected_buysellvalue != null) {
//               //           selected_buysellvalue!;
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
//                     itemCount: addmultiple_companylist.length,
//                     itemBuilder: (context, index) {
//                       final newcompanyadd = addmultiple_companylist[index];
//                       final defitem1 = newcompanyadd.items1.toSet().toList();
//                       final defitem2 = newcompanyadd.items2.toSet().toList();

//                       final value1 = defitem1.contains(
//                               newcompanyadd.value1) //selected_buysellvlaue
//                           ? newcompanyadd.value1
//                           : defitem1.isNotEmpty
//                               ? defitem1[0]
//                               : null;
//                       final value2 = defitem2.contains(
//                               newcompanyadd.value1) //selected_exchangevalue
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
//                             selected_buysellvalue = newvalue ?? "";
//                             newcompanyadd.value1 == selected_buysellvalue;
//                             calculate_Order();
//                           });
//                         },
//                         onchanged2: (newvalue) {
//                           setState(() {
//                             selected_exchangevalue = newvalue ?? "";
//                             calculate_Order();
//                           });
//                         },
//                         textmargin_intraday: newcompanyadd.textmargin_intraday,
//                         textmargin_delivery: newcompanyadd.textmargin_delivery,
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
//                               remove_company;
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
//               //               child: Center(child: Text("$Margin_delivery")),
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
//               //                 child: Center(child: Text("$Margin_intraday"))),
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
//                               calculate_Order();
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
//                           Order_PriceController.clear();
//                           Share_valueController.clear();
//                           // Margin_delivery = 0.0;
//                           // Margin_intraday = 0.0;
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
//   final String textmargin_delivery;
//   final String textmargin_intraday;

//   Function(dynamic)? onchanged1;
//   Function(dynamic)? onchanged2;

//   Add_newCompany({
//     super.key,
//     required this.textfiledserch,
//     required this.value2,
//     required this.textmargin_delivery,
//     required this.textmargin_intraday,
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
//   final TextEditingController searchController = TextEditingController();

//   List<String> companies = [
//     "Swiggy Ltd.",
//     "Enviro infra Engineers Ltd.",
//     "Tata Motors Ltd"
//   ];
//   String? selected_buysellvalue = 'BUY';
//   String? selected_exchangevalue = 'NSE';

//   List<String> filteredCompanies = [];

//   void filterCompanies(String query) {
//     setState(() {
//       filteredCompanies = companies
//           .where(
//               (company) => company.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//     final TextEditingController Order_PriceController = TextEditingController();
//   final TextEditingController Share_valueController = TextEditingController();

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
//                       filterCompanies(searchController.text);
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
//                             selected_buysellvalue != newvalue;
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
//                             selected_exchangevalue != newvalue;
//                             if (widget.onchanged2 != null) {
//                               widget.onchanged2!(newvalue);
//                             }
//                           });
//                           // setState(() {
//                           //   selected_exchangevalue != newvalue2;
//                           //   // selected_exchangevalue = newvalue2!;
//                           // });

//                           // print_selectedcompany();
//                           // calculate_Order();
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
//                   child: Center(child: Text(widget.textmargin_delivery ?? "")),
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
//                   child: Center(child: Text(widget.textmargin_intraday ?? "")),
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
  final TextEditingController searchController = TextEditingController();
  // TextFieldSearch? searchController1;

  final TextEditingController Order_PriceController = TextEditingController();
  final TextEditingController Share_valueController = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();

  @override
  void initState() {
     remove_company;
    filteredCompanies = companies;

    searchController.addListener(print_selectedcompany);
    calculate_Order();
    Add_company();
   
    super.initState();
  }

  List<String> filteredCompanies = [];

  Map<String, double> Company_BSEvalue = {
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

  List<Add_newCompany> addmultiple_companylist = [];
  String selected_company = '';
  String selected_buysell_list = '';

  String? selected_buysellvalue = 'BUY';
  String? selected_exchangevalue = 'NSE';

  List<String> buysell_list = ['BUY', 'SELL']; //Option
  List<String> exchange_list = ['NSE', 'BSE']; //Option2

  double Margin_delivery = 0.0;
  double Margin_intraday = 0.0;

  void print_selectedcompany() {
    //
    double companyvalue = 0.0;
    String selectedCompany = searchController.text.trim();

    if (selected_exchangevalue == 'NSE') {
      if (Company_NSEvalue.containsKey(selectedCompany)) {
        companyvalue = Company_NSEvalue[selectedCompany]!;
      } else {
        print("Company not found: $selectedCompany");
      }
    } else {
      if (Company_BSEvalue.containsKey(selectedCompany)) {
        companyvalue = Company_BSEvalue[selectedCompany]!;
      } else {
        print("Company not found: $selectedCompany");
      }
    }
    if (companyvalue != 0.0) {
      Order_PriceController.text = companyvalue.toStringAsFixed(2);
    } else {
      Order_PriceController.text = '';
    }
    setState(() {});
  }

  void calculate_Order() {
    //
    String order_value = Order_PriceController.text;
    String share_v = Share_valueController.text;

    double parseToDouble(String input1) {
      String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
      return double.tryParse(cleanedInput1) ?? 0.0;
    }

    double Order_Price = parseToDouble(order_value);
    double Share_value = parseToDouble(share_v);

    double round_delivery = Order_Price * Share_value;
    Margin_delivery = double.parse(round_delivery.toStringAsFixed(3));

    double round_intraday = Order_Price * Share_value * (20 / 100);

    Margin_intraday = double.parse(round_intraday.toStringAsFixed(2));

    if (selected_buysellvalue == 'BUY') {
      selected_buysell_list = Margin_delivery.toStringAsFixed(2);
    } else {
      selected_buysell_list = '';
      Margin_delivery = 0.0;
    }

    setState(() {});
  }

 

  void Add_company() {
    setState(() {
      addmultiple_companylist.add(Add_newCompany(
        textfiledserch: TextFieldSearch(
          decoration: InputDecoration(border: InputBorder.none),
          initialList: filteredCompanies,
          controller: searchController,
          label: 'Search Company',
          textStyle:
              TextStyle(color: AppColors.primaryColorDark1, fontSize: 14),
        ),
        value1: selected_buysellvalue,
        items1: buysell_list.toSet().toList(),
        value2: selected_exchangevalue,
        items2: exchange_list.toSet().toList(),
        onchanged1: (newvalue) {
          setState(() {
            selected_buysellvalue = newvalue ?? "";
            calculate_Order();
          });
        },
        onchanged2: (newvalue) {
          setState(() {
            selected_buysellvalue = newvalue ?? "";
          });
        },
        customtextfield1: CustomTextFormField(
          autofocus: true,
          keyboardType: TextInputType.number,
          focusNode: focusNode1,
          controller: Order_PriceController,
          icon: Icons.currency_rupee,
          errorMessage: 'Order Price',
          onchange: (value) {
            setState(() {
              calculate_Order();
            });
          },
        ),
        customtextfield2: CustomTextFormField(
          autofocus: true,
          keyboardType: TextInputType.number,
          focusNode: focusNode2,
          controller: Share_valueController,
          errorMessage: 'Invalid value Share',
          onchange: (value) {
            setState(() {
              calculate_Order();
            });
          },
        ),
        textmargin_delivery:
            selected_buysellvalue == "SELL" ? '0.0' : selected_buysell_list,
        textmargin_intraday: "$Margin_intraday",
      ));
    });
  }

   void remove_company(int index) {
    var removecomapny = addmultiple_companylist[index];
    if (addmultiple_companylist.length>1){//at least one lis item in listview builder 
      addmultiple_companylist.removeAt(index);
    }

      if (selected_company == addmultiple_companylist[index]) {
        selected_company = '';

      }
  
  }

  @override
  void dispose() {
    searchController.dispose();
    Share_valueController.dispose();
    Order_PriceController.dispose();

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
            flex: 2,
            child: ListView.builder(
                itemCount: addmultiple_companylist.length,
                itemBuilder: (context, index) {
                  final newcompanyadd = addmultiple_companylist[index];
                  final defitem1 = newcompanyadd.items1.toSet().toList();
                  final defitem2 = newcompanyadd.items2.toSet().toList();
            
                  final value1 = defitem1.contains(
                          newcompanyadd.value1) //selected_buysellvlaue
                      ? newcompanyadd.value1
                      : defitem1.isNotEmpty
                          ? defitem1[0]
                          : null;
                  final value2 = defitem2.contains(
                          newcompanyadd.value1) //selected_exchangevalue
                      ? newcompanyadd.value1
                      : defitem2.isNotEmpty
                          ? defitem2[0]
                          : null;
            
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Dismissible(
                      key: ValueKey(index),
                      background: Container(
                        color: AppColors.RedColor,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(Icons.delete, color: Colors.white),
                      ),
                      direction: DismissDirection.none,
                      onDismissed: (direction) {
                        remove_company(index);
                      },
                      child: Add_newCompany(
                        textfiledserch: newcompanyadd.textfiledserch,
                        items1: newcompanyadd.items1,
                        items2: newcompanyadd.items2,
                        value1: newcompanyadd.value1,
                        value2: newcompanyadd.value2,
                        onchanged1: (newvalue) {
                          setState(() {
                            selected_buysellvalue = newvalue ?? "";
                            newcompanyadd.value1 == selected_buysellvalue;
                            calculate_Order();
                          });
                        },
                        onchanged2: (newvalue) {
                          setState(() {
                            selected_exchangevalue = newvalue ?? "";
                            calculate_Order();
                          });
                        },
                        textmargin_intraday: newcompanyadd.textmargin_intraday,
                        textmargin_delivery: newcompanyadd.textmargin_delivery,
                        customtextfield1: newcompanyadd.customtextfield1,
                        customtextfield2: newcompanyadd.customtextfield2,
                      ),
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

                                remove_company;
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
                //               "MARGIN FOR DELIVERY:",
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
                //               child: Center(child: Text("$Margin_delivery")),
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
                //               "MARGIN FOR INTRADAY:",
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
                //                 child: Center(child: Text("$Margin_intraday"))),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
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
                                calculate_Order();
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
                            Order_PriceController.clear();
                            Share_valueController.clear();
                            // Margin_delivery = 0.0;
                            // Margin_intraday = 0.0;
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

class Add_newCompany extends StatefulWidget {
  // List initialList1;
  final TextFieldSearch textfiledserch;

  final CustomTextFormField customtextfield1;
  final CustomTextFormField customtextfield2;
  final List<String> items1;
  final List<String> items2;
  final dynamic value1;
  final dynamic value2;
  final String textmargin_delivery;
  final String textmargin_intraday;

  Function(dynamic)? onchanged1;
  Function(dynamic)? onchanged2;

  Add_newCompany({
    super.key,
    required this.textfiledserch,
    required this.value2,
    required this.textmargin_delivery,
    required this.textmargin_intraday,
    required this.items1,
    required this.value1,
    required this.onchanged1,
    required this.onchanged2,
    required this.items2,
    required this.customtextfield1,
    required this.customtextfield2,
  });

  @override
  State<Add_newCompany> createState() => _Add_newCompanyState();
}

class _Add_newCompanyState extends State<Add_newCompany> {
  TextEditingController searchController = TextEditingController();

  List<String> companies = [
    "Swiggy Ltd.",
    "Enviro infra Engineers Ltd.",
    "Tata Motors Ltd"
  ];
  String? selected_buysellvalue = 'BUY';
  String? selected_exchangevalue = 'NSE';

  List<String> filteredCompanies = [];

  void filterCompanies(String query) {
    setState(() {
      filteredCompanies = companies
          .where(
              (company) => company.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  final TextEditingController Order_PriceController = TextEditingController();
  final TextEditingController Share_valueController = TextEditingController();
  //  TextFieldSearch? textFieldSearch;

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    searchController.dispose();
    Share_valueController.dispose();
    Order_PriceController.dispose();


    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColorLight2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Company:",
              style:
                  TextStyle(color: AppColors.primaryColorDark2, fontSize: 14),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColorLight2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      filterCompanies(searchController.text);
                    });
                  },
                  child: widget.textfiledserch),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "BUY/SELL:",
                      style: TextStyle(
                          color: AppColors.primaryColorDark2, fontSize: 15),
                    ),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColorLight2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(border: InputBorder.none),
                        value: widget.value1,
                        items: widget.items1.map((String item) {
                          return DropdownMenuItem<String>(
                              value: item,
                              child: Center(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                      color: AppColors.primaryColorDark1,
                                      fontSize: 15),
                                ),
                              ));
                        }).toList(),
                        onChanged: (newvalue) {
                          setState(() {
                            selected_buysellvalue != newvalue;
                            if (widget.onchanged1 != null) {
                              widget.onchanged1!(newvalue);
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Exchange:",
                      style: TextStyle(
                          color: AppColors.primaryColorDark2, fontSize: 15),
                    ),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColorLight2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonFormField(
                        alignment: AlignmentDirectional.center,
                        decoration: InputDecoration(border: InputBorder.none),
                        value: widget.value2,
                        items: widget.items2.map((String item) {
                          return DropdownMenuItem<String>(
                              alignment: AlignmentDirectional.center,
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    color: AppColors.primaryColorDark1,
                                    fontSize: 15),
                              ));
                        }).toList(),
                        onChanged: (newvalue) {
                          setState(() {
                            selected_exchangevalue != newvalue;
                            if (widget.onchanged2 != null) {
                              widget.onchanged2!(newvalue);
                            }
                          });
                          // setState(() {
                          //   selected_exchangevalue != newvalue2;
                          //   // selected_exchangevalue = newvalue2!;
                          // });

                          // print_selectedcompany();
                          // calculate_Order();
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Order Price:",
                      style: TextStyle(
                          color: AppColors.primaryColorDark2, fontSize: 15),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColorLight2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: widget.customtextfield1,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Share:",
                      style: TextStyle(
                          color: AppColors.primaryColorDark2, fontSize: 15),
                    ),
                    Container(
                        width: 150,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.primaryColorLight2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: widget.customtextfield2),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "MARGIN FOR DELIVERY:",
                  style: TextStyle(
                      color: AppColors.primaryColorDark2, fontSize: 15),
                ),
                Container(
                  width: 310,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColorLight2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text(widget.textmargin_delivery ?? "")),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "MARGIN FOR INTRADAY:",
                  style: TextStyle(
                      color: AppColors.primaryColorDark2, fontSize: 15),
                ),
                Container(
                  width: 310,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColorLight2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text(widget.textmargin_intraday ?? "")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
