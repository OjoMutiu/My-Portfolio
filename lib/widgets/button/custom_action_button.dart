import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimensions.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton(
      {super.key,
        required this.btnText,
        required this.onPressed,
        this.icon,
        this.inActive,
        this.bgColor,
        this.width,
        this.textColor,
        this.fontSize,
        this.textIconSpace,
        this.paddingRight,
        this.paddingLeft,
        this.spaceBtw, this.height});
  final String btnText;
   final void Function()? onPressed;
  final String? icon;
  final double? fontSize;
  final bool? spaceBtw;
  final double? paddingRight;
  final double? paddingLeft;
  final double? textIconSpace;
  final bool? inActive;
  final double? width, height;
  final Color? bgColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
      child: Container(
        height: height ?? AppDimens.hSize(56),
        width: width,
        // padding: EdgeInsets.only(
        //     left: paddingLeft ?? AppDimens.wSize(20),
        //     right: paddingRight ?? AppDimens.wSize(20),
        //     top: AppDimens.hSize(10),
        //     bottom: AppDimens.hSize(10)),
        decoration: BoxDecoration(
            color: bgColor ??
                (inActive == true ? Colors.blueGrey : AppColors.blackColor),
            borderRadius: BorderRadius.circular(4)),
        child: Center(
          child: Row(
            mainAxisAlignment: spaceBtw == true
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                btnText,
                style: GoogleFonts.manrope(
                    color: textColor ?? AppColors.white,
                    fontSize: fontSize ?? AppDimens.fSize(16),
                    fontWeight: FontWeight.w600),
              ),
              if(icon != null) SizedBox(
                width: AppDimens.wSize(textIconSpace ?? 10),
              ),
              icon != null
                  ? SvgPicture.asset(
                icon!,
                colorFilter: ColorFilter.mode(textColor ?? AppColors.white, BlendMode.srcIn,),
              )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}