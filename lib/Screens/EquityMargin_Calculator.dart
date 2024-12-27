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
//   List<TextEditingController> SearchController = [];
//   List<TextEditingController> OrderPriceController = [];
//   List<TextEditingController> ShareValueController = [];

//   List<String> FilteredCompaniesList = []; //only companyname
//   List<NewCompanyModel> AddmultipleCompanylist = [];

//   List<FocusNode> focusNodes = [];

//   @override
//   void initState() {
//     FilteredCompaniesList = companies;
//     SearchController =List.generate(companies.length, (index) => TextEditingController());
//     OrderPriceController =List.generate(companies.length, (index) => TextEditingController());
//     focusNodes =List.generate(companies.length, (index) => FocusNode());
// if (ShareValueController.isEmpty) {
//     ShareValueController = List.generate(1, (index) => TextEditingController());
//   }
//   ShareValueController[0].text='1.0';
//   ShareValueController.forEach((controller) {
//       controller.addListener(SelectedCompany1);
//       print("changed Share vlaue.......... ${controller.text}");
//     });

//     SearchController.forEach((controller) {
//       controller.addListener(SelectedCompany1);
//       print("searchcontroller............ ${controller.text}");
//     });
//     OrderPriceController.forEach((controller) {
//       controller.addListener(SelectedCompany1);
//       print("changed Order price............ ${controller.text}");
//     });

// for (int i = 0; i < companies.length; i++) {
//   focusNodes.add(FocusNode());
//   SearchController.add(TextEditingController());
//   OrderPriceController.add(TextEditingController());
//   ShareValueController.add(TextEditingController());
//   // controllers[i].dispose();
// }

//     Add_company();

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

//   // String SelectedCompany = '';
//     String? SelectedBuysellvalue = 'BUY';
//   String? SelectedExchangevalue = 'NSE';
//   String SelectedBuysellList = '';
//     double MarginDelivery = 0.0;
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
//     String selectedCompany = SearchController[0].text.trim();

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

//  Future<void> CalculateOrder() async {

//   if (OrderPriceController.isEmpty || ShareValueController.isEmpty) {

//     print("Error: OrderPriceController or ShareValueController is empty");
//     return;
//   }

//   List<TextEditingController> Ordervalue = OrderPriceController;
//   List<TextEditingController> Sharevalue = ShareValueController;

//   List<double> MarginDeliveryList = [];
//   List<double> MarginIntradayList = [];
//   List<String> SelectedBuysellList = [];

//   double parseToDouble(String input) {
//     String cleanedInput = input.replaceAll(RegExp(r'[^0-9.]'), '');
//     return double.tryParse(cleanedInput) ?? 0.0;
//   }

//   for (int i = 0; i < Ordervalue.length; i++) {
//     double OrderPrice = parseToDouble(Ordervalue[i].text);
//     double ShareValue = parseToDouble(Sharevalue[i].text);

//     double RoundDelivery = OrderPrice * ShareValue;
//     double MarginDelivery = double.parse(RoundDelivery.toStringAsFixed(3));
//     MarginDeliveryList.add(MarginDelivery);

//     double RoundIntraday = OrderPrice * ShareValue * (20 / 100);
//     double MarginIntraday = double.parse(RoundIntraday.toStringAsFixed(2));
//     MarginIntradayList.add(MarginIntraday);

//     if (SelectedBuysellvalue == 'BUY') {
//       SelectedBuysellList.add(MarginDelivery.toStringAsFixed(2));
//     } else {
//       SelectedBuysellList.add('');
//     }
//   }

//   setState(() {});
// }

//   Future<void> Add_company() async {

//     await Future.delayed(Duration(seconds: 2));//delay

