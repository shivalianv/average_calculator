import 'package:flutter/material.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';
import 'package:stock_average_calculator/Utils/custom_textformfield.dart';
import 'package:textfield_search/textfield_search.dart';

class Add_newCompany extends StatefulWidget {
  final TextFieldSearch textfiledserch;

  final CustomTextFormField customtextfield1;
  final CustomTextFormField customtextfield2;
  final List<String> items1;
  final List<String> items2;
  final dynamic value1;
  final dynamic value2;
  final String TextMarginDelivery;
  final String TextmarginIntraday;
  // Function()? AddOntap;
  Function()? DeleteOntap;

  Function(dynamic)? onchanged1;
  Function(dynamic)? onchanged2;

  Add_newCompany(
      {super.key,
      required this.textfiledserch,
      required this.value2,
      required this.TextMarginDelivery,
      required this.TextmarginIntraday,
      required this.items1,
      required this.value1,
      required this.onchanged1,
      required this.onchanged2,
      required this.items2,
      required this.customtextfield1,
      required this.customtextfield2,
      // required this.AddOntap,
      required this.DeleteOntap});

  @override
  State<Add_newCompany> createState() => _Add_newCompanyState();
}

class _Add_newCompanyState extends State<Add_newCompany> {
  TextEditingController SearchController = TextEditingController();

  List<String> companies = [
    "Swiggy Ltd.",
    "Enviro infra Engineers Ltd.",
    "Tata Motors Ltd"
  ];
  String? SelectedBuysellvalue = 'BUY';
  String? SelectedExchangevalue = 'NSE';

  List<String> FilteredCompaniesList = [];

  void filterCompanies(String query) {
    setState(() {
      FilteredCompaniesList = companies
          .where(
              (company) => company.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  // final TextEditingController OrderPriceController = TextEditingController();
  // final TextEditingController ShareValueController = TextEditingController();
  List<TextEditingController> OrderPriceController = [];
  List<TextEditingController> ShareValueController = [];

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();

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
                      filterCompanies(SearchController.text);
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
                            SelectedBuysellvalue != newvalue;
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
                            SelectedExchangevalue != newvalue;
                            if (widget.onchanged2 != null) {
                              widget.onchanged2!(newvalue);
                            }
                          });

                          // SelectedCompany1();
                          // CalculateOrder();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Margin For Delivery:",
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
                      child:
                          Center(child: Text(widget.TextMarginDelivery ?? "")),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      "Margin For Intraday:",
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
                      child:
                          Center(child: Text(widget.TextmarginIntraday ?? "")),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: widget.DeleteOntap, icon: Icon(Icons.delete)),
                // IconButton(onPressed: widget.AddOntap, icon: Icon(Icons.add))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
