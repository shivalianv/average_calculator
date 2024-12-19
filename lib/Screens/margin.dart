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
  final TextEditingController Order_PriceController = TextEditingController();
  final TextEditingController Share_valueController = TextEditingController();
  final TextEditingController Margin_for_Delivery = TextEditingController();
  final TextEditingController Margin_for_Intraday = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  @override
  void initState() {
    filteredCompanies = companies;
    searchController.addListener(print_selectedcompany);
    calculate_Order();
    Share_valueController.addListener(calculate_Order);
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

  String selected_company = '';
  String? selected_value = 'BUY'; //option
  String? selected_value2 = 'NSE'; //option2
  List<String> Option = [
    'BUY',
    'SELL'
  ]; //if selected value sell than margin for delivery value is 0.0
  List<String> Option2 = [
    'NSE',
    'BSE'
  ]; //change value of order price acording nse and bse
  double Margin_delivery = 0.0;
  double Margin_intraday = 0.0;

  double order_pr = 0.0;

  void print_selectedcompany() {
    //for selected NSE/BSE option
    double companyvalue = 0.0;
    print("selected company ${searchController.text}");
    String selectedCompany = searchController.text.trim();

    if (selected_value2 == 'NSE') {
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
      print("Selected company......:$selectedCompany");
      print("Selected value:$companyvalue");
      Order_PriceController.text = companyvalue.toStringAsFixed(2);
    } else {
      Order_PriceController.text = '';
    }

    
    setState(() {});
  }

  void calculate_Order() {
    //margin and intraday calculation

    String order_value = Order_PriceController.text;
    String share_v = Share_valueController.text;

    double parseToDouble(String input1) {
      String cleanedInput1 = input1.replaceAll(RegExp(r'[^0-9.]'), '');
      return double.tryParse(cleanedInput1) ?? 0.0;
    }

    double Order_Price = parseToDouble(order_value);
    double Share_value = parseToDouble(share_v);

 //for selected BUY/SELL value
    
    if (selected_value == 'SELL') {
      Order_Price = 0.0;
    }
    setState(() {
      order_pr = Order_Price;
    });
    //calculation 
print("$Order_Price");
    // double round_delivery = Order_Price * Share_value;

    // Margin_delivery = double.parse(round_delivery.toStringAsFixed(3));

    // // print("Margin for Delivery:$Margin_delivery");

    // double round_intraday = Order_Price * Share_value * (20 / 100);

    // Margin_intraday = double.parse(round_intraday.toStringAsFixed(2));

   
  }

  void filterCompanies(String query) {
    setState(() {
      filteredCompanies = companies
          .where(
              (company) => company.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  ///
  ///
  // void selected_comp() {
  //   double price_v = 0.0;

  //   if (selected_value2 == 'NSE') {
  //     //NSE
  //     price_v = Company_NSEvalue[selected_company] ?? 0.0;
  //     print(".....$price_v");
  //   } else {
  //     //BSE
  //     price_v = Company_BSEvalue[selected_company] ?? 0.0;
  //     print("??????????$price_v");
  //   }
  //   if (selected_value == 'SELL') {
  //     price_v = 0.0;
  //   }

  //   setState(() {
  //     order_pr = price_v;
  //   });

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    Order_PriceController.dispose();
    Share_valueController.dispose();
    searchController.dispose();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
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
                            color: AppColors.primaryColorDark2, fontSize: 14),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.primaryColorLight2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        //    Container(
                        //   decoration: BoxDecoration(
                        //     border:
                        //         Border.all(color: AppColors.primaryColorLight2),
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        //   child: CustomTextFormField(
                        //     autofocus: true,
                        //     keyboardType: TextInputType.emailAddress,
                        //     focusNode: focusNode3,
                        //     controller: searchController,
                        //     icon: Icons.search,
                        //     errorMessage: 'Order Price',
                        //     onClick: () {
                        //       setState(() {
                        //         _isSearching = true;
                        //       });
                        //       filterCompanies(searchController.text);

                        //     },
                        //   ),
                        // ),
                        // if (_isSearching)
                        //           Expanded(
                        //               child: filteredCompanies.isEmpty
                        //                   ? Center(
                        //                       child: Text("company not found "),
                        //                     )
                        //                   : ListView.builder(
                        //                       itemCount: filteredCompanies.length,
                        //                       itemBuilder: (context, index) {
                        //                         return ListTile(
                        //                           title: Text(
                        //                               filteredCompanies[index]),
                        //                           onTap: () {
                        //                              searchController.text =filteredCompanies[index];
                        //                             print(
                        //                                 "${filteredCompanies[index]}");
                        //                           },
                        //                         );
                        //                       })),
                        child: GestureDetector(
                          child: TextFieldSearch(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            initialList: filteredCompanies,
                            controller: searchController,
                            label: 'Search Company',
                          ),
                          onTap: () {
                            setState(() {
                              filterCompanies(searchController.text);

                              // handleSelection(searchController.text);
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
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                    value: selected_value,
                                    items: Option.map((String Option) {
                                      return DropdownMenuItem<String>(
                                          value: Option,
                                          child: Center(
                                            child: Text(
                                              Option,
                                              style: TextStyle(
                                                  color: AppColors
                                                      .primaryColorDark2,
                                                  fontSize: 15),
                                            ),
                                          ));
                                    }).toList(),
                                    onChanged: (newvalue) {
                                      setState(() {
                                        selected_value == newvalue!;
                                      });
                                      Margin_delivery = 0.0; //clear old value

                                      print_selectedcompany();
                                      calculate_Order();
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
                                    value: selected_value2,
                                    items: Option2.map((String Option2) {
                                      return DropdownMenuItem<String>(
                                          alignment:
                                              AlignmentDirectional.center,
                                          value: Option2,
                                          child: Text(
                                            Option2,
                                            style: TextStyle(
                                                color:
                                                    AppColors.primaryColorDark2,
                                                fontSize: 15),
                                          ));
                                    }).toList(),
                                    onChanged: (newvalue2) {
                                      setState(() {
                                        selected_value2 = newvalue2!;
                                      });
                                      Order_PriceController.text =
                                          ""; //clear old value

                                      print_selectedcompany();
                                      calculate_Order();
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
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:
                                    // Center(child: Text("$order_pr"))
                                    CustomTextFormField(
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
                                  focusNode: focusNode2,
                                  controller: Share_valueController,
                                  // icon: Icons.currency_rupee,
                                  errorMessage: 'Invalid value Share',
                                  onchange: (value) {
                                    setState(() {
                                      calculate_Order();
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
                                      color: AppColors.primaryColorLight2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(child: Text("$Margin_delivery")),
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
                                child: Center(child: Text("$Margin_intraday")),
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
                                child: Center(child: Text("$Margin_delivery")),
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
                                      Center(child: Text("$Margin_intraday"))),
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
              // Container(
              //     width: 350,
              //     height: 250,
              //     decoration: BoxDecoration(
              //       border: Border.all(color: AppColors.primaryColorLight3),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(10.0),

              //     )),
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
                              // handleSelection(searchController.text);

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

                          // setState(() {
                          //   _percentage1 = minimumvalue1;
                          //   _percentage2 = minimumvalue2;
                          //   _percentage3 = minimumvalue3;
                          // });
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