//     AddmultipleCompanylist.add(
//       NewCompanyModel(
//       textfiledserch: TextFieldSearch(
//         decoration: InputDecoration(border: InputBorder.none),
//         initialList: FilteredCompaniesList,
//         controller: SearchController[0],
//         label: 'Search Company',
//         textStyle: TextStyle(color: AppColors.primaryColorDark1, fontSize: 14),
//       ),
//       ontap1: () {
//         if (mounted) {
//           setState(() {
//             filterCompanies(SearchController[0].text);
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
//         focusNode: focusNodes[0],
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
//         focusNode: focusNodes[0],
//         controller: ShareValueController[0],
//         errorMessage: 'Invalid value Share',
//         onchange: (value) {
//           setState(() {
//             double sharevalue = double.tryParse(value)??1.0;
//             int index=0;
//               if(index < ShareValueController.length){if(sharevalue<1){
//                 sharevalue =1.0;
//                 print("minimum sharevalue......$sharevalue");
//               }}
//             ShareValueController[index].text = sharevalue.toStringAsFixed(2);
//             CalculateOrder();
//           });
//           print("sharevalue..........${ShareValueController[0].text}");
//         },
//       ),
//       TextMarginDelivery:
//           SelectedBuysellvalue == "SELL" ? '0.0' : SelectedBuysellList,
//       TextmarginIntraday: "${MarginDelivery}",
//       DeleteOntap: () {
//         if (mounted) {
//           deleteCompany;
//         }
//         setState(() {});
//       },
//     ));
//     if(mounted){setState(() {
//       companies.add("${companies.length+1}");
//       SearchController.add(TextEditingController());
//       OrderPriceController.add(TextEditingController());
//       ShareValueController.add(TextEditingController());
//        focusNodes.add(FocusNode());
//     });}

//     // setState(() {});
//   }

//   void deleteCompany(int index) {
//     SearchController[index].dispose();
//     OrderPriceController[index].dispose();
//     ShareValueController[index].dispose();
//     focusNodes[index].dispose();

//     if (AddmultipleCompanylist.length > 1) {
//       AddmultipleCompanylist.removeAt(index);
//       SearchController.removeAt(index);
//       OrderPriceController.removeAt(index);
//       ShareValueController.removeAt(index);
//       focusNodes.removeAt(index);
//     }
//   }

//   @override
//   void dispose() {
//     for (int i = 0; i < SearchController.length; i++) {
//       SearchController[i].dispose();
//     }
//     for (int i = 0; i < OrderPriceController.length; i++) {
//       OrderPriceController[i].dispose();
//     }
//     for (int i = 0; i < ShareValueController.length; i++) {
//       ShareValueController[i].dispose();
//     }
//     for (int i = 0; i < focusNodes.length; i++) {
//       focusNodes[i].dispose();
//     }

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
//                   final NewCompanyModel newcompanyadd =
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
//                     child: NewCompanyModel(
//                       textfiledserch: TextFieldSearch(
//                         decoration: InputDecoration(border: InputBorder.none),
//                         initialList: FilteredCompaniesList,
//                         controller: SearchController[index],
//                         label: 'Search Company',
//                         textStyle: TextStyle(
//                             color: AppColors.primaryColorDark1, fontSize: 14),
//                       ),
//                       ontap1: newcompanyadd.ontap1,
//                       items1: newcompanyadd.items1,
//                       items2: newcompanyadd.items2,
//                       value1: newcompanyadd.value1,
//                       value2: newcompanyadd.value2,
//                       onchanged1: (newvalue) {
//                         if(mounted){setState(() {
//                           print("value onchange1,,,,,,,,,,,,,,");

//                           newcompanyadd.value1 = newvalue!;
//                           newcompanyadd.onchanged1!(newvalue);
//                         });}
//                         CalculateOrder();
//                       },
//                       onchanged2: (newvalue) {
//                         print("value onchange2,,,,,,,,,,,,,,");
//                         if(mounted){setState(() {
//                           newcompanyadd.value2 = newvalue!;
//                           newcompanyadd.onchanged2!(newvalue);
//                         });}
//                         CalculateOrder();
//                         SelectedCompany1();
//                       },
//                       customtextfield1: CustomTextFormField(
//                         autofocus: true,
//                         keyboardType: TextInputType.number,
//                         focusNode: focusNodes[index],
//                         controller: OrderPriceController[index],
//                         icon: Icons.currency_rupee,
//                         errorMessage: 'Order Price',
//                         onchange: (value) {
//                          if(mounted){ setState(() {
//                             // OrderPriceController[index].text = value;
//                             // CalculateOrder();
//                           });}
//                           print(
//                               "orderprice..........${OrderPriceController[index].text}");
//                         },
//                       ),
//                       customtextfield2: CustomTextFormField(
//                         autofocus: true,
//                         keyboardType: TextInputType.number,
//                         focusNode: focusNodes[index],
//                         controller: ShareValueController[index],
//                         errorMessage: 'Invalid value Share',
//                         onchange: (value) {
//                           if(mounted){setState(() {
//                             //  OrderPriceController[index].text = value;

