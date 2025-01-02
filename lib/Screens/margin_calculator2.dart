// import 'package:flutter/material.dart';
// import 'package:stock_average_calculator/Utils/app_color_const.dart';
// import 'package:stock_average_calculator/Utils/common_text.dart';
// import 'package:stock_average_calculator/Utils/custom_textformfield.dart';
// import 'package:textfield_search/textfield_search.dart';

// class MarginCalculator extends StatefulWidget {
//   const MarginCalculator({super.key});

//   @override
//   State<MarginCalculator> createState() => _MarginCalculatorState();
// }

// class _MarginCalculatorState extends State<MarginCalculator> {
//   final TextEditingController SearchController = TextEditingController();
//   final TextEditingController SearchController2 = TextEditingController();

//   final TextEditingController OrderPriceController = TextEditingController();
//   final TextEditingController ShareValueController = TextEditingController();

//   final TextEditingController OrderPriceController2 = TextEditingController();
//   final TextEditingController ShareValueController2 = TextEditingController();

//   final FocusNode focusNode1 = FocusNode();
//   final FocusNode focusNode2 = FocusNode();

//   final FocusNode focusNode3 = FocusNode();
//   final FocusNode focusNode4 = FocusNode();

//   @override
//   void initState() {
//       List<String> FilteredCompaniesList =
//           [...CompanyBSEvalue.keys, ...CompanyNSEvalue.keys].toSet().toList();
//       List<String> FilteredCompaniesList2 =
//           [...CompanyBSEvalue2.keys, ...CompanyNSEvalue2.keys].toSet().toList();
//     // FilteredCompaniesList = companies;
//     // FilteredCompaniesList2 = companies2;
//     SearchController.addListener(printSelectedcompany);
//     calculateOrder();

//     ShareValueController2.addListener(calculateOrder);
//     SearchController2.addListener(printSelectedcompany);
//     calculateOrder();
//     ShareValueController2.addListener(calculateOrder);

//     super.initState();
//   }

//   List<String> FilteredCompaniesList = [];
//   List<String> FilteredCompaniesList2 = [];

//   Map<String, double> CompanyBSEvalue = {
//     "Swiggy Ltd.": 594.80,
//     "Enviro infra Engineers Ltd.": 380.50,
//     "Tata Motors Ltd": 784.70
//   };
//   Map<String, double> CompanyNSEvalue = {
//     "Swiggy Ltd.": 596.35,
//     "Enviro infra Engineers Ltd.": 269.62,
//     "Tata Motors Ltd": 784.80
//   };
//   //
//   Map<String, double> CompanyBSEvalue2 = {
//     "Swiggy Ltd.": 594.80,
//     "Enviro infra Engineers Ltd.": 380.50,
//     "Tata Motors Ltd": 784.70
//   };
//   Map<String, double> CompanyNSEvalue2 = {
//     "Swiggy Ltd.": 596.35,
//     "Enviro infra Engineers Ltd.": 269.62,
//     "Tata Motors Ltd": 784.80
//   };
//   //
//   // List<String> companies = [
//   //   "Swiggy Ltd.",
//   //   "Enviro infra Engineers Ltd.",
//   //   "Tata Motors Ltd"
//   // ];
//   // List<String> companies2 = [
//   //   "Swiggy Ltd.",
//   //   "Enviro infra Engineers Ltd.",
//   //   "Tata Motors Ltd"
//   // ];

//   String selectedcompany = '';
//   String selectedBuysellList = '';

//   String selectedcompany2 = '';
//   String selectedBuysellList2 = '';

//   String? selectedBuysellvalue = 'BUY';
//   String? selectedExchangevalue = 'NSE';

//   String? selectedBuysellvalue2 = 'BUY';
//   String? selectedExchangevalue2 = 'NSE';

//   List<String> buysellList = ['BUY', 'SELL']; //Option
//   List<String> exchangeList = ['NSE', 'BSE']; //Option2

//   List<String> buysellList2 = ['BUY', 'SELL']; //Option
//   List<String> exchangeList2 = ['NSE', 'BSE']; //Option2

//   bool visiblelist=false;

//   double MarginDelivery = 0.0;
//   double MarginIntraday = 0.0;

//   double MarginDelivery2 = 0.0;
//   double MarginIntraday2 = 0.0;

//   double TotalMarginDelivery = 0.0;
//   double TotalMarginIntraday = 0.0;

//   void printSelectedcompany() {
//     double companyvalue = 0.0;
//     String selectedCompany = SearchController.text.trim();

//     if (selectedExchangevalue == 'NSE') {
//       if (CompanyNSEvalue.containsKey(selectedCompany)) {
//         companyvalue = CompanyNSEvalue[selectedCompany]!;
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
//   }

//   void calculateOrder() {
//     //margin and intraday calculation
//     String ordervalue = OrderPriceController.text;
//     String sharev = ShareValueController.text;

//     double parseToDouble(String input1) {
//       String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
//       return double.tryParse(cleanedInput1) ?? 0.0;
//     }

