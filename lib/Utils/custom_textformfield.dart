// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController? controller;
  String? labelText;
  String? hintText;
  IconData? icon;
  VoidCallback? onClick;
  String? errorMessage;
  bool obscureText = false;
  FocusNode focusNode;
  TextInputType keyboardType;
  bool autofocus = false;
  Function(String)? onchange;

  CustomTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.icon,
    this.hintText,
    this.onClick,
    this.errorMessage,
    this.onchange,
    this.obscureText = false,
    this.autofocus = false,
    required this.focusNode,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          color: AppColors.primaryColorDark,
          fontSize: 15,
        ),
        strutStyle: StrutStyle(),
        textAlign: TextAlign.center,
        controller: controller,
        focusNode: focusNode,
        autofocus: autofocus,
        textInputAction: TextInputAction.next,
        keyboardType: keyboardType,
        onChanged: onchange,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,

          // enabledBorder: OutlineInputBorder(
          //   borderRadius: const BorderRadius.all(
          //     Radius.circular(5.0),
          //   ),
          //   borderSide: BorderSide(color: AppColors.primaryColorDark2),
          // ),
          // border:  OutlineInputBorder(
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(5.0),
          //   ),
          //   borderSide: BorderSide(color:  AppColors.primaryColorDark2),
          // ),
          labelText: labelText,
          prefixIcon: IconButton(
            iconSize: 15,
              onPressed: onClick,
              icon: Icon(icon, color: AppColors.primaryColorDark2)),
        ),
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $errorMessage';
          }
          return null;
        },
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.isLoading,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.primaryColor
       
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: AppColors.primaryColorLight3,
                    fontSize: 16,
                    fontFamily: 'Sora',
                       fontWeight: FontWeight.w600,

                  ),
                ),
        ),
      ),
    );
  }
}

// class SvgPictureClass extends StatelessWidget {
//   final String stockSymbol;

//   SvgPictureClass({required this.stockSymbol});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
//       child: CircleAvatar(
//         child: ClipOval(
//           child: FutureBuilder(
//             future: _checkSvgUrl("https://ekyc.arhamshare.com/img//trading_app_logos//$stockSymbol.svg"),
//             builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator();
//               } else if (snapshot.hasError || !snapshot.data!) {
//                 return Icon(Icons.error, size: 50);
//               } else {
//                 return SvgPicture.network(
//                   "https://ekyc.arhamshare.com/img//trading_app_logos//$stockSymbol.svg",
//                   fit: BoxFit.fill,
//                   height: 50,
//                   semanticsLabel: 'Network SVG',
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Future<bool> _checkSvgUrl(String url) async {
//     try {
//       final response = await HttpClient().getUrl(Uri.parse(url));
//       final result = await response.close();
//       return result.statusCode == 200;
//     } catch (e) {
//       return false;
//     }
//   }
// }



// class AnimatedDoughnutChart extends StatefulWidget {
//   const AnimatedDoughnutChart({Key? key}) : super(key: key);

//   @override
//   State<AnimatedDoughnutChart> createState() => _AnimatedDoughnutChartState();
// }

// class _AnimatedDoughnutChartState extends State<AnimatedDoughnutChart> {
//   late List<_ChartData> data;

//   @override
//   void initState() {
//     super.initState();
//     data = [
//       _ChartData('Equity', 23, const Color(0xFF7086FD)),
//       _ChartData('MF', 25, const Color(0xFF6FD195)),
//       _ChartData('Bond', 35, const Color(0xFF07DBFA)),
//       _ChartData('Liquid', 10, const Color(0xFFFFAE4C)),
//       _ChartData('SGB', 10, const Color(0xFF1F94FF)),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Center(
//         child: SfCircularChart(
//           backgroundColor: Colors.transparent,
//           legend: Legend(
//             textStyle: const TextStyle(color: Colors.black),
//             iconHeight: 7,
//             iconWidth: 7,
//             isVisible: true,
//             overflowMode: LegendItemOverflowMode.wrap,
//             position: LegendPosition.right,
//           ),
//           series: <CircularSeries>[
//             // Doughnut Chart Series
//             DoughnutSeries<_ChartData, String>(
//               legendIconType: LegendIconType.circle,
//               dataSource: data,
//               dataLabelMapper: (_ChartData data, _) => data.category,
//               xValueMapper: (_ChartData data, _) => data.category,
//               yValueMapper: (_ChartData data, _) => data.value,
//               pointColorMapper: (_ChartData data, _) => data.color,
//               dataLabelSettings: const DataLabelSettings(
//                 alignment: ChartAlignment.far,
//                 labelIntersectAction: LabelIntersectAction.shift,
//             //  /   connectorLineSettings: ConnectorLineSettings(length: '0%'),
//                 isVisible: true,labelPosition: ChartDataLabelPosition.outside,
//                 labelAlignment: ChartDataLabelAlignment.outer,
//                 textStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
//               ),
//               enableTooltip: true,
//               animationDuration: 1500, // Animation for doughnut
//               explode: true, // Explodes the first segment
//               explodeIndex: 0, // Default exploded section
//               innerRadius: '45%', // This makes it a doughnut chart
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ChartData {
//   final String category;
//   final double value;
//   final Color color;

//   _ChartData(this.category, this.value, this.color);
// }

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: AnimatedDoughnutChart(),
//   ));
// }