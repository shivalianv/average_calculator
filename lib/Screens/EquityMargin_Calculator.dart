// import 'package:flutter/material.dart';
// import 'package:hugeicons/hugeicons.dart';
// // import 'package:google_fonts/google_fonts.dart';
// import 'package:stock_average_calculator/Screens/EquityMargin_Model.dart';
// import 'package:stock_average_calculator/Utils/app_color_const.dart';
// import 'package:stock_average_calculator/Utils/common_text.dart';
// import 'package:stock_average_calculator/Utils/custom_textformfield.dart';

// class EquityMargincalculator extends StatefulWidget {
//   const EquityMargincalculator({super.key});

//   @override
//   State<EquityMargincalculator> createState() => _EquityMargincalculatorState();
// }

// class _EquityMargincalculatorState extends State<EquityMargincalculator> {
//   List<TextEditingController> SearchController = [];
//   List<TextEditingController> OrderPriceController = [];
//   List<TextEditingController> ShareValueController = [];


//   List<FocusNode> searchfocusNodes = [];
//   List<FocusNode> orderfocusNodes = [];
//   List<FocusNode> sharefocusNodes = [];
//   List<FocusNode> selectbuy_sellfocusNodes = [];
//   List<FocusNode> selectBSE_NSEvaluenode = [];

//   List<NewCompanyModel> AddmultipleCompanylist = [];

//   bool visiblelist = false;

//   Map<String, double> CompanyBSEvalue = <String, double>{
//     "Swiggy Ltd.": 594.80,
//     "Enviro infra Engineers Ltd.": 380.50,
//     "Adani Enterprises Ltd.": 2593.45,
//     "NTPC green Energy Ltd.": 128.50,
//     "Tata Motors Ltd.": 784.70
//   };

//   Map<String, double> CompanyNSEvalue = <String, double>{
//     "Swiggy Ltd.": 596.35,
//     "Enviro infra Engineers Ltd.": 269.62,
//     "Adani Enterprises Ltd.": 2592.35,
//     "NTPC green Energy Ltd.": 128.35,
//     "Tata Motors Ltd.": 784.80
//   };

//   String? Selectedcompany = '';
//   String? SelectedBuysellvalue = 'BUY';
//   String? SelectedExchangevalue = 'NSE';
//   double MarginDelivery = 0.0;
//   double MarginIntraday = 0.0;
//   double TotalMarginDelivery = 0.0;
//   double TotalMarginIntraday = 0.0;

//   @override
//   void initState() {
//       SearchController.add(TextEditingController());
//     OrderPriceController.add(TextEditingController());
//     ShareValueController.add(TextEditingController());
//     searchfocusNodes.add(FocusNode());
//     orderfocusNodes.add(FocusNode());
//     sharefocusNodes.add(FocusNode());

//  AddmultipleCompanylist.add(NewCompanyModel(
//           customtextseach: CustomTextFormField(
//             focusNode: searchfocusNodes.last,
//             keyboardType: TextInputType.emailAddress,
//             controller: SearchController.last,
//           ),
         
//           customtextfield1: CustomTextFormField(
//             focusNode: orderfocusNodes.last,
//             keyboardType: TextInputType.emailAddress,
//             controller: OrderPriceController.last,
//           ),
//           customtextfield2: CustomTextFormField(
//             focusNode:sharefocusNodes.last,
//             keyboardType: TextInputType.emailAddress,
//             controller: ShareValueController.last,
//           ),
//           textMarginDelivery: '0',
//           textMarginIntraday: '0',
//           deleteOnTap: () => deleteCompany(0)));

//     setState(() {
//       List<String> FilteredCompaniesList =
//           [...CompanyBSEvalue.keys, ...CompanyNSEvalue.keys].toSet().toList();
//       super.initState();
//       print("FilteredCompaniesList.........$FilteredCompaniesList");
//     });

//     SearchController = List.generate(
//         AddmultipleCompanylist.length, (index) => TextEditingController());
//     OrderPriceController = List.generate(
//         AddmultipleCompanylist.length, (index) => TextEditingController());
//     ShareValueController = List.generate(
//         AddmultipleCompanylist.length, (index) => TextEditingController());
//     // focusNodes =
//     //     List.generate(AddmultipleCompanylist.length, (index) => FocusNode());
//     sharefocusNodes =
//         List.generate(AddmultipleCompanylist.length, (index) => FocusNode());
//     orderfocusNodes =
//         List.generate(AddmultipleCompanylist.length, (index) => FocusNode());
//     searchfocusNodes =
//         List.generate(AddmultipleCompanylist.length, (index) => FocusNode());
//     selectBSE_NSEvaluenode =
//         List.generate(AddmultipleCompanylist.length, (index) => FocusNode());
//     selectbuy_sellfocusNodes =
//         List.generate(AddmultipleCompanylist.length, (index) => FocusNode());

//     // if (AddmultipleCompanylist.isEmpty) {
//     //   AddmultipleCompanylist.add(NewCompanyModel(
//     //       customtextseach: CustomTextFormField(
//     //         focusNode: FocusNode(),
//     //         keyboardType: TextInputType.emailAddress,
//     //         controller: TextEditingController(),
//     //       ),
//     //       // textfiledserch: TextFieldSearch(
//     //       //     label: 'Search Company', controller: TextEditingController()),
//     //       customtextfield1: CustomTextFormField(
//     //         focusNode: FocusNode(),
//     //         keyboardType: TextInputType.emailAddress,
//     //         controller: TextEditingController(),
//     //       ),
//     //       customtextfield2: CustomTextFormField(
//     //         focusNode: FocusNode(),
//     //         keyboardType: TextInputType.emailAddress,
//     //         controller: TextEditingController(),
//     //       ),
//     //       textMarginDelivery: '1000',
//     //       textMarginIntraday: '2000',
//     //       deleteOnTap: () => deleteCompany(0)));
//     // }
  
