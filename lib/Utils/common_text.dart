import 'package:flutter/cupertino.dart';
import 'package:stock_average_calculator/Utils/app_color_const.dart';

class CommonText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final double? height;
  final TextBaseline? textBaseline;
  final FontStyle? fontStyle;
  final int? maxLines;
  final TextAlign? textAlign;

  CommonText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.height,
    this.textBaseline,
    this.fontStyle,
    this.maxLines,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? null,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? AppColors.primaryColorDark,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
        overflow: overflow ?? TextOverflow.ellipsis,
        height: height,
        textBaseline: textBaseline,
        fontStyle: fontStyle,
      ),
    );
  }
}