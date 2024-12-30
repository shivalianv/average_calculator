
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

  // String? Selectedcompany= '';
  String? SelectedBuysellvalue = 'BUY';
  String? SelectedExchangevalue = 'NSE';
  double MarginDelivery = 0.0;
  double MarginIntraday = 0.0;
  double TotalMarginDelivery = 0.0;
  double TotalMarginIntraday = 0.0;


  @override
  void initState() {
    setState(() {
      List<String> FilteredCompaniesList =
          [...CompanyBSEvalue.keys, ...CompanyNSEvalue.keys].toSet().toList();
      super.initState();
      print("FilteredCompaniesList.........$FilteredCompaniesList");
    });

    SearchController = List.generate(AddmultipleCompanylist.length, (index) => TextEditingController());
    OrderPriceController = List.generate(AddmultipleCompanylist.length, (index) => TextEditingController());
    ShareValueController = List.generate(AddmultipleCompanylist.length, (index) => TextEditingController());
    focusNodes = List.generate(AddmultipleCompanylist.length, (index) => FocusNode());

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

  Future<void> AddCompany(int index) async {
    setState(() {
    //   if (SearchController.isEmpty || SearchController.length <= index) {
    //     SearchController.add(TextEditingController());
    //   }
    //   if (OrderPriceController.isEmpty ||
    //       OrderPriceController.length <= index) {
    //     OrderPriceController.add(TextEditingController());
    //   }
    //   if (ShareValueController.isEmpty ||
    //       ShareValueController.length <= index) {
    //     ShareValueController.add(TextEditingController());
    //   }
    //   if (focusNodes.isEmpty ||
    //       focusNodes.length <= index) {
    //     focusNodes.add(FocusNode());
    //   }

   
      AddmultipleCompanylist.add(NewCompanyModel(
          textfiledserch: TextFieldSearch(
              label: 'Search Company', controller: SearchController.last),
          customtextfield1: CustomTextFormField(
            focusNode: focusNodes.last,
            keyboardType: TextInputType.emailAddress,
            controller: OrderPriceController.last,
          ),
          customtextfield2: CustomTextFormField(
            focusNode: focusNodes.last,
            keyboardType: TextInputType.emailAddress,
            controller: ShareValueController.last,
          ),
          textMarginDelivery: '0',
          textMarginIntraday: '0',
          deleteOnTap: () => deleteCompany(AddmultipleCompanylist.length - 1)));
      SearchController.add(TextEditingController());
      OrderPriceController.add(TextEditingController());

      ShareValueController.add(TextEditingController());
      focusNodes.add(FocusNode());
      print("Add company.........");
    });
  }

  Future<void> SelectedCompany1(int index, String SelectedExchangevalue) async {
    String selectedCompany = SearchController[0].text.trim();

    print("selected company#####$selectedCompany");

    setState(() {
      if (SelectedExchangevalue == 'NSE') {
        if (SelectedBuysellvalue == "BUY") {
          print("selectedexvalue!!!!!!!!!$selectedCompany");
          OrderPriceController[index].text =
              CompanyNSEvalue[selectedCompany]?.toString() ?? '0.0';
          print(
              "changed CompanyNSEvalue orderpricevalue>>>>>>${OrderPriceController[index].text}");
        } else if (SelectedBuysellvalue == "SELL") {
          OrderPriceController[index].text = '0.0';
          print(
              "changed CompanyNSEvalue orderpricevalue>>>>>>${OrderPriceController[index].text}");
        }
      } else if (SelectedExchangevalue == 'BSE') {
        if (SelectedBuysellvalue == "BUY") {
          print("selectedexvalue!!!!!!!!!$selectedCompany");
          OrderPriceController[index].text =
              CompanyBSEvalue[selectedCompany]?.toString() ?? '0.0';
          print(
              "changed CompanyBSEvalue orderpricevalue>>>>>>>>>>>>${OrderPriceController[index].text}");
        } else if (SelectedBuysellvalue == "SELL") {
          OrderPriceController[index].text = '0.0';
        }
      }
    });
  }

  Future<void> CalculateOrder() async {
    if (OrderPriceController.isEmpty ||
        ShareValueController.isEmpty ) {
      print("Error: OrderPriceController or ShareValueController is empty");
      return;
    }

    List<TextEditingController> Ordervalue = OrderPriceController;
    List<TextEditingController> Sharevalue = ShareValueController;
    print("print Oredervalue>>>>>>$Ordervalue");
    print("print Sharevalue<<<<<<<<<<<$Sharevalue");

    List<double> MarginDeliveryList = [];
    List<double> MarginIntradayList = [];
    List<String> SelectedBuysellList = [];
    print("print MarginDeliveryList>>>>>>$MarginDeliveryList");
    print("print MarginDeliveryList!!!!!!!!!!!$MarginIntradayList");
    print("print SelectedBuysellList<<<<<<<<<<<$SelectedBuysellList");

    double parseToDouble(String input) {
      String cleanedInput = input.replaceAll(RegExp(r'[^0-9.]'), '');
      return double.tryParse(cleanedInput) ?? 0.0;
    }

    for (int i = 0; i < Ordervalue.length; i++) {
      double OrderPrice = parseToDouble(Ordervalue[i].text);
      double ShareValue = parseToDouble(Sharevalue[i].text);
      print("print OrderPrice%%%%%%%%%%%$OrderPrice");
      print("print Sharevalue@@@@@@$Sharevalue");

      double RoundDelivery = OrderPrice * ShareValue;
      MarginDelivery = double.parse(RoundDelivery.toStringAsFixed(2));
      MarginDeliveryList.add(MarginDelivery);
      print("margindelivery,,,,,,,,,,$MarginDelivery");
      print("margindeliveryList,,,,,,,,,,$MarginDeliveryList");
      print("calculate margindelivery??????????$RoundDelivery");

      double RoundIntraday = OrderPrice * ShareValue * (20 / 100);
      MarginIntraday = double.parse(RoundIntraday.toStringAsFixed(2));

      MarginIntradayList.add(MarginIntraday);
      print(" marginintraday,,,,,,,,,,$MarginIntraday");
      print(" marginintradayList,,,,,,,,,,$MarginIntradayList");
      print("calculated marginintrada/////////$RoundIntraday");

      print("OrderPriceController[$i]: ${Ordervalue[i].text}");
      print("ShareValueController[$i]: ${Sharevalue[i].text}");
    }

    TotalMarginDelivery =
        MarginDeliveryList.fold(0.0, (sum, Element) => sum + Element);
    TotalMarginIntraday =
        MarginIntradayList.fold(0.0, (sum, Element) => sum + Element);
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
        focusNodes.removeAt(index);
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
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                AddCompany(10);
              });
            },
          ),
        ],
        backgroundColor: AppColors.primaryBackgroundColor,
      ),
      body: 
      ListView.builder(
        shrinkWrap: true,
          itemCount: AddmultipleCompanylist.length,
          itemBuilder: (context, index) {
            NewCompanyModel newcompanyadd = AddmultipleCompanylist[index];
            print("newcompany,,,,,,,$newcompanyadd");
            List<String> FilteredCompaniesList = [
              ...CompanyBSEvalue.keys,
              ...CompanyNSEvalue.keys
            ].toSet().toList();
            print("FilteredCompaniesList??????????$FilteredCompaniesList");

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColorLight2),
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
                            "Company1:",
                            style: TextStyle(
                                color: AppColors.primaryColorDark2,
                                fontSize: 14),
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
                              Border.all(color: AppColors.primaryColorLight2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          child: 
                          //  CustomTextFormField(
                          //         autofocus: true,
                          //         keyboardType: TextInputType.emailAddress,
                          //         focusNode: FocusNode(),
                          //         controller: SearchController[index],
                          //         onchange: (value) {
                          //           DropdownButtonFormField(
                          //           decoration: InputDecoration(
                          //               border: InputBorder.none),
                          //           value: SearchController[index],
                          //           items: FilteredCompaniesList
                          //               .map((String searchcompany) {
                          //             return DropdownMenuItem<String>(
                          //                 value: searchcompany,
                          //                 child: Center(
                          //                   child: Text(
                          //                     searchcompany,
                          //                     style: TextStyle(
                          //                         color: AppColors
                          //                             .primaryColorDark1,
                          //                         fontSize: 15),
                          //                   ),
                          //                 ));
                          //           }).toList(),
                          //           onChanged: (newvalue) {
                          //             setState(() {
                          //               Selectedcompany = newvalue.toString();
                          //               SearchController[index].text=newvalue.toString();
                          //               print(
                          //                   "selectedropdownvalue.....$Selectedcompany");
                          //               SelectedCompany1(index,
                          //                   SelectedExchangevalue ?? '0.0');
                          //               // SelectedCompany1(SelectedBuysellvalue);
                          //             });
                          //             CalculateOrder();
                          //           });
                          //           // setState(() {
                          //           //   SearchController[index].text = value;
                          //           //   SelectedCompany1(index,
                          //           //       SelectedExchangevalue ?? '0.0');
                          //           //   CalculateOrder();
                          //           // });
                          //         },
                          //       ),
                          TextFieldSearch(
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
                            
                            SelectedCompany1(
                                index, SelectedExchangevalue ?? '0.0');
                           
                            setState(() {
                              print(
                                  "selected comapny...${SearchController[index].text}");
                            });
                          },
                        ),
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
                                style: TextStyle(
                                    color: AppColors.primaryColorDark2,
                                    fontSize: 15),
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
                                        SelectedBuysellvalue = newvalue!;
                                        print(
                                            "selectedropdownvalue.....$SelectedBuysellvalue");
                                        SelectedCompany1(index,
                                            SelectedExchangevalue ?? '0.0');
                                        // SelectedCompany1(SelectedBuysellvalue);
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
                                style: TextStyle(
                                    color: AppColors.primaryColorDark2,
                                    fontSize: 15),
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
                                                color:
                                                    AppColors.primaryColorDark1,
                                                fontSize: 15),
                                          ));
                                    }).toList(),
                                    onChanged: (newvalue2) {
                                      setState(() {
                                        SelectedExchangevalue = newvalue2!;
                                        print(
                                            "selectedropdownvalue.....$SelectedExchangevalue");
                                        // SelectedCompany1(SelectedExchangevalue);
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
                                style: TextStyle(
                                    color: AppColors.primaryColorDark2,
                                    fontSize: 15),
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
                                  focusNode: FocusNode(),
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
                                style: TextStyle(
                                    color: AppColors.primaryColorDark2,
                                    fontSize: 15),
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
                                style: TextStyle(
                                    color: AppColors.primaryColorDark2,
                                    fontSize: 15),
                              ),
                              Container(
                                width: 170,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(child: Text("$MarginDelivery")),
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
                                style: TextStyle(
                                    color: AppColors.primaryColorDark2,
                                    fontSize: 15),
                              ),
                              Container(
                                width: 170,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text("$MarginIntraday")),
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
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(child: Text("$TotalMarginDelivery")),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                  width: 130,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryColorLight2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:
                                      Center(child: Text("$TotalMarginIntraday"))),
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
                ),
              ),
            );
          }),
    );
  }
}