//     // focusNodes.add(FocusNode());
//     print("AddmultipleCompanylist......${AddmultipleCompanylist}");
//     // for (int i = 0; i < AddmultipleCompanylist.length; i++) {
//     //   SearchController.add(TextEditingController());
//     //   OrderPriceController.add(TextEditingController());
//     //   ShareValueController.add(TextEditingController());
//     //   focusNodes.add(FocusNode());
//     // }
//   }

//   Future<void> AddCompany(int index) async {
//     setState(() {
//       AddmultipleCompanylist.add(NewCompanyModel(
//           customtextseach: CustomTextFormField(
//             // focusNode: focusNodes.last,
//             focusNode: searchfocusNodes.last,
//             keyboardType: TextInputType.emailAddress,
//             controller: SearchController.last,
//           ),
//           customtextfield1: CustomTextFormField(
//             // focusNode: focusNodes.last,
//             focusNode: orderfocusNodes.last,
//             keyboardType: TextInputType.emailAddress,
//             controller: OrderPriceController.last,
//           ),
//           customtextfield2: CustomTextFormField(
//             // focusNode: focusNodes.last,
//             focusNode: sharefocusNodes.last,
//             keyboardType: TextInputType.emailAddress,
//             controller: ShareValueController.last,
//           ),
//           textMarginDelivery: '0',
//           textMarginIntraday: '0',
//           deleteOnTap: () => deleteCompany(AddmultipleCompanylist.length - 1)));
//       SearchController.add(TextEditingController());
//       OrderPriceController.add(TextEditingController());
//       ShareValueController.add(TextEditingController());
//       // focusNodes.add(FocusNode());
//       searchfocusNodes.add(FocusNode());
//       orderfocusNodes.add(FocusNode());
//       sharefocusNodes.add(FocusNode());
//       print("Add company.........$AddmultipleCompanylist");
//     });
//   }

//   Future<void> SelectedCompany1(int index, String SelectedExchangevalue) async {
//     String selectedCompany = SearchController[index].text.trim();
//     print("selected company#####$selectedCompany");
//     setState(() {
//       if (SelectedExchangevalue[index] == 'NSE') {
//         if (SelectedBuysellvalue == "BUY") {
//           OrderPriceController[index].text =
//               CompanyNSEvalue[selectedCompany]?.toString() ?? '0.0';
//         } else if (SelectedBuysellvalue == "SELL") {
//           OrderPriceController[index].text = '0.0';
//         }
//       } else if (SelectedExchangevalue[index] == 'BSE') {
//         if (SelectedBuysellvalue == "BUY") {
//           OrderPriceController[index].text =
//               CompanyBSEvalue[selectedCompany]?.toString() ?? '0.0';
//         } else if (SelectedBuysellvalue == "SELL") {
//           OrderPriceController[index].text = '0.0';
//         }
//       }
//     });
//   }

//   Future<void> CalculateOrder() async {
//     if (OrderPriceController.isEmpty || ShareValueController.isEmpty) {
//       print("Error: OrderPriceController or ShareValueController is empty");
//       return;
//     }

//     List<TextEditingController> Ordervalue = OrderPriceController;
//     List<TextEditingController> Sharevalue = ShareValueController;

//     List<double> MarginDeliveryList = [];
//     List<double> MarginIntradayList = [];

//     double parseToDouble(String input) {
//       String cleanedInput = input.replaceAll(RegExp(r'[^0-9.]'), '');
//       return double.tryParse(cleanedInput) ?? 0.0;
//     }

//     for (int i = 0; i < Ordervalue.length; i++) {
//       double OrderPrice = parseToDouble(Ordervalue[i].text);
//       double ShareValue = parseToDouble(Sharevalue[i].text);

//       double RoundDelivery = OrderPrice * ShareValue;
//       MarginDelivery = double.parse(RoundDelivery.toStringAsFixed(2));
//       MarginDeliveryList.add(MarginDelivery);

//       double RoundIntraday = OrderPrice * ShareValue * (20 / 100);
//       MarginIntraday = double.parse(RoundIntraday.toStringAsFixed(2));

//       MarginIntradayList.add(MarginIntraday);
//     }
//     double roundTotalDelivery =
//         MarginDeliveryList.fold(0.0, (sum, Element) => sum + Element);
//     TotalMarginDelivery = double.parse(roundTotalDelivery.toStringAsFixed(2));

//     double roundTotalIntraday =
//         MarginIntradayList.fold(0.0, (sum, Element) => sum + Element);
//     TotalMarginIntraday = double.parse(roundTotalIntraday.toStringAsFixed(2));

//     print("Total Margin Delivery:::::::::::$TotalMarginDelivery");
//     print("Total Margin Intraday:::::::::::$TotalMarginIntraday");

//     setState(() {});
//   }