//                             // CalculateOrder();
//                           });}
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
//                             deleteCompany(index);
//                           });
//                           // deleteCompany(AddmultipleCompanylist.indexOf(newcompanyadd));
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
//                                   deleteCompany;
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
//                                 CalculateOrder();
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
  List<FocusNode> focusNodes = [];
  List<NewCompanyModel> AddmultipleCompanylist = [];

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

  String? SelectedBuysellvalue = 'BUY';
  String? SelectedExchangevalue = 'NSE';
  String SelectedBuysellList = '';
  double MarginDelivery = 0.0;
  double MarginIntraday = 0.0;

  @override
  void initState() {
    setState(() {
      List<String> FilteredCompaniesList =
          [...CompanyBSEvalue.keys, ...CompanyNSEvalue.keys].toSet().toList();
      super.initState();
      print("FilteredCompaniesList.........$FilteredCompaniesList");
    });

    SearchController = List.generate(1, (index) => TextEditingController());
    OrderPriceController = List.generate(1, (index) => TextEditingController());
    focusNodes = List.generate(1, (index) => FocusNode());
    
    if (AddmultipleCompanylist.isEmpty) {
      AddmultipleCompanylist.add(NewCompanyModel(
          textfiledserch: TextFieldSearch(
              label: 'Search Company', controller: TextEditingController()),
          customtextfield1: CustomTextFormField(
            focusNode: FocusNode(),
            keyboardType: TextInputType.emailAddress,
            controller: TextEditingController(),
          ),
          customtextfield2: CustomTextFormField(
            focusNode: FocusNode(),
            keyboardType: TextInputType.emailAddress,
            controller: TextEditingController(),
          ),
          textMarginDelivery: '1000',
          textMarginIntraday: '2000',
          deleteOnTap: () => deleteCompany(0)));
    }
    print("AddmultipleCompanylist......${AddmultipleCompanylist}");
    for (int i = 0; i < AddmultipleCompanylist.length; i++) {
      SearchController.add(TextEditingController());
      OrderPriceController.add(TextEditingController());
      ShareValueController.add(TextEditingController());
      focusNodes.add(FocusNode());
    }
    print("AddmultipleCompanylist11......${AddmultipleCompanylist}");
  }

  void AddCompany(int index) {
    setState(() {
      if(SearchController.isEmpty||SearchController.length <= index){
        SearchController.add(TextEditingController());
      }
      if(OrderPriceController.isEmpty||OrderPriceController.length <= index){
        OrderPriceController.add(TextEditingController());
      }
      if(ShareValueController.isEmpty||ShareValueController.length <= index){
        ShareValueController.add(TextEditingController());
      }
      if(focusNodes.isEmpty||focusNodes.length <= index){
        focusNodes.add(FocusNode());
      }
      AddmultipleCompanylist.add(NewCompanyModel(
          textfiledserch: TextFieldSearch(
              label: 'Search Company', controller: SearchController[0]),
          customtextfield1: CustomTextFormField(
            focusNode: focusNodes[0],
            keyboardType: TextInputType.emailAddress,
            controller: OrderPriceController[0],
          ),
          customtextfield2: CustomTextFormField(
            focusNode: focusNodes[0],
            keyboardType: TextInputType.emailAddress,
            controller: ShareValueController[0],
          ),
          textMarginDelivery: '0',
          textMarginIntraday: '0',
          deleteOnTap: () => deleteCompany(AddmultipleCompanylist.length - 1)));
    });
  }

  Future<void> SelectedCompany1(String SelectedExchangevalue) async {
    String selectedCompany = SearchController[0].text.trim();
    OrderPriceController[0].clear();
    print("selected company#####$selectedCompany");
    if (SelectedExchangevalue == 'NSE') {
      selectedCompany = CompanyNSEvalue.keys.first;
      print("selectedexvalue!!!!!!!!!$selectedCompany");
      OrderPriceController[0].text =
          CompanyNSEvalue[selectedCompany].toString();
      print(
          "changed CompanyNSEvalue orderpricevalue>>>>>>>>>>>>${OrderPriceController[0].text}");
    } else if (SelectedExchangevalue == 'BSE') {
      selectedCompany = CompanyBSEvalue.keys.first;
      print("selectedexvalue!!!!!!!!!$selectedCompany");
      OrderPriceController[0].text =
          CompanyBSEvalue[selectedCompany].toString();
      print(
          "changed CompanyBSEvalue orderpricevalue>>>>>>>>>>>>${OrderPriceController[0].text}");
    }

    setState(() {});
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
    List<String> SelectedBuysellList = [];

    double parseToDouble(String input) {
      String cleanedInput = input.replaceAll(RegExp(r'[^0-9.]'), '');
      return double.tryParse(cleanedInput) ?? 0.0;
    }

    for (int i = 0; i < Ordervalue.length; i++) {
      double OrderPrice = parseToDouble(Ordervalue[i].text);
      double ShareValue = parseToDouble(Sharevalue[i].text);

      double RoundDelivery = OrderPrice * ShareValue;
      double MarginDelivery = double.parse(RoundDelivery.toStringAsFixed(2));
      MarginDeliveryList.add(MarginDelivery);
      print(" margindelivery,,,,,,,,,,$MarginDelivery");
      print(" margindeliveryList,,,,,,,,,,$MarginDeliveryList");
      print("calculate margindelivery??????????$RoundDelivery");

      double RoundIntraday = OrderPrice * ShareValue * (20 / 100);
      double MarginIntraday = double.parse(RoundIntraday.toStringAsFixed(2));
      MarginIntradayList.add(MarginIntraday);
      print(" marginintraday,,,,,,,,,,$MarginIntraday");
      print(" marginintradayList,,,,,,,,,,$MarginIntradayList");
      print("calculated marginintrada/////////$RoundIntraday");

      if (SelectedBuysellvalue == 'BUY') {
        SelectedBuysellList.add(MarginDelivery.toStringAsFixed(2));
        print("selected BUY/SELL list......$SelectedBuysellList");
      } else {
        SelectedBuysellList.add('');
      }
    }

    setState(() {});
  }

  void deleteCompany(int index) {
    // SearchController[index].dispose();
    // OrderPriceController[index].dispose();
    // ShareValueController[index].dispose();
    // focusNodes[index].dispose();

    setState(() {
      if (AddmultipleCompanylist.length > 1) {
        AddmultipleCompanylist.removeAt(index);
        // SearchController.removeAt(index);
        // OrderPriceController.removeAt(index);
        // ShareValueController.removeAt(index);
        // focusNodes.removeAt(index);
      }
    });
  }

  @override
  void dispose() {
    for (int i = 0; i < AddmultipleCompanylist.length; i++) {
      SearchController[i].dispose();
      OrderPriceController[i].dispose();
      ShareValueController[i].dispose();
      focusNodes[i].dispose();
    }
    // for (int i = 0; i < SearchController.length; i++) {
    //   SearchController[i].dispose();
    //   focusNodes[i].dispose();
    // }
    // for (int i = 0; i < OrderPriceController.length; i++) {
    //   OrderPriceController[i].dispose();
    //   focusNodes[i].dispose();
    // }
    // for (int i = 0; i < ShareValueController.length; i++) {
    //   ShareValueController[i].dispose();
    //   focusNodes[i].dispose();
    // }
    // for (int i = 0; i < focusNodes.length; i++) {
    //   focusNodes[i].dispose();
    //   focusNodes[i].dispose();
    // }

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
                  itemBuilder: (context, index) {
                    final NewCompanyModel newcompanyadd =
                        AddmultipleCompanylist[index];
                    print("newcompany,,,,,,,$newcompanyadd");
                    List<String> FilteredCompaniesList = [
                      ...CompanyBSEvalue.keys,
                      ...CompanyNSEvalue.keys
                    ].toSet().toList();
                    print(
                        "FilteredCompaniesList??????????$FilteredCompaniesList");

                    return Container(
                      width: 350,
                      height: 450,
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
                              "Company1:",
                              style: TextStyle(
                                  color: AppColors.primaryColorDark2,
                                  fontSize: 14),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.primaryColorLight2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: GestureDetector(
                                child: TextFieldSearch(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  initialList: FilteredCompaniesList,
                                  controller: SearchController[index],
                                  label: 'Search Company',
                                  textStyle: TextStyle(
                                      color: AppColors.primaryColorDark1,
                                      fontSize: 14),
                                ),
                                onTap: () {
                        SelectedCompany1(SearchController[index].text
                                                      .toString());
                                  setState(() {
                                    print(
                                        "selected comapny...${SearchController[index].text}");
                                  });
                                  
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
                                      style: TextStyle(
                                          color: AppColors.primaryColorDark2,
                                          fontSize: 15),
                                    ),
                                    Container(
                                      width: 150,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                AppColors.primaryColorLight2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none),
                                          value: SelectedBuysellvalue,
                                          items: ['BUY', 'SELL']
                                              .map((String buysell_list) {
                                            return DropdownMenuItem<String>(
                                                value: buysell_list,
                                                child: Center(
                                                  child: Text(
                                                    buysell_list,
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .primaryColorDark1,
                                                        fontSize: 15),
                                                  ),
                                                ));
                                          }).toList(),
                                          onChanged: (newvalue) {
                                            setState(() {
                                              SelectedBuysellvalue = newvalue;
                                            });

                                            // calculate_Order();
                                          }),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Exchange:",
                                      style: TextStyle(
                                          color: AppColors.primaryColorDark2,
                                          fontSize: 15),
                                    ),
                                    Container(
                                      width: 150,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                AppColors.primaryColorLight2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: DropdownButtonFormField(
                                          alignment:
                                              AlignmentDirectional.center,
                                          decoration: InputDecoration(
                                              border: InputBorder.none),
                                          value: SelectedExchangevalue,
                                          items: ['NSE', 'BSE']
                                              .map((String exchange_list) {
                                            return DropdownMenuItem<String>(
                                                alignment:
                                                    AlignmentDirectional.center,
                                                value: exchange_list,
                                                child: Text(
                                                  exchange_list,
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .primaryColorDark1,
                                                      fontSize: 15),
                                                ));
                                          }).toList(),
                                          onChanged: (newvalue2) {
                                            setState(() {
                                              SelectedExchangevalue = newvalue2;
                                              print(
                                                  "selectedropdownvalue.....$SelectedExchangevalue");
                                              SelectedCompany1(
                                                  SelectedExchangevalue
                                                      .toString());
                                            });

                                            CalculateOrder();
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
                                      style: TextStyle(
                                          color: AppColors.primaryColorDark2,
                                          fontSize: 15),
                                    ),
                                    Container(
                                      width: 150,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                AppColors.primaryColorLight2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: CustomTextFormField(
                                        autofocus: true,
                                        keyboardType: TextInputType.number,
                                        focusNode: FocusNode(),
                                        controller: OrderPriceController[index],
                                        icon: Icons.currency_rupee,
                                        errorMessage: 'Order Price',
                                        onchange: (value) {
                                          setState(() {
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
                                      style: TextStyle(
                                          color: AppColors.primaryColorDark2,
                                          fontSize: 15),
                                    ),
                                    Container(
                                      width: 150,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                AppColors.primaryColorLight2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: CustomTextFormField(
                                        autofocus: true,
                                        keyboardType: TextInputType.number,
                                        focusNode: FocusNode(),
                                        controller: ShareValueController[index],
                                        errorMessage: 'Invalid value Share',
                                        onchange: (value) {
                                          setState(() {
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
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "MARGIN FOR DELIVERY:",
                                      style: TextStyle(
                                          color: AppColors.primaryColorDark2,
                                          fontSize: 15),
                                    ),
                                    Container(
                                      width: 170,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                AppColors.primaryColorLight2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                          child: Text(
                                              SelectedBuysellList == "SELL"
                                                  ? '0.00'
                                                  : SelectedBuysellList)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "MARGIN FOR INTRADAY:",
                                      style: TextStyle(
                                          color: AppColors.primaryColorDark2,
                                          fontSize: 15),
                                    ),
                                    Container(
                                      width: 170,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                AppColors.primaryColorLight2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child:
                                          Center(
                                            // child: Text("Margin_intraday")
                                            child:   Text("$MarginIntraday")
                                              ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Total",
                                      style: TextStyle(
                                          color: AppColors.primaryColorDark2,
                                          fontSize: 15),
                                    ),
                                    Container(
                                      width: 130,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                AppColors.primaryColorLight2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child:
                                          Center(
                                            // child: Text("Margin_delivery")
                                             child:  Text("$MarginDelivery")
                                              ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                        width: 130,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  AppColors.primaryColorLight2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                            // child: Text("Margin_intraday")
                                           child:  Text("$MarginIntraday")
                                            )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                    // Card(
                    //     margin:
                    //         EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //     elevation: 4,
                    //     child: Padding(
                    //       padding: EdgeInsets.all(16),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Container(
                    //             width: 350,
                    //             decoration: BoxDecoration(
                    //               border: Border.all(
                    //                   color: AppColors.primaryColorLight2),
                    //               borderRadius: BorderRadius.circular(10),
                    //             ),
                    //             child: GestureDetector(
                    //                 child: TextFieldSearch(
                    //                   decoration: InputDecoration(
                    //                       border: InputBorder.none),
                    //                   initialList: FilteredCompaniesList,
                    //                   controller: SearchController[index],
                    //                   label: 'Search Company',
                    //                   textStyle: TextStyle(
                    //                       color: AppColors.primaryColorDark1,
                    //                       fontSize: 14),
                    //                 ),
                    //                 onTap: () {
                    //                   filterCompanies(String query) {
                    //                     setState(() {
                    //                       List<String> filteredCompanies =
                    //                           FilteredCompaniesList.where(
                    //                                   (company) => company
                    //                                       .toLowerCase()
                    //                                       .contains(query
                    //                                           .toLowerCase()))
                    //                               .toList();
                    //                     });
                    //                   }
                    //                 }),
                    //           ),
                    //           SizedBox(height: 10),

                    //           Row(
                    //               mainAxisAlignment:
                    //                   MainAxisAlignment.spaceBetween,
                    //               children: [
                    //                 Text('Item 1:'),
                    //                 Container(
                    //                    decoration: BoxDecoration(
                    //               border: Border.all(
                    //                   color: AppColors.primaryColorLight2),
                    //               borderRadius: BorderRadius.circular(10),
                    //             ),
                    //                   child: DropdownButtonFormField(
                    //                       decoration: InputDecoration(
                    //                           border: InputBorder.none),
                    //                       value: SelectedBuysellvalue,
                    //                       items: ['BUY', 'SELL'].map((item) {
                    //                         return DropdownMenuItem(
                    //                             value: item,
                    //                             child: Center(
                    //                               child: Text(
                    //                                 item,
                    //                                 style: TextStyle(
                    //                                     color: AppColors
                    //                                         .primaryColorDark1,
                    //                                     fontSize: 15),
                    //                               ),
                    //                             ));
                    //                       }).toList(),
                    //                       onChanged: (newvalue) {
                    //                         setState(() {
                    //                           SelectedBuysellvalue = newvalue;
                    //                        });
                    //                         print(
                    //                             "value onchange2,,,,,,,,,,,,,,${SelectedBuysellvalue}");

                    //                         // if (mounted) {

                    //                         // }
                    //                         CalculateOrder();
                    //                       }),
                    //                 ),
                    //               ]),

                    //           SizedBox(height: 10),

                    //           Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Text('Item 2:'),
                    //               DropdownButtonFormField(
                    //                   alignment: AlignmentDirectional.center,
                    //                   decoration: InputDecoration(
                    //                       border: InputBorder.none),
                    //                   value: SelectedExchangevalue,
                    //                   items: ['NSE', 'BSE'].map((item) {
                    //                     return DropdownMenuItem(
                    //                         alignment:
                    //                             AlignmentDirectional.center,
                    //                         value: item,
                    //                         child: Text(
                    //                           item,
                    //                           style: TextStyle(
                    //                               color: AppColors
                    //                                   .primaryColorDark1,
                    //                               fontSize: 15),
                    //                         ));
                    //                   }).toList(),
                    //                   onChanged: (newvalue) {
                    //                     setState(() {
                    //                       SelectedExchangevalue = newvalue;
                    //                     });
                    //                     print(
                    //                         "value onchange2,,,,,,,,,,,,,,${SelectedExchangevalue}");
                    //                     // if(mounted){
                    //                     //  }
                    //                     CalculateOrder();
                    //                     // SelectedCompany1();
                    //                   }),
                    //             ],
                    //           ),

                    //           SizedBox(height: 10),

                    //         // Row(
                    //         //     mainAxisAlignment:
                    //         //         MainAxisAlignment.spaceBetween,
                    //         //     children: [
                    //         //       Text('Custom Field 1:'),
                    //         //       CustomTextFormField(
                    //         //         autofocus: true,
                    //         //         keyboardType: TextInputType.number,
                    //         //         focusNode: focusNodes[index],
                    //         //         controller: OrderPriceController[index],
                    //         //         icon: Icons.currency_rupee,
                    //         //         errorMessage: 'Order Price',
                    //         //         onchange: (value) {
                    //         //           if (mounted) {
                    //         //             setState(() {
                    //         //               // OrderPriceController[index].text = value;
                    //         //               // CalculateOrder();
                    //         //             });
                    //         //           }
                    //         //           print(
                    //         //               "orderprice..........${OrderPriceController[index].text}");
                    //         //         },
                    //         //       ),

                    //         //       // CustomTextFormFieldWidget(customTextFormField: model.customtextfield1),
                    //         //     ],
                    //         //   ),

                    //           SizedBox(height: 10),

                    //           // Row(
                    //           //   mainAxisAlignment:
                    //           //       MainAxisAlignment.spaceBetween,
                    //           //   children: [
                    //           //     Text('Custom Field 2:'),
                    //           //     CustomTextFormField(
                    //           //       autofocus: true,
                    //           //       keyboardType: TextInputType.number,
                    //           //       focusNode: focusNodes[index],
                    //           //       controller: ShareValueController[index],
                    //           //       errorMessage: 'Invalid value Share',
                    //           //       onchange: (value) {
                    //           //         if (mounted) {
                    //           //           setState(() {
                    //           //             //  OrderPriceController[index].text = value;

                    //           //             // CalculateOrder();
                    //           //           });
                    //           //         }
                    //           //         print(
                    //           //             "sharevalue..........${ShareValueController[index].text}");
                    //           //       },
                    //           //     ),
                    //           //     // CustomTextFormFieldWidget(customTextFormField: model.customtextfield2),
                    //           //   ],
                    //           // ),

                    //           SizedBox(height: 10),

                    //           // Row 6: Margin Delivery
                    //           Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Text('Margin Delivery:'),
                    //               Text(newcompanyadd.textMarginDelivery),
                    //             ],
                    //           ),

                    //           SizedBox(height: 10),

                    //           // Row 7: Margin Intraday
                    //           Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Text('Margin Intraday:'),
                    //               Text(newcompanyadd.textMarginIntraday),
                    //             ],
                    //           ),

                    //           SizedBox(height: 10),

                    //           // Action Buttons (Delete and OnTap)
                    //           Row(
                    //             mainAxisAlignment: MainAxisAlignment.end,
                    //             children: [
                    //               IconButton(
                    //                 onPressed: newcompanyadd.deleteOnTap,
                    //                 icon: Icon(Icons.delete, color: Colors.red),
                    //                 tooltip: 'Delete',
                    //               ),
                    //               IconButton(
                    //                 onPressed: newcompanyadd.onTap1,
                    //                 icon: Icon(Icons.edit, color: Colors.blue),
                    //                 tooltip: 'Edit',
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ));
                  })),
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
                                AddCompany;
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
                                  deleteCompany;
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
