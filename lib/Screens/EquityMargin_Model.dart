
import 'package:stock_average_calculator/Utils/custom_textformfield.dart';
import 'package:textfield_search/textfield_search.dart';


class NewCompanyModel {
  final TextFieldSearch textfiledserch;
  
  final CustomTextFormField customtextfield1;
  final CustomTextFormField customtextfield2;
  final String textMarginDelivery;
  final String textMarginIntraday;
  Function()? deleteOnTap;
  Function()? onTap1;
  final Function(String)? onSearchChanged; 

  NewCompanyModel({
    required this.textfiledserch,
    
    required this.customtextfield1,
    required this.customtextfield2,
    required this.textMarginDelivery,
    required this.textMarginIntraday,
    this.deleteOnTap,
    this.onTap1,
    this.onSearchChanged, 
  });

  // toJson method to serialize
  // Map<String, dynamic> toJson() {
  //   return {
  //     'items1': items1,
  //     'items2': items2,
  //     'textMarginDelivery': textMarginDelivery,
  //     'textMarginIntraday': textMarginIntraday,
  //     'customtextfield1': customtextfield1,
  //     'customtextfield2': customtextfield2,

  //   };
  // }

  // fromJson method to deserialize
  // factory NewCompanyModel.fromJson(Map<String, dynamic> json) {
  //   return NewCompanyModel(
  //     textfiledserch: json['textfiledserch'],
  //     items1: List<String>.from(json['items1']),
  //     items2: List<String>.from(json['items2']),
  //     textMarginDelivery: json['textMarginDelivery'],
  //     textMarginIntraday: json['textMarginIntraday'],
  //     customtextfield1: json['customtextfield1'],
  //     customtextfield2: json['customtextfield2'], 
  //     // onchange1: ,
  //   );
  // }
}
