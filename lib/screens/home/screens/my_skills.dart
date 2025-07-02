import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';
import '../../../constants/app_icons.dart';
import '../../../widgets/text/app_text.dart';

class MySkills extends StatelessWidget {
  const MySkills({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> skillsNdTools = [
      {"skill": "Android", "icon": AppIcons.androidIcon},
      {"skill": "Android Studio", "icon": AppIcons.androidStudioIcon},
      {"skill": "API 🔌", "icon": AppIcons.apiIcon},
      {"skill": "C#", "icon": AppIcons.cSharpIcon},
      {"skill": "Dart", "icon": AppIcons.dartIcon},
      {"skill": "FireBase", "icon": AppIcons.fireBaseIcon},
      {"skill": "Flutter", "icon": AppIcons.flutterIcon, "isMain": true},
      {"skill": "GitHub", "icon": AppIcons.gitHubIcon},
      {"skill": "iOS", "icon": AppIcons.iosIcon},
      {"skill": "Java Core", "icon": AppIcons.javaIcon},
      {"skill": "Postman", "icon": AppIcons.postManIcon},
      {"skill": "VS Code", "icon": AppIcons.vsCodeIcon},
    ];

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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // AppTextSora(
                  //   text: "My ",
                  //   fontWeight: FontWeight.w400,
                  //   fontSize: AppDimens.fSize(58),
                  //   letterSpacing: 1.2,
                  // ),
                  AppTextSora(
                    text: "Skills",
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.fSize(58),
                    letterSpacing: 1.2,
                  ),
                  AppTextSora(
                    text: " & ",
                    fontWeight: FontWeight.w400,
                    fontSize: AppDimens.fSize(58),
                    letterSpacing: 1.2,
                  ),
                  AppTextSora(
                    text: "Tools  ",
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.fSize(58),
                    letterSpacing: 1.2,
                  ),
                  const SizedBox(width: 10),
                  Transform.scale(
                    scale: 2,
                    child: Icon(Icons.engineering, size: AppDimens.fSize(100)),
                  ),
                ],
              ),
              SizedBox(height: AppDimens.hSize(60)),

              ///Skill Card
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimens.wSize(32)),
                child: GridView.builder(
                  itemCount: skillsNdTools.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: AppDimens.wSize(186),
                    crossAxisSpacing: AppDimens.wSize(70),
                    mainAxisSpacing: AppDimens.hSize(45),
                  ),
                  itemBuilder: (context, index) {
                    var skillNdTool = skillsNdTools[index];
                    return Container(
                      height: AppDimens.hSize(200),
                      width: AppDimens.wSize(186),
                      decoration: BoxDecoration(
                        color:
                            skillNdTool["isMain"] != null
                                ? AppColors.blackColor.withValues(alpha: 0.7)
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          width: 2,
                          color: AppColors.blackColor,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              skillNdTool["icon"],
                              fit: BoxFit.cover,
                              height: AppDimens.hSize(60),
                              width: AppDimens.wSize(56),
                            ),
                            SizedBox(height: AppDimens.hSize(32)),
                            AppTextSora(
                              text: skillNdTool["skill"],
                              fontWeight: FontWeight.w800,
                              fontSize: AppDimens.fSize(16),
                              color:
                                  skillNdTool["isMain"] != null
                                      ? AppColors.white
                                      : AppColors.blackColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
            children: [
              SizedBox(height: AppDimens.hSize(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // AppTextSora(
                  //   text: "My ",
                  //   fontWeight: FontWeight.w400,
                  //   fontSize: AppDimens.fSize(58),
                  //   letterSpacing: 1.2,
                  // ),
                  AppTextSora(
                    text: "Skills",
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.fSize(28),
                    letterSpacing: 1.2,
                  ),
                  AppTextSora(
                    text: " & ",
                    fontWeight: FontWeight.w400,
                    fontSize: AppDimens.fSize(28),
                    letterSpacing: 1.2,
                  ),
                  AppTextSora(
                    text: "Tools  ",
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.fSize(28),
                    letterSpacing: 1.2,
                  ),
                  const SizedBox(width: 10),
                  Transform.scale(
                    scale: 2,
                    child: Icon(Icons.engineering, size: AppDimens.fSize(25)),
                  ),
                ],
              ),
              SizedBox(height: AppDimens.hSize(40)),

              ///Skill Card
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimens.wSize(32)),
                child: GridView.builder(
                  itemCount: skillsNdTools.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: AppDimens.wSize(161),
                    crossAxisSpacing: AppDimens.wSize(20),
                    mainAxisSpacing: AppDimens.hSize(20),
                  ),
                  itemBuilder: (context, index) {
                    var skillNdTool = skillsNdTools[index];
                    return Container(
                      height: AppDimens.hSize(160),
                      width: AppDimens.wSize(161),
                      decoration: BoxDecoration(
                        color:
                            skillNdTool["isMain"] != null
                                ? AppColors.blackColor.withValues(alpha: 0.7)
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          width: 2,
                          color: AppColors.blackColor,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              skillNdTool["icon"],
                              fit: BoxFit.cover,
                              height: AppDimens.hSize(60),
                              width: AppDimens.wSize(56),
                            ),
                            SizedBox(height: AppDimens.hSize(32)),
                            AppTextSora(
                              text: skillNdTool["skill"],
                              fontWeight: FontWeight.w800,
                              fontSize: AppDimens.fSize(16),
                              color:
                                  skillNdTool["isMain"] != null
                                      ? AppColors.white
                                      : AppColors.blackColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
  }
}
