import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/widgets/text/read_more_text.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';
import '../../../constants/app_icons.dart';
import '../../../constants/app_strings.dart';
import '../../../widgets/text/app_text.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDimens.isDesktop
        ? Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.wSize(80),
            vertical: AppDimens.hSize(60),
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.blueGrey, width: 0.5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    SizedBox(height: AppDimens.hSize(120)),
                    SvgPicture.asset(AppIcons.aboutMeIcon),
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppDimens.hSize(20),
                      ),
                      child: Row(
                        children: [
                          AppTextSora(
                            text: "About ",
                            fontWeight: FontWeight.w400,
                            fontSize: AppDimens.fSize(58),
                            letterSpacing: 1.2,
                          ),
                          AppTextSora(
                            text: "Me",
                            fontWeight: FontWeight.w800,
                            fontSize: AppDimens.fSize(58),
                            letterSpacing: 1.2,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      AppStrings.aboutMeText1,
                      style: TextStyle(
                        fontFamily: "Sora",
                        color: AppColors.zinc5007171,
                        fontSize: AppDimens.fSize(14),
                        height: 2,
                      ),
                    ),
                    SizedBox(height: AppDimens.hSize(20)),
                    Text(
                      AppStrings.aboutMeText2,
                      style: TextStyle(
                        fontFamily: "Sora",
                        color: AppColors.zinc5007171,
                        fontSize: AppDimens.fSize(14),
                        height: 2,
                      ),
                    ),
                    SizedBox(height: AppDimens.hSize(20)),
                    Text(
                      AppStrings.aboutMeText3,
                      style: TextStyle(
                        fontFamily: "Sora",
                        color: AppColors.zinc5007171,
                        fontSize: AppDimens.fSize(14),
                        height: 2,
                      ),
                    ),
                    SizedBox(height: AppDimens.hSize(20)),
                    Text(
                      AppStrings.aboutMeText4,
                      style: TextStyle(
                        fontFamily: "Sora",
                        color: AppColors.zinc5007171,
                        fontSize: AppDimens.fSize(14),
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    ///Mobile
        : Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.wSize(16),
            vertical: AppDimens.hSize(24),
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.blueGrey, width: 0.5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  //color: Colors.blue,
                  height: AppDimens.hSize(400),
                  child: SvgPicture.asset(AppIcons.aboutMeIcon)),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppDimens.hSize(20),
                ),
                child: Row(
                  children: [
                    AppTextSora(
                      text: "About ",
                      fontWeight: FontWeight.w400,
                      fontSize: AppDimens.fSize(28),
                      letterSpacing: 1.2,
                    ),
                    AppTextSora(
                      text: "Me",
                      fontWeight: FontWeight.w800,
                      fontSize: AppDimens.fSize(28),
                      letterSpacing: 1.2,
                    ),
                  ],
                ),
              ),
              ReadMoreTextWidget(
                text: "${AppStrings.aboutMeText1}\n\n${AppStrings.aboutMeText2}\n\n${AppStrings.aboutMeText3}\n\n${AppStrings.aboutMeText4}",
                maxLines: 12,
                textStyle: TextStyle(
                  fontFamily: "Sora",
                  color: AppColors.zinc5007171,
                  fontSize: AppDimens.fSize(14),
                  height: 2,
                ),
              ),
            ],
          ),
        );
  }
}
