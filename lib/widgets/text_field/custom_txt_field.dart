import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimensions.dart';

class CustomTxtField extends StatelessWidget {
  const CustomTxtField({
    super.key,
    required this.controller,
    this.hintText,
    this.maxLines,
    this.focusNode,
  });

  final TextEditingController controller;
  final String? hintText;
  final int? maxLines;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    //FocusNode focusNode = FocusNode();
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      focusNode: focusNode,
      onChanged: (val) {},
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.blackColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.blackColor, width: 2),
        ),
        contentPadding: EdgeInsets.only(
          left: AppDimens.wSize(12),
          top: AppDimens.hSize(20),
        ),
        hintText: hintText ?? "",
        hintStyle: TextStyle(
          fontFamily: "Sora",
          fontSize: AppDimens.fSize(14),
          color: AppColors.zinc5007171,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
