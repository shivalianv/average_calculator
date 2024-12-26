import 'package:flutter/material.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';
import 'package:stock_average_calculator/Utils/custom_textformfield.dart';
import 'package:textfield_search/textfield_search.dart';

class Add_newCompany extends StatefulWidget {
  final TextFieldSearch textfiledserch;
  final List<String> items1;
  final List<String> items2;
  late final dynamic value1;
  late final dynamic value2;
  Function(dynamic)? onchanged1;
  Function(dynamic)? onchanged2;
  final CustomTextFormField customtextfield1;
  final CustomTextFormField customtextfield2;
  final String TextMarginDelivery;
  final String TextmarginIntraday;
  Function()? DeleteOntap;
  Function()? ontap1;

  Add_newCompany(
      {super.key,
      required this.textfiledserch,
      required this.ontap1,
      required this.items1,
      required this.items2,
      required this.value1,
      required this.value2,
      required this.onchanged1,
      required this.onchanged2,
      required this.customtextfield1,
      required this.customtextfield2,
      required this.TextMarginDelivery,
      required this.TextmarginIntraday,
      required this.DeleteOntap});

  @override
  State<Add_newCompany> createState() => _Add_newCompanyState();
}

class _Add_newCompanyState extends State<Add_newCompany> {
  List<String> FilteredCompaniesList = [];

  @override
  void initState() {
    FilteredCompaniesList = companies;
    super.initState();
  }

  List<String> companies = [
    "Swiggy Ltd.",
    "Enviro infra Engineers Ltd.",
    "Tata Motors Ltd"
  ];

  void filterCompanies(String query) {
    setState(() {
      FilteredCompaniesList = companies
          .where(
              (company) => company.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
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
                  onTap: widget.ontap1, child: widget.textfiledserch),
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
                          items: ['BUY', 'SELL'].map((item) {
                            return DropdownMenuItem(
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
                          onChanged: widget.onchanged1),
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
                          items: ['NSE', 'BSE'].map((item) {
                            return DropdownMenuItem(
                                alignment: AlignmentDirectional.center,
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                      color: AppColors.primaryColorDark1,
                                      fontSize: 15),
                                ));
                          }).toList(),
                          onChanged: widget.onchanged2),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
