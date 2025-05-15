import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';
import '../../../widgets/text/app_text.dart';
import '../../../widgets/text/read_more_text.dart';

class ExperienceCard extends StatelessWidget {
  final String role, description, duration, logo;
  final Color? bgColor;

  const ExperienceCard({
    super.key,
    required this.role,
    required this.description,
    required this.duration,
    required this.logo,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.wSize(24),
        vertical: AppDimens.hSize(40),
      ),
      decoration: BoxDecoration(
        color: bgColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.zinc5007171, width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: AppDimens.hSize(56),
                    width: AppDimens.wSize(42),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(logo),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: AppDimens.wSize(24)),
                  AppTextSora(
                    text: role,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: AppDimens.fSize(24),
                  ),
                ],
              ),
              AppTextSora(
                text: duration,
                color: AppColors.white.withValues(alpha: 0.9),
                fontWeight: FontWeight.w600,
                fontSize: AppDimens.fSize(14),
              ),
            ],
          ),
          SizedBox(height: AppDimens.hSize(28)),
          ReadMoreTextWidget(
            text: description,
            textColor: AppColors.zinc300D4D,
            fontSize: AppDimens.fSize(14),
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}