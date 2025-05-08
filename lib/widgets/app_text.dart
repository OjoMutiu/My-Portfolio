import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_dimensions.dart';

import '../constants/app_colors.dart';

class AppTextSora extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize, letterSpacing;
  final int? maxLines;
  final Color? color;
  final TextOverflow? textOverflow;

  const AppTextSora({
    super.key,
    required this.text,
    this.fontWeight,
    this.fontSize,
    this.letterSpacing,
    this.color, this.maxLines, this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
        fontFamily: "Sora",
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: AppDimens.fSize(fontSize ?? 14),
        color: color ?? AppColors.blackColor,
        letterSpacing: letterSpacing,

      ),
    );
  }
}
