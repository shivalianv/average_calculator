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
//   final TextEditingController searchController2 = TextEditingController();

//   final TextEditingController Order_PriceController = TextEditingController();
//   final TextEditingController Share_valueController = TextEditingController();

//   final TextEditingController Order_PriceController2 = TextEditingController();
//   final TextEditingController Share_valueController2 = TextEditingController();

//   final FocusNode focusNode1 = FocusNode();
//   final FocusNode focusNode2 = FocusNode();

//   final FocusNode focusNode3 = FocusNode();
//   final FocusNode focusNode4 = FocusNode();

//   @override
//   void initState() {
//     filteredCompanies = companies;
//     filteredCompanies2 = companies2;
//     searchController.addListener(print_selectedcompany);
//     calculate_Order();

//     Share_valueController2.addListener(calculate_Order);
//     searchController2.addListener(print_selectedcompany);
//     calculate_Order();
//     Share_valueController2.addListener(calculate_Order);

//     super.initState();
//   }

//   List<String> filteredCompanies = [];
//   List<String> filteredCompanies2 = [];

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
//   //
//   Map<String, double> Company_BSEvalue2 = {
//     "Swiggy Ltd.": 594.80,
//     "Enviro infra Engineers Ltd.": 380.50,
//     "Tata Motors Ltd": 784.70
//   };
//   Map<String, double> Company_NSEvalue2 = {
//     "Swiggy Ltd.": 596.35,
//     "Enviro infra Engineers Ltd.": 269.62,
//     "Tata Motors Ltd": 784.80
//   };
//   //
//   List<String> companies = [
//     "Swiggy Ltd.",
//     "Enviro infra Engineers Ltd.",
//     "Tata Motors Ltd"
//   ];
//   List<String> companies2 = [
//     "Swiggy Ltd.",
//     "Enviro infra Engineers Ltd.",
//     "Tata Motors Ltd"
//   ];

//   String selected_company = '';
//   String selected_buysell_list = '';

//   String selected_company2 = '';
//   String selected_buysell_list2 = '';

//   String? selected_buysellvalue = 'BUY';
//   String? selected_exchangevalue = 'NSE';

//   String? selected_buysellvalue2 = 'BUY';
//   String? selected_exchangevalue2 = 'NSE';

//   List<String> buysell_list = ['BUY', 'SELL'];//Option
//   List<String> exchange_list = ['NSE', 'BSE'];//Option2

//   List<String> buysell_list2 = ['BUY', 'SELL'];//Option
//   List<String> exchange_list2 = ['NSE', 'BSE'];//Option2

//   double Margin_delivery = 0.0;
//   double Margin_intraday = 0.0;

//   double Margin_delivery2 = 0.0;
//   double Margin_intraday2 = 0.0;

//   void print_selectedcompany() {
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
//   }

//   void calculate_Order() {
//     //margin and intraday calculation
//     String order_value = Order_PriceController.text;
//     String share_v = Share_valueController.text;

//     double parseToDouble(String input1) {
//       String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
//       return double.tryParse(cleanedInput1) ?? 0.0;
//     }

//     double Order_Price = parseToDouble(order_value);
//     double Share_value = parseToDouble(share_v);

//     //calculation
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

//   void filterCompanies(String query) {
//     setState(() {
//       filteredCompanies = companies
//           .where(
//               (company) => company.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }
//   //company2
//   void print_selectedcompany2() {
//     double companyvalue2 = 0.0;
//     String selectedCompany2 = searchController2.text.trim();

//     if (selected_exchangevalue2 == 'NSE') {
//       if (Company_NSEvalue2.containsKey(selectedCompany2)) {
//         companyvalue2 = Company_NSEvalue2[selectedCompany2]!;
//       } else {
//         print("Company not found: $selectedCompany2");
//       }
//     } else {
//       if (Company_BSEvalue2.containsKey(selectedCompany2)) {
//         companyvalue2 = Company_BSEvalue2[selectedCompany2]!;
//       } else {
//         print("Company not found: $selectedCompany2");
//       }
//     }
//     if (companyvalue2 != 0.0) {
//       Order_PriceController2.text = companyvalue2.toStringAsFixed(2);
//     } else {
//       Order_PriceController2.text = '';
//     }
//   }

//   void calculate_Order2() {
//     //margin and intraday calculation
//     String order_value2 = Order_PriceController2.text;
//     String share_v2 = Share_valueController2.text;

