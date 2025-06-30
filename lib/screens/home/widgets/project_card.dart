import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';
import '../../../constants/app_icons.dart';
import '../../../widgets/text/app_text.dart';

class ProjectCard extends StatelessWidget {
  final String title, description, image;
  final int index;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return AppDimens.isDesktop ? Container(
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.hSize(60),
        horizontal: AppDimens.wSize(32),
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.zinc8002727)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (index % 2 == 0) ...[
            Expanded(
              flex: 5,
              child: Container(
                //height: AppDimens.hSize(430),
                //width: AppDimens.wSize(530),
                margin: EdgeInsets.only(right: AppDimens.wSize(20)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
              ),
            ),
            const Spacer(),
          ],
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextSora(
                  text: "0${index + 1}",
                  fontWeight: FontWeight.w800,
                  fontSize: AppDimens.fSize(58),
                  letterSpacing: 1.2,
                  color: AppColors.white,
                ),
                SizedBox(height: AppDimens.hSize(20)),
                AppTextSora(
                  text: title,
                  fontWeight: FontWeight.w700,
                  fontSize: AppDimens.fSize(50),
                  letterSpacing: 1.2,
                  color: AppColors.white,
                ),
                SizedBox(height: AppDimens.hSize(28)),
                AppTextSora(
                  text: description,
                  maxLines: 3,
                  color: AppColors.zinc5007171,
                ),
                SizedBox(height: AppDimens.hSize(28)),
                SvgPicture.asset(AppIcons.readMoreIcon),
              ],
            ),
          ),
          if (index % 2 != 0) ...[
            const Spacer(),
            Expanded(
              flex:5,
              child: Container(
                //height: AppDimens.hSize(430),
                //width: AppDimens.wSize(530),
                margin: EdgeInsets.only(left: AppDimens.wSize(20)),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    ) : Container(
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.hSize(24),
        horizontal: AppDimens.wSize(16),
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.zinc8002727)),
      ),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Container(
             //height: AppDimens.hSize(430),
             //width: AppDimens.wSize(530),
             margin: EdgeInsets.only(right: AppDimens.wSize(20)),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(18),
             ),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(18),
               child: Image.asset(image, fit: BoxFit.cover),
             ),
           ),

          SizedBox(height: AppDimens.hSize(28)),

          AppTextSora(
            text: "0${index + 1}",
            fontWeight: FontWeight.w800,
            fontSize: AppDimens.fSize(24),
            letterSpacing: 1.2,
            color: AppColors.white,
          ),
          SizedBox(height: AppDimens.hSize(20)),
          AppTextSora(
            text: title,
            fontWeight: FontWeight.w700,
            fontSize: AppDimens.fSize(20),
            letterSpacing: 1.2,
            color: AppColors.white,
          ),
          SizedBox(height: AppDimens.hSize(28)),
          AppTextSora(
            text: description,
            maxLines: 3,
            color: AppColors.zinc5007171,
          ),
          SizedBox(height: AppDimens.hSize(28)),
          SvgPicture.asset(AppIcons.readMoreIcon),

        ],
      ),
    );
  }
}