//   void deleteCompany(int index) {
//     setState(() {
//       if (AddmultipleCompanylist.length > 1) {
//         AddmultipleCompanylist.removeAt(index);
//         SearchController.removeAt(index);
//         OrderPriceController.removeAt(index);
//         ShareValueController.removeAt(index);
//         // focusNodes.removeAt(index);
//         searchfocusNodes.removeAt(index);
//         orderfocusNodes.removeAt(index);
//         sharefocusNodes.removeAt(index);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     // for (var controller in SearchController){
//     //   controller.dispose();
//     //   print("SearchController dispose");
//     // }
//     // for (var controller in ShareValueController){
//     //   controller.dispose();
//     //     print("ShareValueController dispose");
//     // }
//     // for (var controller in OrderPriceController){
//     //   controller.dispose();
//     //     print("OrderPriceController dispose");
//     // }
//     // for (var FocusNode in searchfocusNodes){
//     //   FocusNode.dispose();
//     //     print("searchfocusNodes dispose");
//     // }
//     // for (var FocusNode in orderfocusNodes){
//     //   FocusNode.dispose();
//     //     print("orderfocusNodes dispose");
//     // }
//     // for (var FocusNode in sharefocusNodes){
//     //   FocusNode.dispose();
//     //     print("sharefocusNodes dispose");
//     // }
    
//     for (int i = 0; i < AddmultipleCompanylist.length; i++) {
//       SearchController[i].dispose();
//       OrderPriceController[i].dispose();
//       ShareValueController[i].dispose();
//       searchfocusNodes[i].dispose();
//       orderfocusNodes[i].dispose();
//       sharefocusNodes[i].dispose();
//       print("dispose............");
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryBackgroundColor,
//       appBar: AppBar(
//         title: CommonText(
//           text: "Equity Margin Calculator",
//           fontSize: 20,
//         ),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: HugeIcon(
//               icon: HugeIcons.strokeRoundedArrowLeft01,
//               color: AppColors.primaryColorDark1,
//               size: 22,
//             )
        
//             ),
//         actions: [
//           IconButton(
//             icon: HugeIcon(
//               icon: HugeIcons.strokeRoundedAdd01,
//               color: AppColors.primaryColorDark1,
//             ),
//             // Icon(Icons.add),
//             onPressed: () {
//               setState(() {
//                 AddCompany(10);
//               });
//             },
//           ),
//         ],
//         backgroundColor: AppColors.primaryBackgroundColor,
//       ),
//       body: ListView.builder(
//           shrinkWrap: true,
//           itemCount: AddmultipleCompanylist.length,
//           itemBuilder: (context, index) {
//             NewCompanyModel newcompanyadd = AddmultipleCompanylist[index];
//             List<String> FilteredCompaniesList = [
//               ...CompanyBSEvalue.keys,
//               ...CompanyNSEvalue.keys
//             ].toSet().toList();

//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child:
               
//               Column(
//                 children: [
//               //     ListTile(
//               //   title: Column(
//               //     children: [
//               //       newcompanyadd.customtextseach,
//               //       newcompanyadd.customtextfield1,
//               //       newcompanyadd.customtextfield2,
//               //       // Text()
//               //     ],
//               //   ),
//               //   trailing: IconButton(onPressed: (){deleteCompany(index);}, icon: HugeIcon(icon: HugeIcons.strokeRoundedDelete02, color: AppColors.primaryColorDark2)),
//               // ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: AppColors.primaryColorLight4,
//                       // border: Border.all(color: AppColors.primaryColorLight3),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Company: ${index+1}",
//                                 // style:GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark2, ),
//                               ),
//                               IconButton(
//                                   onPressed: () {
//                                     if (mounted) {
//                                       deleteCompany(index);
//                                     }
//                                     setState(() {
//                                       print("pressed remove");
//                                     });
//                                   },
//                                   icon: Icon(Icons.cancel)),
//                             ],
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               border:
//                                   Border.all(color: AppColors.primaryColorLight3),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 CustomTextFormField(
//                                   keyboardType: TextInputType.emailAddress,
//                                   // focusNode: searchfocusNodes[index],
//                                   focusNode: FocusNode(),
//                                   controller: SearchController[index],
//                                   icon: Icons.search,
//                                   errorMessage: 'Company Not Found',
//                                   onClick: () {
//                                     setState(() {
//                                       visiblelist = true;
//                                     });
//                                   },
//                                   onchange: (value) {
//                                     setState(() {
//                                       SearchController[index].text = value;
//                                       SelectedCompany1(
//                                           index, SelectedExchangevalue ?? '0.0');
//                                       CalculateOrder();
                  
//                                       print("${SearchController[index].text}");
//                                     });
//                                     setState(() {
//                                       SearchController[index].text ==
//                                           FilteredCompaniesList[index];
//                                       visiblelist = true;
//                                     });
//                                   },
//                                 ),
//                                 if (visiblelist)
//                                   Container(
//                                     height: 200,
//                                     child: ListView.builder(
//                                         itemCount: FilteredCompaniesList.length,
//                                         itemBuilder:
//                                             (BuildContext context, int index) {
//                                           return ListTile(
//                                             title: Text(
//                                               FilteredCompaniesList[index],
//                                               // style: GoogleFonts.sora(
//                                               //   fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark2, ),
//                                             ),
//                                             onTap: () {
//                                               SearchController[index].text = FilteredCompaniesList[index];
//                                               print(
//                                                   "Selected company:${FilteredCompaniesList[index]}");
//                                               setState(() {
//                                                 visiblelist = false;
//                                               });
//                                             },
//                                           );
//                                         }),
//                                   )
//                               ],
//                             ),
                  