//     double OrderPrice = parseToDouble(ordervalue);
//     double Sharevalue = parseToDouble(sharev);

//     //calculation
//     double rounddelivery = OrderPrice * Sharevalue;

//     MarginDelivery = double.parse(rounddelivery.toStringAsFixed(3));

//     double roundIntraday = OrderPrice * Sharevalue * (20 / 100);

//     MarginIntraday = double.parse(roundIntraday.toStringAsFixed(2));

//     if (selectedBuysellvalue == 'BUY') {
//       selectedBuysellList = MarginDelivery.toStringAsFixed(2);
//     } else {
//       selectedBuysellList = '';
//       MarginDelivery = 0.0;
//     }
//     setState(() {});
//   }

//   // void filterCompanies(String query) {
//   //   setState(() {
//   //     FilteredCompaniesList = companies
//   //         .where(
//   //             (company) => company.toLowerCase().contains(query.toLowerCase()))
//   //         .toList();
//   //   });
//   // }

//   //company2
//   void printSelectedcompany2() {
//     double companyvalue2 = 0.0;
//     String selectedCompany2 = SearchController2.text.trim();

//     if (selectedExchangevalue2 == 'NSE') {
//       if (CompanyNSEvalue2.containsKey(selectedCompany2)) {
//         companyvalue2 = CompanyNSEvalue2[selectedCompany2]!;
//       } else {
//         print("Company not found: $selectedCompany2");
//       }
//     } else {
//       if (CompanyBSEvalue2.containsKey(selectedCompany2)) {
//         companyvalue2 = CompanyBSEvalue2[selectedCompany2]!;
//       } else {
//         print("Company not found: $selectedCompany2");
//       }
//     }
//     if (companyvalue2 != 0.0) {
//       OrderPriceController2.text = companyvalue2.toStringAsFixed(2);
//     } else {
//       OrderPriceController2.text = '';
//     }
//   }

//   void calculateOrder2() {
//     //margin and intraday calculation
//     String ordervalue2 = OrderPriceController2.text;
//     String sharev2 = ShareValueController2.text;

//     double parseToDouble(String input1) {
//       String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
//       return double.tryParse(cleanedInput1) ?? 0.0;
//     }

//     double RoundDelivery2 = parseToDouble(ordervalue2);
//     double ShareValue2 = parseToDouble(sharev2);

//     //calculation
//     double roundDelivery2 = RoundDelivery2 * ShareValue2;
//     MarginDelivery2 = double.parse(roundDelivery2.toStringAsFixed(3));

//     double roundIntraday2 = RoundDelivery2 * ShareValue2 * (20 / 100);

//     MarginIntraday2 = double.parse(roundIntraday2.toStringAsFixed(2));

//     if (selectedBuysellvalue2 == 'BUY') {
//       selectedBuysellList2 = MarginDelivery2.toStringAsFixed(2);
//     } else {
//       selectedBuysellList2 = '';
//       MarginDelivery2 = 0.0;
//     }

//     setState(() {});
//   }

//   void totalMargin() {
//     TotalMarginDelivery = MarginDelivery + MarginDelivery2;
//     TotalMarginIntraday = MarginIntraday + MarginIntraday2;

//     print("total margin delivery.......$TotalMarginDelivery");
//     print("total margin intraday.......$TotalMarginIntraday");
//   }

//   // void filterCompanies2(String query) {
//   //   setState(() {
//   //     FilteredCompaniesList2 = companies2
//   //         .where((company2) =>
//   //             company2.toLowerCase().contains(query.toLowerCase()))
//   //         .toList();
//   //   });
//   // }

//   @override
//   void dispose() {
//     focusNode1.dispose();
//     focusNode2.dispose();
//     focusNode3.dispose();
//     focusNode4.dispose();
//     OrderPriceController.dispose();
//     ShareValueController.dispose();
//     SearchController.dispose();

//     OrderPriceController2.dispose();
//     ShareValueController2.dispose();
//     SearchController2.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryBackgroundColor,
//       appBar: AppBar(
//         title: CommonText(
//           text: "Equity Margin Calculator1",
//           fontSize: 22,
//         ),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back_ios,
//               size: 16,
//               color: AppColors.primaryColorDark1,
//             )),
//         backgroundColor: AppColors.primaryBackgroundColor,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: AppColors.primaryColorLight2),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Company 1",
//                         style: TextStyle(
//                             fontFamily: 'Sora',
//                             fontWeight: FontWeight.w400,
//                             color: AppColors.primaryColorDark2,
//                             fontSize: 14),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           border:
//                               Border.all(color: AppColors.primaryColorLight2),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child:Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             CustomTextFormField(
//                                       keyboardType: TextInputType.emailAddress,
//                                       focusNode: FocusNode(),
//                                       controller: SearchController,
//                                       icon: Icons.search,
//                                       errorMessage: 'Company Not Found',
//                                       onClick: (){
//                                         setState(() {
//                                           visiblelist = true;
//                                         });
//                                       },
//                                       onchange: (value) {
//                                         setState(() {
//                                           SearchController.text = value;
//                                           printSelectedcompany2();
//                                           // SelectedCompany1(index,
//                                           //     SelectedExchangevalue ?? '0.0');
//                                           calculateOrder();
//                                         });
//                                          setState(() {
//                                           visiblelist = true;
//                                         });
//                                       },
//                                     ),
//                                    if(visiblelist)
//                                     Container(
//                                       height: 200,
//                                       child: ListView.builder(
//                                       itemCount: FilteredCompaniesList.length,
//                                       itemBuilder: (BuildContext context,int index){
//                                         return ListTile(
//                                           title: Text(FilteredCompaniesList[index]),
//                                           onTap: (){
//                                             SearchController.text=FilteredCompaniesList[index];
//                                             print("Selected company:${FilteredCompaniesList[index]}");
//                                             setState(() {
//                                               visiblelist = false;
//                                             });
//                                           },
//                                         );

