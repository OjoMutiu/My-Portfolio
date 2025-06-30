import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_strings.dart';
import '../../../widgets/text/app_text.dart';
import '../widgets/experience_card.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> experiences = [
      {
        "role": "Mobile Application Developer at Credevnet",
        "description": AppStrings.creDevNetRoleDescription,
        "duration": "Nov 2023 - Present",
        "logo": AppImages.creDevNetLogo,
      },
      {
        "role": "Lead Flutter Developer at Namibra",
        "description": AppStrings.namibraRoleDescription,
        "duration": "Sep 2023 - Apr 2025",
        "logo": AppImages.namibraLogo,
      },
    ];

    return AppDimens.isDesktop
        ? Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.wSize(80),
            vertical: AppDimens.hSize(60),
          ),
          decoration: BoxDecoration(
            color: AppColors.blackColor,
            border: Border(
              bottom: BorderSide(color: Colors.blueGrey, width: 0.5),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextSora(
                    text: "My ",
                    fontWeight: FontWeight.w400,
                    fontSize: AppDimens.fSize(58),
                    letterSpacing: 1.2,
                    color: AppColors.white,
                  ),
                  AppTextSora(
                    text: "Experience ",
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.fSize(58),
                    letterSpacing: 1.2,
                    color: AppColors.white,
                  ),
                  const SizedBox(width: 15),
                  Transform.scale(
                    scale: 2,
                    child: Icon(
                      Icons.work_history,
                      size: AppDimens.fSize(100),
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppDimens.hSize(60)),
              ...List.generate(experiences.length, (index) {
                var experience = experiences[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: AppDimens.hSize(32)),
                  child: ExperienceCard(
                    role: experience["role"],
                    description: experience["description"],
                    duration: experience["duration"],
                    logo: experience["logo"],
                    bgColor:
                        (index % 2 != 0)
                            ? AppColors.zinc8002727
                            : Colors.transparent,
                  ),
                );
              }),
            ],
          ),
        )
    //Mobile
        : Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.wSize(16),
            vertical: AppDimens.hSize(24),
          ),
          decoration: BoxDecoration(
            color: AppColors.blackColor,
            border: Border(
              bottom: BorderSide(color: Colors.blueGrey, width: 0.5),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: AppDimens.hSize(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextSora(
                    text: "My ",
                    fontWeight: FontWeight.w400,
                    fontSize: AppDimens.fSize(28),
                    letterSpacing: 1.2,
                    color: AppColors.white,
                  ),
                  AppTextSora(
                    text: "Experience ",
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.fSize(28),
                    letterSpacing: 1.2,
                    color: AppColors.white,
                  ),
                  const SizedBox(width: 15),
                  Transform.scale(
                    scale: 2,
                    child: Icon(
                      Icons.work_history,
                      size: AppDimens.fSize(25),
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppDimens.hSize(40)),
              ...List.generate(experiences.length, (index) {
                var experience = experiences[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: AppDimens.hSize(32)),
                  child: ExperienceCard(
                    role: experience["role"],
                    description: experience["description"],
                    duration: experience["duration"],
                    logo: experience["logo"],
                    bgColor:
                        (index % 2 != 0)
                            ? AppColors.zinc8002727
                            : Colors.transparent,
                  ),
                );
              }),
            ],
          ),
        );
  }
}