//                             // GestureDetector(
//                             //   child: TextFieldSearch(
//                             //     decoration:
//                             //         InputDecoration(border: InputBorder.none),
//                             //     controller: SearchController[index],
//                             //     initialList: FilteredCompaniesList,
//                             //     label: 'Search Company',
//                             //     textStyle: TextStyle(
//                             //         color: AppColors.primaryColorDark1,
//                             //         fontFamily: 'Sora',
//                             //         fontWeight: FontWeight.w400,
//                             //         fontSize: 14),
//                             //   ),
//                             //   onTap: () {
//                             //     FocusScope.of(context)
//                             //         .requestFocus(focusNodes[index]);
//                             //     // FocusScope.of(context).dispose();
//                             //     SelectedCompany1(
//                             //         index, SelectedExchangevalue ?? '0.0');
                  
//                             //     setState(() {
//                             //       print(
//                             //           "selected comapny...${SearchController[index].text}");
//                             //     });
//                             //   },
//                             // ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Column(
//                                 children: [
//                                   Text(
//                                     "BUY/SELL:",
//                                     // style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark3, ),
//                                   ),
//                                   Container(
//                                     width: 150,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: AppColors.primaryColorLight3),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: DropdownButtonFormField(
//                                         decoration: InputDecoration(
//                                             border: InputBorder.none),
//                                         value: SelectedBuysellvalue,
//                                         // focusNode: selectbuy_sellfocusNodes[index],
//                                         focusNode: FocusNode(),
//                                         items: ['BUY', 'SELL']
//                                             .map((String buysell_list) {
//                                           return DropdownMenuItem<String>(
//                                               value: buysell_list,
//                                               child: Center(
//                                                 child: Text(
//                                                   buysell_list,
//                                                   // style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark1, ),
//                                                 ),
//                                               ));
//                                         }).toList(),
//                                         onChanged: (newvalue) {
//                                           setState(() {
//                                             SelectedBuysellvalue = newvalue!;
//                                             print(
//                                                 "selectedropdownvalue.....$SelectedBuysellvalue");
//                                             SelectedCompany1(index,
//                                                 SelectedExchangevalue ?? '0.0');
//                                           });
//                                           CalculateOrder();
//                                         }),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 children: [
//                                   Text(
//                                     "Exchange:",
//                                     //  style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark3, ),
//                                   ),
//                                   Container(
//                                     width: 150,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: AppColors.primaryColorLight3),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: DropdownButtonFormField(
//                                         alignment: AlignmentDirectional.center,
//                                         decoration: InputDecoration(
//                                             border: InputBorder.none),
//                                         // focusNode: selectBSE_NSEvalue[index],
//                                         focusNode: FocusNode(),
//                                         value: SelectedExchangevalue,
//                                         items: ['NSE', 'BSE']
//                                             .map((String exchange_list) {
//                                           return DropdownMenuItem<String>(
//                                               alignment:
//                                                   AlignmentDirectional.center,
//                                               value: exchange_list,
//                                               child: Text(
//                                                 exchange_list,
//                                                 //  style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark1, ),
//                                               ));
//                                         }).toList(),
//                                         onChanged: (newvalue2) {
//                                           setState(() {
//                                             SelectedExchangevalue = newvalue2!;
//                                             print(
//                                                 "selectedropdownvalue.....$SelectedExchangevalue");
//                                             SelectedCompany1(index,
//                                                 SelectedExchangevalue ?? '0.0');
//                                           });
//                                           CalculateOrder();
//                                         }),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Column(
//                                 children: [
//                                   Text(
//                                     "Order Price:",
//                                     //  style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark3, ),
//                                   ),
//                                   Container(
//                                     width: 150,
//                                     height: 50,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: AppColors.primaryColorLight3),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: CustomTextFormField(
//                                       autofocus: true,
//                                       keyboardType: TextInputType.number,
//                                       focusNode: FocusNode(),
//                                       // focusNode: orderfocusNodes[index],
//                                       controller: OrderPriceController[index],
//                                       icon: Icons.currency_rupee,
//                                       errorMessage: 'Order Price',
//                                       onchange: (value) {
//                                         setState(() {
//                                           OrderPriceController[index].text = value;
//                                           SelectedCompany1(index,
//                                               SelectedExchangevalue ?? '0.0');
//                                           CalculateOrder();
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 children: [
//                                   Text(
//                                     "Share:",
//                                     // style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark3, ),
//                                   ),
//                                   Container(
//                                     width: 150,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: AppColors.primaryColorLight3),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: CustomTextFormField(
//                                       // autofocus: true,
//                                       keyboardType: TextInputType.number,
//                                       // focusNode: selectbuy_sellfocusNodes[index],
//                                       focusNode: FocusNode(),
//                                       controller: ShareValueController[index],
//                                       errorMessage: 'Invalid value Share',
//                                       onchange: (value) {
//                                         setState(() {
//                                           ShareValueController[index].text = value;
//                                           SelectedCompany1(index,
//                                               SelectedExchangevalue ?? '0.0');
                  
//                                           CalculateOrder();
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "MARGIN FOR DELIVERY:",
//                                     // style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w600,color: AppColors.primaryColorDark2, ),
//                                     // TextStyle(
//                                     //     fontFamily: 'Sora',
//                                     //     fontWeight: FontWeight.w400,
//                                     //     color: AppColors.primaryColorDark3,
//                                     //     fontSize: 14),
//                                   ),
//                                   Container(
//                                     width: 170,
//                                     height: 50,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: AppColors.primaryColorLight3),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Center(
//                                         child: Text(
//                                       "$MarginDelivery",
//                                       // style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark2, ),
//                                     )),
//                                     // child: Text(
//                                     //     SelectedBuysellList == "SELL"
//                                     //         ? '0.00'
//                                     //         : SelectedBuysellList)),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     "MARGIN FOR INTRADAY:",
//                                     // style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400 ,color: AppColors.primaryColorDark3,),
//                                   ),
//                                   Container(
//                                     width: 170,
//                                     height: 50,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: AppColors.primaryColorLight3),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Center(
//                                         child: Text(
//                                       "$MarginIntraday",
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontFamily: 'Sora',
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     )),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Total",
//                                     // style: TextStyle(
//                                     //     fontFamily: 'Sora',
//                                     //     fontWeight: FontWeight.w400,
//                                     //     color: AppColors.primaryColorDark3,
//                                     //     fontSize: 14),
//                                   ),
//                                   Container(
//                                     width: 130,
//                                     height: 50,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: AppColors.primaryColorLight3),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Center(
//                                         child: Text(
//                                       "$TotalMarginDelivery",
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontFamily: 'Sora',
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     )),
//                                   ),
//                                   SizedBox(
//                                     height: 30,
//                                   ),
//                                   Container(
//                                       width: 130,
//                                       height: 50,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: AppColors.primaryColorLight3),
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: Center(
//                                           child: Text(
//                                         "$TotalMarginIntraday",
//                                         // style:GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark3, ),
//                                       ))),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Container(
//                                   width: 150,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: AppColors.primaryColorLight3),
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: AppColors.primaryBackgroundColor),
//                                   child: TextButton(
//                                       clipBehavior: Clip.antiAlias,
//                                       onPressed: () {
//                                         setState(() {
//                                           CalculateOrder();
//                                         });
//                                       },
//                                       child: Text(
//                                         "Calculate",
//                                         // style:GoogleFonts.sora(fontSize:16,fontWeight: FontWeight.w600 ),
//                                       ))),
//                               Container(
//                                 width: 150,
//                                 child: CustomButton(
//                                     isLoading: false,
//                                     text: 'Cancel',
//                                     onPressed: () {
//                                       OrderPriceController.clear();
//                                       ShareValueController.clear();
//                                       MarginDelivery = 0.0;
//                                       MarginIntraday = 0.0;
//                                     }),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:stock_average_calculator/Screens/EquityMargin_Model.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';
import 'package:stock_average_calculator/Utils/common_text.dart';
import 'package:stock_average_calculator/Utils/custom_textformfield.dart';