//                                                                           }),
//                                     )
//                           ],
//                         ),

//                         // GestureDetector(
//                         //   child: TextFieldSearch(
//                         //     decoration:
//                         //         InputDecoration(border: InputBorder.none),
//                         //     initialList: FilteredCompaniesList,
//                         //     controller: SearchController,
//                         //     label: 'Search Company',
//                         //     textStyle: TextStyle(
//                         //         color: AppColors.primaryColorDark1,
//                         //         fontSize: 14),
//                         //   ),
//                         //   onTap: () {
//                         //     setState(() {
//                         //       filterCompanies(SearchController.text);
//                         //     });
//                         //   },
//                         // ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                 "BUY/SELL:",
//                                 style: TextStyle(
//                                     color: AppColors.primaryColorDark2,
//                                     fontFamily: 'Sora',
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 14),
//                               ),
//                               Container(
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: DropdownButtonFormField(
//                                     decoration: InputDecoration(
//                                         border: InputBorder.none),
//                                     value: selectedBuysellvalue,
//                                     items:
//                                         buysellList.map((String buysellList) {
//                                       return DropdownMenuItem<String>(
//                                           value: buysellList,
//                                           child: Center(
//                                             child: Text(
//                                               buysellList,
//                                               style: TextStyle(
//                                                   color: AppColors
//                                                       .primaryColorDark1,
//                                                   fontFamily: 'Sora',
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize: 14),
//                                             ),
//                                           ));
//                                     }).toList(),
//                                     onChanged: (newvalue) {
//                                       setState(() {
//                                         selectedBuysellvalue = newvalue!;
//                                       });

//                                       calculateOrder();
//                                     }),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Text(
//                                 "Exchange:",
//                                 style: TextStyle(
//                                   color: AppColors.primaryColorDark2,
//                                   fontSize: 14,
//                                   fontFamily: 'Sora',
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               Container(
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: DropdownButtonFormField(
//                                     alignment: AlignmentDirectional.center,
//                                     decoration: InputDecoration(
//                                         border: InputBorder.none),
//                                     value: selectedExchangevalue,
//                                     items: exchangeList
//                                         .map((String exchangeList) {
//                                       return DropdownMenuItem<String>(
//                                           alignment:
//                                               AlignmentDirectional.center,
//                                           value: exchangeList,
//                                           child: Text(
//                                             exchangeList,
//                                             style: TextStyle(
//                                                 fontFamily: 'Sora',
//                                                 fontWeight: FontWeight.w400,
//                                                 color:
//                                                     AppColors.primaryColorDark1,
//                                                 fontSize: 14),
//                                           ));
//                                     }).toList(),
//                                     onChanged: (newvalue2) {
//                                       setState(() {
//                                         selectedExchangevalue = newvalue2!;
//                                       });

//                                       printSelectedcompany();
//                                       calculateOrder();
//                                     }),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                 "Order Price:",
//                                 style: TextStyle(
//                                     fontFamily: 'Sora',
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 14),
//                               ),
//                               Container(
//                                 width: 150,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: CustomTextFormField(
//                                   autofocus: true,
//                                   keyboardType: TextInputType.number,
//                                   focusNode: focusNode1,
//                                   controller: OrderPriceController,
//                                   icon: Icons.currency_rupee,
//                                   errorMessage: 'Order Price',
//                                   onchange: (value) {
//                                     setState(() {
//                                       calculateOrder();
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Text(
//                                 "Share:",
//                                 style: TextStyle(
//                                     color: AppColors.primaryColorDark2,
//                                     fontFamily: 'Sora',
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 14),
//                               ),
//                               Container(
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: CustomTextFormField(
//                                   autofocus: true,
//                                   keyboardType: TextInputType.number,
//                                   focusNode: focusNode2,
//                                   controller: ShareValueController,
//                                   errorMessage: 'Invalid value Share',
//                                   onchange: (value) {
//                                     setState(() {
//                                       calculateOrder();
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "MARGIN DELIVERY:",
//                                 style: TextStyle(
//                                     fontFamily: 'Sora',
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 14),
//                               ),
//                               Container(
//                                 width: 150,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Center(
//                                     child: Text(selectedBuysellvalue == "SELL"
//                                         ? '0.00'
//                                         : selectedBuysellList)),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "MARGIN INTRADAY:",
//                                 style: TextStyle(
//                                     color: AppColors.primaryColorDark2,
//                                     fontFamily: 'Sora',
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 14),
//                               ),
//                               Container(
//                                 width: 150,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Center(
//                                     child: Text(
//                                   "$MarginIntraday",
//                                   style: TextStyle(
//                                     color: AppColors.primaryColorDark3,
//                                     fontSize: 14,
//                                     fontFamily: 'Sora',
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 )),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               //company2
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: AppColors.primaryColorLight2),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Company2",
//                         style: TextStyle(
//                             color: AppColors.primaryColorDark2,
//                             fontFamily: 'Sora',
//                             fontWeight: FontWeight.w400,
//                             fontSize: 14),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           border:
//                               Border.all(color: AppColors.primaryColorLight2),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: GestureDetector(
//                           child: TextFieldSearch(
//                             decoration:
//                                 InputDecoration(border: InputBorder.none),
//                             initialList: FilteredCompaniesList2,
//                             controller: SearchController2,
//                             label: 'Search Company',
//                             textStyle: TextStyle(
//                                 fontFamily: 'Sora',
//                                 fontWeight: FontWeight.w400,
//                                 color: AppColors.primaryColorDark1,
//                                 fontSize: 14),
//                           ),
//                           onTap: () {
//                             setState(() {
//                               // filterCompanies2(SearchController2.text);
//                             });
//                           },
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                 "BUY/SELL:",
//                                 style: TextStyle(
//                                     fontFamily: 'Sora',
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 14),
//                               ),
//                               Container(
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: DropdownButtonFormField(
//                                     decoration: InputDecoration(
//                                         border: InputBorder.none),
//                                     value: selectedBuysellvalue2,
//                                     items: buysellList2
//                                         .map((String buysellList2) {
//                                       return DropdownMenuItem<String>(
//                                           value: buysellList2,
//                                           child: Center(
//                                             child: Text(
//                                               buysellList2,
//                                               style: TextStyle(
//                                                   color: AppColors
//                                                       .primaryColorDark1,
//                                                   fontFamily: 'Sora',
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize: 14),
//                                             ),
//                                           ));
//                                     }).toList(),
//                                     onChanged: (newvalue) {
//                                       setState(() {
//                                         selectedBuysellvalue2 = newvalue!;
//                                       });