//     double parseToDouble(String input1) {
//       String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
//       return double.tryParse(cleanedInput1) ?? 0.0;
//     }

//     double Order_Price2 = parseToDouble(order_value2);
//     double Share_value2 = parseToDouble(share_v2);

//     //calculation
//     double round_delivery2 = Order_Price2 * Share_value2;
//     Margin_delivery2 = double.parse(round_delivery2.toStringAsFixed(3));

//     double round_intraday2 = Order_Price2 * Share_value2 * (20 / 100);

//     Margin_intraday2 = double.parse(round_intraday2.toStringAsFixed(2));

//     if (selected_buysellvalue2 == 'BUY') {
//       selected_buysell_list2 = Margin_delivery2.toStringAsFixed(2);
//     } else {
//       selected_buysell_list2 = '';
//       Margin_delivery2 = 0.0;
//     }
//     setState(() {});
//   }

//   void filterCompanies2(String query) {
//     setState(() {
//       filteredCompanies2 = companies2
//           .where(
//               (company2) => company2.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   void dispose() {
//     focusNode1.dispose();
//     focusNode2.dispose();
//     focusNode3.dispose();
//     focusNode4.dispose();
//     Order_PriceController.dispose();
//     Share_valueController.dispose();
//     searchController.dispose();

//     Order_PriceController2.dispose();
//     Share_valueController2.dispose();
//     searchController2.dispose();
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
//               Container(
//                 width: 350,
//                 height: 450,
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
//                         "Company1:",
//                         style: TextStyle(
//                             color: AppColors.primaryColorDark2, fontSize: 14),
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
//                             initialList: filteredCompanies,
//                             controller: searchController,
//                             label: 'Search Company',
//                             textStyle:  TextStyle(
//                             color: AppColors.primaryColorDark1, fontSize: 14),
//                           ),
//                           onTap: () {
//                             setState(() {
//                               filterCompanies(searchController.text);
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
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 15),
//                               ),
//                               Container(
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
                                // child: DropdownButtonFormField(
                                //     decoration: InputDecoration(
                                //         border: InputBorder.none),
                                //     value: selected_buysellvalue,
                                //     items: buysell_list.map((String buysell_list) {
                                //       return DropdownMenuItem<String>(
                                //           value: buysell_list,
                                //           child: Center(
                                //             child: Text(
                                //               buysell_list,
                                //               style: TextStyle(
                                //                   color: AppColors
                                //                       .primaryColorDark1,
                                //                   fontSize: 15),
                                //             ),
                                //           ));
                                //     }).toList(),
                                //     onChanged: (newvalue) {
                                //       setState(() {
                                //         selected_buysellvalue = newvalue!;
                                //       });

                                //       calculate_Order();
                                //     }),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Text(