class EquityMargincalculator extends StatefulWidget {
  const EquityMargincalculator({super.key});

  @override
  State<EquityMargincalculator> createState() => _EquityMargincalculatorState();
}

class _EquityMargincalculatorState extends State<EquityMargincalculator> {
  List<TextEditingController> SearchController = [];
  List<TextEditingController> OrderPriceController = [];
  List<TextEditingController> ShareValueController = [];


  List<FocusNode> searchfocusNodes = [];
  List<FocusNode> orderfocusNodes = [];
  List<FocusNode> sharefocusNodes = [];
  List<FocusNode> selectbuy_sellfocusNodes = [];
  List<FocusNode> selectBSE_NSEvaluenode = [];

  List<NewCompanyModel> AddmultipleCompanylist = [];

  bool visiblelist = false;

  Map<String, double> CompanyBSEvalue = <String, double>{
    "Swiggy Ltd.": 594.80,
    "Enviro infra Engineers Ltd.": 380.50,
    "Adani Enterprises Ltd.": 2593.45,
    "NTPC green Energy Ltd.": 128.50,
    "Tata Motors Ltd.": 784.70
  };

  Map<String, double> CompanyNSEvalue = <String, double>{
    "Swiggy Ltd.": 596.35,
    "Enviro infra Engineers Ltd.": 269.62,
    "Adani Enterprises Ltd.": 2592.35,
    "NTPC green Energy Ltd.": 128.35,
    "Tata Motors Ltd.": 784.80
  };

  String? Selectedcompany = '';
  String? SelectedBuysellvalue = 'BUY';
  String? SelectedExchangevalue = 'NSE';
  double MarginDelivery = 0.0;
  double MarginIntraday = 0.0;
  double TotalMarginDelivery = 0.0;
  double TotalMarginIntraday = 0.0;