//                                       calculateOrder2();
//                                     }),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Text(
//                                 "Exchange:",
//                                 style: TextStyle(
//                                     fontFamily: 'Sora',
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 14),
//                               ),
//                               Container(
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: DropdownButtonFormField(
//                                     alignment: AlignmentDirectional.center,
//                                     decoration: InputDecoration(
//                                         border: InputBorder.none),
//                                     value: selectedExchangevalue2,
//                                     items: exchangeList2
//                                         .map((String exchangeList2) {
//                                       return DropdownMenuItem<String>(
//                                           alignment:
//                                               AlignmentDirectional.center,
//                                           value: exchangeList2,
//                                           child: Text(
//                                             exchangeList2,
//                                             style: TextStyle(
//                                                 fontFamily: 'Sora',
//                                                 fontWeight: FontWeight.w400,
//                                                 color:
//                                                     AppColors.primaryColorDark1,
//                                                 fontSize: 14),
//                                           ));
//                                     }).toList(),
//                                     onChanged: (newvalue2) {
//                                       setState(() {
//                                         selectedExchangevalue2 = newvalue2!;
//                                       });
//                                       printSelectedcompany2();
//                                       calculateOrder2();
//                                     }),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                 "Order Price:",
//                                 style: TextStyle(
//                                     fontFamily: 'Sora',
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 14),
//                               ),
//                               Container(
//                                 width: 150,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: CustomTextFormField(
//                                   autofocus: true,
//                                   keyboardType: TextInputType.number,
//                                   focusNode: focusNode3,
//                                   controller: OrderPriceController2,
//                                   icon: Icons.currency_rupee,
//                                   errorMessage: 'Order Price',
//                                   onchange: (value) {
//                                     setState(() {
//                                       calculateOrder2();
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Text(
//                                 "Share:",
//                                 style: TextStyle(
//                                     fontFamily: 'Sora',
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 14),
//                               ),
//                               Container(
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: CustomTextFormField(
//                                   autofocus: true,
//                                   keyboardType: TextInputType.number,
//                                   focusNode: focusNode4,
//                                   controller: ShareValueController2,
//                                   errorMessage: 'Invalid value Share',
//                                   onchange: (value) {
//                                     setState(() {
//                                       calculateOrder2();
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                 "MARGIN DELIVERY:",
//                                 style: TextStyle(
//                                     color: AppColors.primaryColorDark2,
//                                     fontFamily: 'Sora',
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 14),
//                               ),
//                               Container(
//                                 width: 150,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Center(
//                                     child: Text(selectedBuysellvalue2 == "SELL"
//                                         ? '0.00'
//                                         : selectedBuysellList2)),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Text(
//                                 "MARGIN INTRADAY:",
//                                 style: TextStyle(
//                                     fontFamily: 'Sora',
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 14),
//                               ),
//                               Container(
//                                 width: 150,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Center(
//                                     child: Text(
//                                   "$MarginIntraday2",
//                                   style: TextStyle(
//                                     color: AppColors.primaryColorDark3,
//                                     fontSize: 14,
//                                     fontFamily: 'Sora',
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 )),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Total",
//                 style:
//                     TextStyle(color: AppColors.primaryColorDark2, fontSize: 14),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     width: 150,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: AppColors.primaryColorLight2),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                         child: Text(
//                       "$TotalMarginDelivery",
//                       style: TextStyle(
//                         color: AppColors.primaryColorDark2,
//                         fontSize: 14,
//                         fontFamily: 'Sora',
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                       width: 150,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.primaryColorLight2),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                           child: Text(
//                         "$TotalMarginIntraday",
//                         style: TextStyle(
//                           color: AppColors.primaryColorDark2,
//                           fontSize: 14,
//                           fontFamily: 'Sora',
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ))),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),

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
//                               calculateOrder();
//                               totalMargin();
//                             });
//                           },
//                           child: Text(
//                             "Calculate",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontFamily: 'Sora',
//                               fontWeight: FontWeight.w600,
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
//                           OrderPriceController2.clear();
//                           ShareValueController2.clear();
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

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';
import 'package:stock_average_calculator/Utils/common_text.dart';
import 'package:stock_average_calculator/Utils/custom_textformfield.dart';
import 'package:textfield_search/textfield_search.dart';