//                                 "Exchange:",
//                                 style: TextStyle(
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 15),
//                               ),
//                               Container(
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
                                // child: DropdownButtonFormField(
                                //     alignment: AlignmentDirectional.center,
                                //     decoration: InputDecoration(
                                //         border: InputBorder.none),
                                //     value: selected_exchangevalue,
                                //     items: exchange_list.map((String exchange_list) {
                                //       return DropdownMenuItem<String>(
                                //           alignment:
                                //               AlignmentDirectional.center,
                                //           value: exchange_list,
                                //           child: Text(
                                //             exchange_list,
                                //             style: TextStyle(
                                //                 color:
                                //                     AppColors.primaryColorDark1,
                                //                 fontSize: 15),
                                //           ));
                                //     }).toList(),
                                //     onChanged: (newvalue2) {
                                //       setState(() {
                                //         selected_exchangevalue = newvalue2!;
                                //       });

                                //       print_selectedcompany();
                                //       calculate_Order();
                                //     }),
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
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 15),
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
//                                   controller: Order_PriceController,
//                                   icon: Icons.currency_rupee,
//                                   errorMessage: 'Order Price',
//                                   onchange: (value) {
//                                     setState(() {
//                                       calculate_Order();
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
//                                     fontSize: 15),
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
//                                   controller: Share_valueController,
//                                   errorMessage: 'Invalid value Share',
//                                   onchange: (value) {
//                                     setState(() {
//                                       calculate_Order();
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
//                                 "MARGIN FOR DELIVERY:",
//                                 style: TextStyle(
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 15),
//                               ),
//                               Container(
//                                 width: 170,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Center(
//                                     child: Text(selected_buysellvalue == "SELL"
//                                         ? '0.00'
//                                         : selected_buysell_list)),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 "MARGIN FOR INTRADAY:",
//                                 style: TextStyle(
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 15),
//                               ),
//                               Container(
//                                 width: 170,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Center(child: Text("$Margin_intraday")),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Total",
//                                 style: TextStyle(
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 15),
//                               ),
//                               Container(
//                                 width: 130,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Center(child: Text("$Margin_delivery")),
//                               ),
//                               SizedBox(
//                                 height: 30,
//                               ),
//                               Container(
//                                   width: 130,
//                                   height: 50,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: AppColors.primaryColorLight2),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child:
//                                       Center(child: Text("$Margin_intraday"))),
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
//                 width: 350,
//                 height: 450,
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
//                         "Company2:",
//                         style: TextStyle(
//                             color: AppColors.primaryColorDark2, fontSize: 14),
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
//                             initialList: filteredCompanies2,
//                             controller: searchController2,
//                             label: 'Search Company',
//                             textStyle:  TextStyle(
//                             color: AppColors.primaryColorDark1, fontSize: 14),
//                           ),
//                           onTap: () {
//                             setState(() {
//                               filterCompanies2(searchController2.text);
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
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 15),
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
//                                     value: selected_buysellvalue2,
//                                     items: buysell_list2.map((String buysell_list2) {
//                                       return DropdownMenuItem<String>(
//                                           value: buysell_list2,
//                                           child: Center(
//                                             child: Text(
//                                               buysell_list2,
//                                               style: TextStyle(
//                                                   color: AppColors
//                                                       .primaryColorDark1,
//                                                   fontSize: 15),
//                                             ),
//                                           ));
//                                     }).toList(),
//                                     onChanged: (newvalue) {
//                                       setState(() {
//                                         selected_buysellvalue2 = newvalue!;
//                                       });

//                                       calculate_Order2();
//                                     }),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Text(
//                                 "Exchange:",
//                                 style: TextStyle(
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 15),
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
//                                     value: selected_exchangevalue2,
//                                     items: exchange_list2.map((String exchange_list2) {
//                                       return DropdownMenuItem<String>(
//                                           alignment:
//                                               AlignmentDirectional.center,
//                                           value: exchange_list2,
//                                           child: Text(
//                                             exchange_list2,
//                                             style: TextStyle(
//                                                 color:
//                                                     AppColors.primaryColorDark1,
//                                                 fontSize: 15),
//                                           ));
//                                     }).toList(),
//                                     onChanged: (newvalue2) {
//                                       setState(() {
//                                         selected_exchangevalue2 = newvalue2!;
//                                       });

//                                       print_selectedcompany2();
//                                       calculate_Order2();
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
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 15),
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
//                                   controller: Order_PriceController2,
//                                   icon: Icons.currency_rupee,
//                                   errorMessage: 'Order Price',
//                                   onchange: (value) {
//                                     setState(() {
//                                       calculate_Order2();
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
//                                     fontSize: 15),
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
//                                   controller: Share_valueController2,
//                                   errorMessage: 'Invalid value Share',
//                                   onchange: (value) {
//                                     setState(() {
//                                       calculate_Order2();
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
//                                 "MARGIN FOR DELIVERY:",
//                                 style: TextStyle(
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 15),
//                               ),
//                               Container(
//                                 width: 170,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Center(
//                                     child: Text(selected_buysellvalue2 == "SELL"
//                                         ? '0.00'
//                                         : selected_buysell_list2)),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 "MARGIN FOR INTRADAY:",
//                                 style: TextStyle(
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 15),
//                               ),
//                               Container(
//                                 width: 170,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Center(child: Text("$Margin_intraday2")),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Total",
//                                 style: TextStyle(
//                                     color: AppColors.primaryColorDark2,
//                                     fontSize: 15),
//                               ),
//                               Container(
//                                 width: 130,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.primaryColorLight2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Center(child: Text("$Margin_delivery2")),
//                               ),
//                               SizedBox(
//                                 height: 30,
//                               ),
//                               Container(
//                                   width: 130,
//                                   height: 50,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: AppColors.primaryColorLight2),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child:
//                                       Center(child: Text("$Margin_intraday2"))),
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
//                           Order_PriceController2.clear();
//                           Share_valueController2.clear();
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