  @override
  void initState() {
      SearchController.add(TextEditingController());
    OrderPriceController.add(TextEditingController());
    ShareValueController.add(TextEditingController());
    searchfocusNodes.add(FocusNode());
    orderfocusNodes.add(FocusNode());
    sharefocusNodes.add(FocusNode());

 AddmultipleCompanylist.add(NewCompanyModel(
          customtextseach: CustomTextFormField(
            focusNode: searchfocusNodes.last,
            keyboardType: TextInputType.emailAddress,
            controller: SearchController.last,
          ),
         
          customtextfield1: CustomTextFormField(
            focusNode: orderfocusNodes.last,
            keyboardType: TextInputType.emailAddress,
            controller: OrderPriceController.last,
          ),
          customtextfield2: CustomTextFormField(
            focusNode:sharefocusNodes.last,
            keyboardType: TextInputType.emailAddress,
            controller: ShareValueController.last,
          ),
          textMarginDelivery: '0',
          textMarginIntraday: '0',
          deleteOnTap: () => deleteCompany(0)));

    setState(() {
      List<String> FilteredCompaniesList =
          [...CompanyBSEvalue.keys, ...CompanyNSEvalue.keys].toSet().toList();
      super.initState();
      print("FilteredCompaniesList.........$FilteredCompaniesList");
    });

    SearchController = List.generate(
        AddmultipleCompanylist.length, (index) => TextEditingController());
    OrderPriceController = List.generate(
        AddmultipleCompanylist.length, (index) => TextEditingController());
    ShareValueController = List.generate(
        AddmultipleCompanylist.length, (index) => TextEditingController());
    // focusNodes =
    //     List.generate(AddmultipleCompanylist.length, (index) => FocusNode());
    sharefocusNodes =
        List.generate(AddmultipleCompanylist.length, (index) => FocusNode());
    orderfocusNodes =
        List.generate(AddmultipleCompanylist.length, (index) => FocusNode());
    searchfocusNodes =
        List.generate(AddmultipleCompanylist.length, (index) => FocusNode());
    selectBSE_NSEvaluenode =
        List.generate(AddmultipleCompanylist.length, (index) => FocusNode());
    selectbuy_sellfocusNodes =
        List.generate(AddmultipleCompanylist.length, (index) => FocusNode());

    // if (AddmultipleCompanylist.isEmpty) {
    //   AddmultipleCompanylist.add(NewCompanyModel(
    //       customtextseach: CustomTextFormField(
    //         focusNode: FocusNode(),
    //         keyboardType: TextInputType.emailAddress,
    //         controller: TextEditingController(),
    //       ),
    //       // textfiledserch: TextFieldSearch(
    //       //     label: 'Search Company', controller: TextEditingController()),
    //       customtextfield1: CustomTextFormField(
    //         focusNode: FocusNode(),
    //         keyboardType: TextInputType.emailAddress,
    //         controller: TextEditingController(),
    //       ),
    //       customtextfield2: CustomTextFormField(
    //         focusNode: FocusNode(),
    //         keyboardType: TextInputType.emailAddress,
    //         controller: TextEditingController(),
    //       ),
    //       textMarginDelivery: '1000',
    //       textMarginIntraday: '2000',
    //       deleteOnTap: () => deleteCompany(0)));
    // }
  
    // focusNodes.add(FocusNode());
    print("AddmultipleCompanylist......${AddmultipleCompanylist}");
    // for (int i = 0; i < AddmultipleCompanylist.length; i++) {
    //   SearchController.add(TextEditingController());
    //   OrderPriceController.add(TextEditingController());
    //   ShareValueController.add(TextEditingController());
    //   focusNodes.add(FocusNode());
    // }
  }

  Future<void> AddCompany(int index) async {
    setState(() {
      AddmultipleCompanylist.add(NewCompanyModel(
          customtextseach: CustomTextFormField(
            // focusNode: focusNodes.last,
            focusNode: searchfocusNodes.last,
            keyboardType: TextInputType.emailAddress,
            controller: SearchController.last,
          ),
          customtextfield1: CustomTextFormField(
            // focusNode: focusNodes.last,
            focusNode: orderfocusNodes.last,
            keyboardType: TextInputType.emailAddress,
            controller: OrderPriceController.last,
          ),
          customtextfield2: CustomTextFormField(
            // focusNode: focusNodes.last,
            focusNode: sharefocusNodes.last,
            keyboardType: TextInputType.emailAddress,
            controller: ShareValueController.last,
          ),
          textMarginDelivery: '0',
          textMarginIntraday: '0',
          deleteOnTap: () => deleteCompany(AddmultipleCompanylist.length - 1)));
      SearchController.add(TextEditingController());
      OrderPriceController.add(TextEditingController());
      ShareValueController.add(TextEditingController());
      // focusNodes.add(FocusNode());
      searchfocusNodes.add(FocusNode());
      orderfocusNodes.add(FocusNode());
      sharefocusNodes.add(FocusNode());
      print("Add company.........$AddmultipleCompanylist");
    });
  }

  Future<void> SelectedCompany1(int index, String SelectedExchangevalue) async {
    String selectedCompany = SearchController[index].text.trim();
    print("selected company#####$selectedCompany");
    setState(() {
      if (SelectedExchangevalue[index] == 'NSE') {
        if (SelectedBuysellvalue == "BUY") {
          OrderPriceController[index].text =
              CompanyNSEvalue[selectedCompany]?.toString() ?? '0.0';
        } else if (SelectedBuysellvalue == "SELL") {
          OrderPriceController[index].text = '0.0';
        }
      } else if (SelectedExchangevalue[index] == 'BSE') {
        if (SelectedBuysellvalue == "BUY") {
          OrderPriceController[index].text =
              CompanyBSEvalue[selectedCompany]?.toString() ?? '0.0';
        } else if (SelectedBuysellvalue == "SELL") {
          OrderPriceController[index].text = '0.0';
        }
      }
    });
  }

  Future<void> CalculateOrder() async {
    if (OrderPriceController.isEmpty || ShareValueController.isEmpty) {
      print("Error: OrderPriceController or ShareValueController is empty");
      return;
    }

    List<TextEditingController> Ordervalue = OrderPriceController;
    List<TextEditingController> Sharevalue = ShareValueController;

    List<double> MarginDeliveryList = [];
    List<double> MarginIntradayList = [];

    double parseToDouble(String input) {
      String cleanedInput = input.replaceAll(RegExp(r'[^0-9.]'), '');
      return double.tryParse(cleanedInput) ?? 0.0;
    }

    for (int i = 0; i < Ordervalue.length; i++) {
      double OrderPrice = parseToDouble(Ordervalue[i].text);
      double ShareValue = parseToDouble(Sharevalue[i].text);

      double RoundDelivery = OrderPrice * ShareValue;
      MarginDelivery = double.parse(RoundDelivery.toStringAsFixed(2));
      MarginDeliveryList.add(MarginDelivery);

      double RoundIntraday = OrderPrice * ShareValue * (20 / 100);
      MarginIntraday = double.parse(RoundIntraday.toStringAsFixed(2));

      MarginIntradayList.add(MarginIntraday);
    }
    double roundTotalDelivery =
        MarginDeliveryList.fold(0.0, (sum, Element) => sum + Element);
    TotalMarginDelivery = double.parse(roundTotalDelivery.toStringAsFixed(2));

    double roundTotalIntraday =
        MarginIntradayList.fold(0.0, (sum, Element) => sum + Element);
    TotalMarginIntraday = double.parse(roundTotalIntraday.toStringAsFixed(2));

    print("Total Margin Delivery:::::::::::$TotalMarginDelivery");
    print("Total Margin Intraday:::::::::::$TotalMarginIntraday");

    setState(() {});
  }