class MarginCalculator extends StatefulWidget {
  const MarginCalculator({super.key});

  @override
  State<MarginCalculator> createState() => _MarginCalculatorState();
}

class _MarginCalculatorState extends State<MarginCalculator> {
  final TextEditingController SearchController = TextEditingController();
  final TextEditingController SearchController2 = TextEditingController();

  final TextEditingController OrderPriceController = TextEditingController();
  final TextEditingController ShareValueController = TextEditingController();

  final TextEditingController OrderPriceController2 = TextEditingController();
  final TextEditingController ShareValueController2 = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();

  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  @override
  void initState() {
    
    FilteredCompaniesList = companies;
    FilteredCompaniesList2 = companies2;

    SearchController.addListener(printSelectedcompany);
    calculateOrder();
    ShareValueController.addListener(calculateOrder);
    SearchController2.addListener(printSelectedcompany);
    calculateOrder();
    ShareValueController2.addListener(calculateOrder);

    super.initState();
  }

  List<String> FilteredCompaniesList = [];
  List<String> FilteredCompaniesList2 = [];

  Map<String, double> CompanyBSEvalue = {
    "Swiggy Ltd.": 594.80,
    "Enviro infra Engineers Ltd.": 380.50,
    "Tata Motors Ltd": 784.70
  };
  Map<String, double> CompanyNSEvalue = {
    "Swiggy Ltd.": 596.35,
    "Enviro infra Engineers Ltd.": 269.62,
    "Tata Motors Ltd": 784.80
  };
  //
  Map<String, double> CompanyBSEvalue2 = {
    "Swiggy Ltd.": 594.80,
    "Enviro infra Engineers Ltd.": 380.50,
    "Tata Motors Ltd": 784.70
  };
  Map<String, double> CompanyNSEvalue2 = {
    "Swiggy Ltd.": 596.35,
    "Enviro infra Engineers Ltd.": 269.62,
    "Tata Motors Ltd": 784.80
  };
  //
  List<String> companies = [
    "Swiggy Ltd.",
    "Enviro infra Engineers Ltd.",
    "Tata Motors Ltd"
  ];
  List<String> companies2 = [
    "Swiggy Ltd.",
    "Enviro infra Engineers Ltd.",
    "Tata Motors Ltd"
  ];

  String selectedcompany = '';
  String selectedBuysellList = '';

  String selectedcompany2 = '';
  String selectedBuysellList2 = '';

  String? selectedBuysellvalue = 'BUY';
  String? selectedExchangevalue = 'NSE';

  String? selectedBuysellvalue2 = 'BUY';
  String? selectedExchangevalue2 = 'NSE';

  List<String> buysellList = ['BUY', 'SELL']; //Option
  List<String> exchangeList = ['NSE', 'BSE']; //Option2

  List<String> buysellList2 = ['BUY', 'SELL']; //Option
  List<String> exchangeList2 = ['NSE', 'BSE']; //Option2

  bool visiblelist = false;

  double MarginDelivery = 0.0;
  double MarginIntraday = 0.0;

  double MarginDelivery2 = 0.0;
  double MarginIntraday2 = 0.0;

  double TotalMarginDelivery = 0.0;
  double TotalMarginIntraday = 0.0;

