
import 'package:flutter/material.dart';
import 'package:stock_average_calculator/Utils/custom_textformfield.dart';


class NewCompanyModel {
  final CustomTextFormField customtextseach;
  // final TextFieldSearch textfiledserch;
  
  final CustomTextFormField customtextfield1;
  final CustomTextFormField customtextfield2;
  final String textMarginDelivery;
  final String textMarginIntraday;
  Function()? deleteOnTap;
  Function()? onTap1;
  final Function(String)? onSearchChanged; 

  NewCompanyModel({
    required this.customtextseach,    
    required this.customtextfield1,
    required this.customtextfield2,
    required this.textMarginDelivery,
    required this.textMarginIntraday,
    this.deleteOnTap,
    this.onTap1,
    this.onSearchChanged, 
  });

  
}

// class NewCompanyModel {
//   CustomTextFormField customtextseach;
//   CustomTextFormField customtextfield1;
//   CustomTextFormField customtextfield2;
//   String MarginDelivery;
//   String MarginIntraday;
//   VoidCallback deleteOnTap;

//   NewCompanyModel({
//     required this.customtextseach,
//     required this.customtextfield1,
//     required this.customtextfield2,
//     required this.MarginDelivery,
//     required this.MarginIntraday,
//     required this.deleteOnTap,
//   });
// }