  void deleteCompany(int index) {
    setState(() {
      if (AddmultipleCompanylist.length > 1) {
        AddmultipleCompanylist.removeAt(index);
        SearchController.removeAt(index);
        OrderPriceController.removeAt(index);
        ShareValueController.removeAt(index);
        // focusNodes.removeAt(index);
        searchfocusNodes.removeAt(index);
        orderfocusNodes.removeAt(index);
        sharefocusNodes.removeAt(index);
      }
    });
  }

  @override
  void dispose() {
    // for (var controller in SearchController){
    //   controller.dispose();
    //   print("SearchController dispose");
    // }
    // for (var controller in ShareValueController){
    //   controller.dispose();
    //     print("ShareValueController dispose");
    // }
    // for (var controller in OrderPriceController){
    //   controller.dispose();
    //     print("OrderPriceController dispose");
    // }
    // for (var FocusNode in searchfocusNodes){
    //   FocusNode.dispose();
    //     print("searchfocusNodes dispose");
    // }
    // for (var FocusNode in orderfocusNodes){
    //   FocusNode.dispose();
    //     print("orderfocusNodes dispose");
    // }
    // for (var FocusNode in sharefocusNodes){
    //   FocusNode.dispose();
    //     print("sharefocusNodes dispose");
    // }
    
    for (int i = 0; i < AddmultipleCompanylist.length; i++) {
      SearchController[i].dispose();
      OrderPriceController[i].dispose();
      ShareValueController[i].dispose();
      searchfocusNodes[i].dispose();
      orderfocusNodes[i].dispose();
      sharefocusNodes[i].dispose();
      print("dispose............");
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        title: CommonText(
          text: "Equity Margin Calculator",
          fontSize: 20,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedArrowLeft01,
              color: AppColors.primaryColorDark1,
              size: 22,
            )
        
            ),
        actions: [
          IconButton(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedAdd01,
              color: AppColors.primaryColorDark1,
            ),
            // Icon(Icons.add),
            onPressed: () {
              setState(() {
                AddCompany(10);
              });
            },
          ),
        ],
        backgroundColor: AppColors.primaryBackgroundColor,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: AddmultipleCompanylist.length,
          itemBuilder: (context, index) {
            NewCompanyModel newcompanyadd = AddmultipleCompanylist[index];
            List<String> FilteredCompaniesList = [
              ...CompanyBSEvalue.keys,
              ...CompanyNSEvalue.keys
            ].toSet().toList();

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child:
               
              Column(
                children: [
              //     ListTile(
              //   title: Column(
              //     children: [
              //       newcompanyadd.customtextseach,
              //       newcompanyadd.customtextfield1,
              //       newcompanyadd.customtextfield2,
              //       // Text()
              //     ],
              //   ),
              //   trailing: IconButton(onPressed: (){deleteCompany(index);}, icon: HugeIcon(icon: HugeIcons.strokeRoundedDelete02, color: AppColors.primaryColorDark2)),
              // ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColorLight4,
                      // border: Border.all(color: AppColors.primaryColorLight3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Company: ${index+1}",
                                // style:GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark2, ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (mounted) {
                                      deleteCompany(index);
                                    }
                                    setState(() {
                                      print("pressed remove");
                                    });
                                  },
                                  icon: Icon(Icons.cancel)),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColors.primaryColorLight3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomTextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  // focusNode: searchfocusNodes[index],
                                  focusNode: FocusNode(),
                                  controller: SearchController[index],
                                  icon: Icons.search,
                                  errorMessage: 'Company Not Found',
                                  onClick: () {
                                    setState(() {
                                      visiblelist = true;
                                    });
                                  },
                                  onchange: (value) {
                                    setState(() {
                                      SearchController[index].text = value;
                                      SelectedCompany1(
                                          index, SelectedExchangevalue ?? '0.0');
                                      CalculateOrder();
                  
                                      print("${SearchController[index].text}");
                                    });
                                    setState(() {
                                      SearchController[index].text ==
                                          FilteredCompaniesList[index];
                                      visiblelist = true;
                                    });
                                  },
                                ),
                                if (visiblelist)
                                  Container(
                                    height: 200,
                                    child: ListView.builder(
                                        itemCount: FilteredCompaniesList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                            title: Text(
                                              FilteredCompaniesList[index],
                                              // style: GoogleFonts.sora(
                                              //   fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark2, ),
                                            ),
                                            onTap: () {
                                              SearchController[index].text = FilteredCompaniesList[index];
                                              print(
                                                  "Selected company:${FilteredCompaniesList[index]}");
                                              setState(() {
                                                visiblelist = false;
                                              });
                                            },
                                          );
                                        }),
                                  )
                              ],
                            ),
                  
                            // GestureDetector(
                            //   child: TextFieldSearch(
                            //     decoration:
                            //         InputDecoration(border: InputBorder.none),
                            //     controller: SearchController[index],
                            //     initialList: FilteredCompaniesList,
                            //     label: 'Search Company',
                            //     textStyle: TextStyle(
                            //         color: AppColors.primaryColorDark1,
                            //         fontFamily: 'Sora',
                            //         fontWeight: FontWeight.w400,
                            //         fontSize: 14),
                            //   ),
                            //   onTap: () {
                            //     FocusScope.of(context)
                            //         .requestFocus(focusNodes[index]);
                            //     // FocusScope.of(context).dispose();
                            //     SelectedCompany1(
                            //         index, SelectedExchangevalue ?? '0.0');
                  
                            //     setState(() {
                            //       print(
                            //           "selected comapny...${SearchController[index].text}");
                            //     });
                            //   },
                            // ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "BUY/SELL:",
                                    // style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark3, ),
                                  ),
                                  Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColorLight3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none),
                                        value: SelectedBuysellvalue,
                                        // focusNode: selectbuy_sellfocusNodes[index],
                                        focusNode: FocusNode(),
                                        items: ['BUY', 'SELL']
                                            .map((String buysell_list) {
                                          return DropdownMenuItem<String>(
                                              value: buysell_list,
                                              child: Center(
                                                child: Text(
                                                  buysell_list,
                                                  // style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark1, ),
                                                ),
                                              ));
                                        }).toList(),
                                        onChanged: (newvalue) {
                                          setState(() {
                                            SelectedBuysellvalue = newvalue!;
                                            print(
                                                "selectedropdownvalue.....$SelectedBuysellvalue");
                                            SelectedCompany1(index,
                                                SelectedExchangevalue ?? '0.0');
                                          });
                                          CalculateOrder();
                                        }),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Exchange:",
                                    //  style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark3, ),
                                  ),
                                  Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColorLight3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: DropdownButtonFormField(
                                        alignment: AlignmentDirectional.center,
                                        decoration: InputDecoration(
                                            border: InputBorder.none),
                                        // focusNode: selectBSE_NSEvalue[index],
                                        focusNode: FocusNode(),
                                        value: SelectedExchangevalue,
                                        items: ['NSE', 'BSE']
                                            .map((String exchange_list) {
                                          return DropdownMenuItem<String>(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              value: exchange_list,
                                              child: Text(
                                                exchange_list,
                                                //  style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark1, ),
                                              ));
                                        }).toList(),
                                        onChanged: (newvalue2) {
                                          setState(() {
                                            SelectedExchangevalue = newvalue2!;
                                            print(
                                                "selectedropdownvalue.....$SelectedExchangevalue");
                                            SelectedCompany1(index,
                                                SelectedExchangevalue ?? '0.0');
                                          });
                                          CalculateOrder();
                                        }),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Order Price:",
                                    //  style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark3, ),
                                  ),
                                  Container(
                                    width: 150,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColorLight3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: CustomTextFormField(
                                      autofocus: true,
                                      keyboardType: TextInputType.number,
                                      focusNode: FocusNode(),
                                      // focusNode: orderfocusNodes[index],
                                      controller: OrderPriceController[index],
                                      icon: Icons.currency_rupee,
                                      errorMessage: 'Order Price',
                                      onchange: (value) {
                                        setState(() {
                                          OrderPriceController[index].text = value;
                                          SelectedCompany1(index,
                                              SelectedExchangevalue ?? '0.0');
                                          CalculateOrder();
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
                                    // style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark3, ),
                                  ),
                                  Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColorLight3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: CustomTextFormField(
                                      // autofocus: true,
                                      keyboardType: TextInputType.number,
                                      // focusNode: selectbuy_sellfocusNodes[index],
                                      focusNode: FocusNode(),
                                      controller: ShareValueController[index],
                                      errorMessage: 'Invalid value Share',
                                      onchange: (value) {
                                        setState(() {
                                          ShareValueController[index].text = value;
                                          SelectedCompany1(index,
                                              SelectedExchangevalue ?? '0.0');
                  
                                          CalculateOrder();
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "MARGIN FOR DELIVERY:",
                                    // style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w600,color: AppColors.primaryColorDark2, ),
                                    // TextStyle(
                                    //     fontFamily: 'Sora',
                                    //     fontWeight: FontWeight.w400,
                                    //     color: AppColors.primaryColorDark3,
                                    //     fontSize: 14),
                                  ),
                                  Container(
                                    width: 170,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColorLight3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "$MarginDelivery",
                                      // style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark2, ),
                                    )),
                                    // child: Text(
                                    //     SelectedBuysellList == "SELL"
                                    //         ? '0.00'
                                    //         : SelectedBuysellList)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "MARGIN FOR INTRADAY:",
                                    // style: GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400 ,color: AppColors.primaryColorDark3,),
                                  ),
                                  Container(
                                    width: 170,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColorLight3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "$MarginIntraday",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Sora',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Total",
                                    // style: TextStyle(
                                    //     fontFamily: 'Sora',
                                    //     fontWeight: FontWeight.w400,
                                    //     color: AppColors.primaryColorDark3,
                                    //     fontSize: 14),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColorLight3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "$TotalMarginDelivery",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Sora',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                      width: 130,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.primaryColorLight3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "$TotalMarginIntraday",
                                        // style:GoogleFonts.sora(fontSize:14,fontWeight: FontWeight.w400,color: AppColors.primaryColorDark3, ),
                                      ))),
                                ],
                              ),
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
                                      border: Border.all(
                                          color: AppColors.primaryColorLight3),
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
                                        // style:GoogleFonts.sora(fontSize:16,fontWeight: FontWeight.w600 ),
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
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
