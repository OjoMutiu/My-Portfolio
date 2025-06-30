import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';
import '../../../constants/app_images.dart';
import '../../../widgets/text/app_text.dart';
import '../widgets/project_card.dart';


class Portfolios extends StatelessWidget {
  const Portfolios({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> projects = [
      {
        "title": "Reservation and Restaurant Application",
        "image": AppImages.foodRestaurantImg,
        "description": "",
      },
      {
        "title": "Real Estate Mobile Application",
        "image": AppImages.shelterImg2,
        "description": "",
      },
      {
        "title": "Reservation and Restaurant Application",
        "image": AppImages.homifiedImg,
        "description": "",
      },
      {
        "title": "Reservation and Restaurant Application",
        "image": AppImages.cosmeticsGigImg,
        "description": "",
      },
      {
        "title": "Reservation and Restaurant Application",
        "image": AppImages.shelterImg1,
        "description": "",
      },
      {
        "title": "Reservation and Restaurant Application",
        "image": AppImages.scheduleImg,
        "description": "",
      },
    ];

    return AppDimens.isDesktop ? Container(
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
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppDimens.hSize(20),
            ),
            child: Row(
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
                  text: "Projects ",
                  fontWeight: FontWeight.w800,
                  fontSize: AppDimens.fSize(58),
                  letterSpacing: 1.2,
                  color: AppColors.white,
                ),
                const SizedBox(width: 15),
                Transform.scale(
                  scale: 2,
                  child: Icon(
                    Icons.folder_copy,
                    size: AppDimens.fSize(100),
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppDimens.hSize(20)),
          ...List.generate(projects.length, (index) {
            var project = projects[index];
            return ProjectCard(
              title: project["title"],
              description:
              "I'm Evren Shah Lorem Ipsum is "
                  "simply dummy text of the printing and typesetting "
                  "industry. Lorem Ipsum has been the industry's "
                  "standard dummy text ever since the 1500s, when an "
                  "unknown printer took a galley of type and scrambled "
                  "it to specimen book.",
              image: project["image"],
              index: index,
            );
          }),
        ],
      ),
    ) : Container(
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
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppDimens.hSize(20),
            ),
            child: Row(
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
                  text: "Projects ",
                  fontWeight: FontWeight.w800,
                  fontSize: AppDimens.fSize(28),
                  letterSpacing: 1.2,
                  color: AppColors.white,
                ),
                const SizedBox(width: 15),
                Transform.scale(
                  scale: 2,
                  child: Icon(
                    Icons.folder_copy,
                    size: AppDimens.fSize(25),
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppDimens.hSize(20)),
          ...List.generate(projects.length, (index) {
            var project = projects[index];
            return ProjectCard(
              title: project["title"],
              description:
              "I'm Evren Shah Lorem Ipsum is "
                  "simply dummy text of the printing and typesetting "
                  "industry. Lorem Ipsum has been the industry's "
                  "standard dummy text ever since the 1500s, when an "
                  "unknown printer took a galley of type and scrambled "
                  "it to specimen book.",
              image: project["image"],
              index: index,
            );
          }),
        ],
      ),
    );
  }
}