  void printSelectedcompany() {
    double companyvalue = 0.0;
    String selectedCompany = SearchController.text.trim();

    if (selectedExchangevalue == 'NSE') {
      if (CompanyNSEvalue.containsKey(selectedCompany)) {
        companyvalue = CompanyNSEvalue[selectedCompany]!;
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
      OrderPriceController.text = companyvalue.toStringAsFixed(2);
    } else {
      OrderPriceController.text = '';
    }
  }

  void calculateOrder() {
    //margin and intraday calculation
    String ordervalue = OrderPriceController.text;
    String sharev = ShareValueController.text;

    double parseToDouble(String input1) {
      String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
      return double.tryParse(cleanedInput1) ?? 0.0;
    }

    double OrderPrice = parseToDouble(ordervalue);
    double Sharevalue = parseToDouble(sharev);

    //calculation
    double rounddelivery = OrderPrice * Sharevalue;

    MarginDelivery = double.parse(rounddelivery.toStringAsFixed(3));

    double roundIntraday = OrderPrice * Sharevalue * (20 / 100);

    MarginIntraday = double.parse(roundIntraday.toStringAsFixed(2));

    if (selectedBuysellvalue == 'BUY') {
      selectedBuysellList = MarginDelivery.toStringAsFixed(2);
    } else {
      selectedBuysellList = '';
      MarginDelivery = 0.0;
    }
    setState(() {});
  }

  void filterCompanies(String query) {
    setState(() {
      FilteredCompaniesList = companies
          .where(
              (company) => company.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  //company2
  void printSelectedcompany2() {
    double companyvalue2 = 0.0;
    String selectedCompany2 = SearchController2.text.trim();

    if (selectedExchangevalue2 == 'NSE') {
      if (CompanyNSEvalue2.containsKey(selectedCompany2)) {
        companyvalue2 = CompanyNSEvalue2[selectedCompany2]!;
      } else {
        print("Company not found: $selectedCompany2");
      }
    } else {
      if (CompanyBSEvalue2.containsKey(selectedCompany2)) {
        companyvalue2 = CompanyBSEvalue2[selectedCompany2]!;
      } else {
        print("Company not found: $selectedCompany2");
      }
    }
    if (companyvalue2 != 0.0) {
      OrderPriceController2.text = companyvalue2.toStringAsFixed(2);
    } else {
      OrderPriceController2.text = '';
    }
  }

  void calculateOrder2() {
    //margin and intraday calculation
    String ordervalue2 = OrderPriceController2.text;
    String sharev2 = ShareValueController2.text;

    double parseToDouble(String input1) {
      String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
      return double.tryParse(cleanedInput1) ?? 0.0;
    }

    double RoundDelivery2 = parseToDouble(ordervalue2);
    double ShareValue2 = parseToDouble(sharev2);

    //calculation
    double roundDelivery2 = RoundDelivery2 * ShareValue2;
    MarginDelivery2 = double.parse(roundDelivery2.toStringAsFixed(3));

    double roundIntraday2 = RoundDelivery2 * ShareValue2 * (20 / 100);

    MarginIntraday2 = double.parse(roundIntraday2.toStringAsFixed(2));

    if (selectedBuysellvalue2 == 'BUY') {
      selectedBuysellList2 = MarginDelivery2.toStringAsFixed(2);
    } else {
      selectedBuysellList2 = '';
      MarginDelivery2 = 0.0;
    }

    setState(() {});
  }

  void totalMargin() {
    TotalMarginDelivery = MarginDelivery + MarginDelivery2;
    TotalMarginIntraday = MarginIntraday + MarginIntraday2;

    print("total margin delivery.......$TotalMarginDelivery");
    print("total margin intraday.......$TotalMarginIntraday");
  }

  void filterCompanies2(String query) {
    setState(() {
      FilteredCompaniesList2 = companies2
          .where((company2) =>
              company2.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        title: CommonText(
          text: "Equity Margin Calculator1",
          fontSize: 22,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: AppColors.primaryColorDark1,
            )),
        backgroundColor: AppColors.primaryBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
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
                        "Company 1",
                        // style: GoogleFonts.sora(
                        //   fontSize: 14,
                        //   fontWeight: FontWeight.w400,
                        //   color: AppColors.primaryColorDark2,
                        // ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.primaryColorLight2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     CustomTextFormField(
                            //               keyboardType: TextInputType.emailAddress,
                            //               focusNode: FocusNode(),
                            //               controller: SearchController,
                            //               icon: Icons.search,
                            //               errorMessage: 'Company Not Found',
                            //               onClick: (){
                            //                 setState(() {
                            //                   visiblelist = true;
                            //                 });
                            //               },
                            //               onchange: (value) {
                            //                 setState(() {
                            //                   SearchController.text = value;
                            //                   printSelectedcompany2();
                            //                   // SelectedCompany1(index,
                            //                   //     SelectedExchangevalue ?? '0.0');
                            //                   calculateOrder();
                            //                 });
                            //                  setState(() {
                            //                   visiblelist = true;
                            //                 });
                            //               },
                            //             ),
                            //            if(visiblelist)
                            //             Container(
                            //               height: 200,
                            //               child: ListView.builder(
                            //               itemCount: FilteredCompaniesList.length,
                            //               itemBuilder: (BuildContext context,int index){
                            //                 return ListTile(
                            //                   title: Text(FilteredCompaniesList[index]),
                            //                   onTap: (){
                            //                     SearchController.text=FilteredCompaniesList[index];
                            //                     print("Selected company:${FilteredCompaniesList[index]}");
                            //                     setState(() {
                            //                       visiblelist = false;
                            //                     });
                            //                   },
                            //                 );

                            //                                                   }),
                            //             )
                            //   ],
                            // ),

                            GestureDetector(
                          child: TextFieldSearch(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            initialList: FilteredCompaniesList,
                            controller: SearchController,
                            label: 'Search Company',
                            textStyle: TextStyle(
                                color: AppColors.primaryColorDark1,
                                fontSize: 14),
                          ),
                          onTap: () {
                            if (mounted) {setState(() {
                              filterCompanies(SearchController.text);
                            });}
                          },
                        ),
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
                                // style: GoogleFonts.sora(
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.w400,
                                //   color: AppColors.primaryColorDark2,
                                // ),
                              ),
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                    value: selectedBuysellvalue,
                                    items:
                                        buysellList.map((String buysellList) {
                                      return DropdownMenuItem<String>(
                                          value: buysellList,
                                          child: Center(
                                            child: Text(
                                              buysellList,
                                              // style: GoogleFonts.sora(
                                              //   fontSize: 14,
                                              //   fontWeight: FontWeight.w400,
                                              //   color:
                                              //       AppColors.primaryColorDark1,
                                              // ),
                                            ),
                                          ));
                                    }).toList(),
                                    onChanged: (newvalue) {
                                      setState(() {
                                        selectedBuysellvalue = newvalue!;
                                      });

                                      calculateOrder();
                                    }),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Exchange:",
                                // style: GoogleFonts.sora(
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.w400,
                                //   color: AppColors.primaryColorDark2,
                                // ),
                              ),
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButtonFormField(
                                    alignment: AlignmentDirectional.center,
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                    value: selectedExchangevalue,
                                    items:
                                        exchangeList.map((String exchangeList) {
                                      return DropdownMenuItem<String>(
                                          alignment:
                                              AlignmentDirectional.center,
                                          value: exchangeList,
                                          child: Text(
                                            exchangeList,
                                            // style: GoogleFonts.sora(
                                            //   fontSize: 14,
                                            //   fontWeight: FontWeight.w400,
                                            //   color:
                                            //       AppColors.primaryColorDark1,
                                            // ),
                                          ));
                                    }).toList(),
                                    onChanged: (newvalue2) {
                                      setState(() {
                                        selectedExchangevalue = newvalue2!;
                                      });

                                      printSelectedcompany();
                                      calculateOrder();
                                    }),
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
                                // style: GoogleFonts.sora(
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.w400,
                                //   color: AppColors.primaryColorDark2,
                                // ),
                              ),
                              Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: CustomTextFormField(
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  focusNode: focusNode1,
                                  controller: OrderPriceController,
                                  icon: Icons.currency_rupee,
                                  errorMessage: 'Order Price',
                                  onchange: (value) {
                                    setState(() {
                                      calculateOrder();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Share:",
                                // style: GoogleFonts.sora(
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.w400,
                                //   color: AppColors.primaryColorDark2,
                                // ),
                              ),
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: CustomTextFormField(
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  focusNode: focusNode2,
                                  controller: ShareValueController,
                                  errorMessage: 'Invalid value Share',
                                  onchange: (value) {
                                    setState(() {
                                      calculateOrder();
                                    });
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "MARGIN DELIVERY:",
                                // style: GoogleFonts.sora(
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.w400,
                                //   color: AppColors.primaryColorDark2,
                                // ),
                              ),
                              Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                  selectedBuysellvalue == "SELL"
                                      ? '0.00'
                                      : selectedBuysellList,
                                  // style: GoogleFonts.sora(
                                  //   fontSize: 14,
                                  //   fontWeight: FontWeight.w400,
                                  //   color: AppColors.primaryColorDark1,
                                  // ),
                                )),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "MARGIN INTRADAY:",
                                // style: GoogleFonts.sora(
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.w400,
                                //   color: AppColors.primaryColorDark2,
                                // ),
                              ),
                              Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                  "$MarginIntraday",
                                  // style: GoogleFonts.sora(
                                  //   fontSize: 14,
                                  //   fontWeight: FontWeight.w400,
                                  //   color: AppColors.primaryColorDark2,
                                  // ),
                                )),
                              ),
                            ],
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
              // company2
              Container(
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
                        "Company2",
                        // style: GoogleFonts.sora(
                        //   fontSize: 14,
                        //   fontWeight: FontWeight.w400,
                        //   color: AppColors.primaryColorDark2,
                        // ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.primaryColorLight2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          child: TextFieldSearch(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            initialList: FilteredCompaniesList2,
                            controller: SearchController2,
                            label: 'Search Company',
                            // textStyle: GoogleFonts.sora(
                            //   fontSize: 14,
                            //   fontWeight: FontWeight.w400,
                            //   color: AppColors.primaryColorDark1,
                            // ),
                          ),
                          onTap: () {
                           if (mounted) { setState(() {
                              filterCompanies2(SearchController2.text);
                            });}
                          },
                        ),
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
                                // style: GoogleFonts.sora(
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.w400,
                                //   color: AppColors.primaryColorDark2,
                                // ),
                              ),
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                    value: selectedBuysellvalue2,
                                    items:
                                        buysellList2.map((String buysellList2) {
                                      return DropdownMenuItem<String>(
                                          value: buysellList2,
                                          child: Center(
                                            child: Text(
                                              buysellList2,
                                              // style: GoogleFonts.sora(
                                              //   fontSize: 14,
                                              //   fontWeight: FontWeight.w400,
                                              //   color:
                                              //       AppColors.primaryColorDark1,
                                              // ),
                                            ),
                                          ));
                                    }).toList(),
                                    onChanged: (newvalue) {
                                      setState(() {
                                        selectedBuysellvalue2 = newvalue!;
                                      });

                                      calculateOrder2();
                                    }),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Exchange:",
                                // style: GoogleFonts.sora(
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.w400,
                                //   color: AppColors.primaryColorDark2,
                                // ),
                              ),
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButtonFormField(
                                    alignment: AlignmentDirectional.center,
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                    value: selectedExchangevalue2,
                                    items: exchangeList2
                                        .map((String exchangeList2) {
                                      return DropdownMenuItem<String>(
                                          alignment:
                                              AlignmentDirectional.center,
                                          value: exchangeList2,
                                          child: Text(
                                            exchangeList2,
                                            // style: GoogleFonts.sora(
                                            //   fontSize: 14,
                                            //   fontWeight: FontWeight.w400,
                                            //   color:
                                            //       AppColors.primaryColorDark1,
                                            // ),
                                          ));
                                    }).toList(),
                                    onChanged: (newvalue2) {
                                      setState(() {
                                        selectedExchangevalue2 = newvalue2!;
                                      });
                                      printSelectedcompany2();
                                      calculateOrder2();
                                    }),
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
                                // style: GoogleFonts.sora(
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.w400,
                                //   color: AppColors.primaryColorDark2,
                                // ),
                              ),
                              Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: CustomTextFormField(
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  focusNode: focusNode3,
                                  controller: OrderPriceController2,
                                  icon: Icons.currency_rupee,
                                  errorMessage: 'Order Price',
                                  onchange: (value) {
                                    setState(() {
                                      calculateOrder2();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Share:",
                                // style: GoogleFonts.sora(
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.w400,
                                //   color: AppColors.primaryColorDark2,
                                // ),
                              ),
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: CustomTextFormField(
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  focusNode: focusNode4,
                                  controller: ShareValueController2,
                                  errorMessage: 'Invalid value Share',
                                  onchange: (value) {
                                    setState(() {
                                      calculateOrder2();
                                    });
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "MARGIN DELIVERY:",
                                // style: GoogleFonts.sora(
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.w400,
                                //   color: AppColors.primaryColorDark2,
                                // ),
                              ),
                              Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(selectedBuysellvalue2 == "SELL"
                                        ? '0.00'
                                        : selectedBuysellList2)),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "MARGIN INTRADAY:",
                                // style: GoogleFonts.sora(
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.w400,
                                //   color: AppColors.primaryColorDark2,
                                // ),
                              ),
                              Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                  "$MarginIntraday2",
                                  // style: GoogleFonts.sora(
                                  //   fontSize: 14,
                                  //   fontWeight: FontWeight.w400,
                                  //   color: AppColors.primaryColorDark1,
                                  // ),
                                )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Total",
                // style: GoogleFonts.sora(
                //   fontSize: 14,
                //   fontWeight: FontWeight.w400,
                //   color: AppColors.primaryColorDark2,
                // ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColorLight2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      "$TotalMarginDelivery",
                      // style: GoogleFonts.sora(
                      //   fontSize: 14,
                      //   fontWeight: FontWeight.w400,
                      //   color: AppColors.primaryColorDark1,
                      // ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColorLight2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        "$TotalMarginIntraday",
                        // style: GoogleFonts.sora(
                        //   fontSize: 14,
                        //   fontWeight: FontWeight.w400,
                        //   color: AppColors.primaryColorDark1,
                        // ),
                      ))),
                ],
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
                          border:
                              Border.all(color: AppColors.primaryColorLight3),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryBackgroundColor),
                      child: TextButton(
                          clipBehavior: Clip.antiAlias,
                          onPressed: () {
                            setState(() {
                              calculateOrder();
                              totalMargin();
                            });
                          },
                          child: Text(
                            "Calculate",
                            // style: GoogleFonts.sora(
                            //   fontSize: 16,
                            //   fontWeight: FontWeight.w600,
                            // ),
                          ))),
                  Container(
                    width: 150,
                    child: CustomButton(
                        isLoading: false,
                        text: 'Cancel',
                        onPressed: () {
                          OrderPriceController.clear();
                          ShareValueController.clear();
                          OrderPriceController2.clear();
                          ShareValueController2.clear();
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
