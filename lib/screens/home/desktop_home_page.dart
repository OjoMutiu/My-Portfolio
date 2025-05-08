import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/app_dimensions.dart';
import '../../constants/app_icons.dart';
import '../../widgets/app_text.dart';
import '../../widgets/button/custom_action_button.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screeWidth = MediaQuery.of(context).size.width;

    Future<void> launchUrlAddress(String url) async {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication, // For mobile
          webOnlyWindowName: '_blank', // For web — opens in new tab
        );
      } else {
        throw 'Could not launch $url';
      }
    }

    List<Map<String, dynamic>> socials = [
      {
        "title": "LinkedIn",
        "icon": AppIcons.linkedInIcon,
        "onTap": () {
          launchUrlAddress("https://www.linkedin.com/in/mutiu-ojo");
        },
      },
      {
        "title": "GitHub",
        "icon": AppIcons.gitHubIcon,
        "onTap": () {
          launchUrlAddress("https://github.com/OjoMutiu");
        },
      },
      {
        "title": "UpWork",
        "icon": AppIcons.upworkIcon,
        "onTap": () {
          launchUrlAddress(
            "https://www.upwork.com/freelancers/~01734d096cd7f000de",
          );
        },
      },
    ];

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

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actionsPadding: EdgeInsets.zero,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        toolbarHeight: AppDimens.hSize(104),

        title: Container(
          //color: Colors.blue,
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.wSize(80),
            vertical: 24,
          ),

          child: Row(
            children: [
              SvgPicture.asset(AppIcons.logo),
              SizedBox(width: AppDimens.wSize(12)),
              Row(
                children: [
                  AppTextSora(
                    text: "</",
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.fSize(18),
                  ),
                  AppTextSora(text: "Source", fontWeight: FontWeight.w700),

                  AppTextSora(text: "Code", fontWeight: FontWeight.w700),
                  AppTextSora(
                    text: "/>",
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.fSize(18),
                  ),
                ],
              ),
              const Spacer(flex: 3,),
              Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: AppTextSora(
                        text: "About Me",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: AppTextSora(
                        text: "Skills",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: AppTextSora(
                        text: "Project",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: AppTextSora(
                        text: "Contact Me",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2,),
              screeWidth <= 900
                  ? Container(
                    width: AppDimens.wSize(40),
                    height: AppDimens.hSize(50),
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    decoration: BoxDecoration(
                      color: AppColors.blackColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(AppIcons.downloadIcon),
                  )
                  : CustomActionButton(
                    btnText: 'Resume',
                    width: AppDimens.wSize(150),
                    height: AppDimens.hSize(60),
                    icon: AppIcons.downloadIcon,
                    onPressed: () {},
                  ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          ///Hero Section
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.wSize(80),
              vertical: AppDimens.hSize(60),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.blueGrey, width: 0.5),
              ),
            ),

            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      AppIcons.bannerIcon,
                      // height: AppDimens.hSize(596),
                      // width: AppDimens.wSize(889),
                    ),
                    SizedBox(width: AppDimens.wSize(30)),
                  ],
                ),
                Container(
                  // color: Colors.blue,
                  padding: EdgeInsets.only(
                    top: AppDimens.hSize(150),
                    left: AppDimens.wSize(32),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AppTextSora(
                            text: "Hello I'am  ",
                            fontSize: AppDimens.fSize(58),
                            letterSpacing: 2,
                          ),
                          AppTextSora(
                            text: "Mutiu Ojo.",
                            fontWeight: FontWeight.w800,
                            fontSize: AppDimens.fSize(58),
                            letterSpacing: 2,
                          ),
                        ],
                      ),
                      SizedBox(height: AppDimens.hSize(20)),
                      Row(
                        children: [
                          AppTextSora(
                            text: "Mobile ",
                            fontWeight: FontWeight.w800,
                            fontSize: AppDimens.fSize(58),
                            letterSpacing: 2,
                          ),
                          AppTextSora(
                            text: "App ",
                            fontWeight: FontWeight.w800,
                            fontSize: AppDimens.fSize(58),
                            letterSpacing: 2,
                          ),
                          Stack(
                            children: [
                              // Outline
                              Text(
                                "Developer",
                                style: TextStyle(
                                  fontFamily: "Sora",
                                  fontWeight: FontWeight.w800,
                                  fontSize: AppDimens.fSize(58),
                                  foreground:
                                      Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 3
                                        ..color = AppColors.blackColor,
                                  letterSpacing: 2,
                                ),
                              ),
                              // Fill
                              Text(
                                "Developer",
                                style: TextStyle(
                                  fontFamily: "Sora",
                                  fontWeight: FontWeight.w800,
                                  fontSize: AppDimens.fSize(58),
                                  color: Colors.white,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: AppDimens.hSize(20)),
                      Row(
                        children: [
                          AppTextSora(
                            text: "Based In  ",
                            fontSize: AppDimens.fSize(58),
                            letterSpacing: 2,
                          ),
                          AppTextSora(
                            text: "Nigeria",
                            fontWeight: FontWeight.w800,
                            fontSize: AppDimens.fSize(58),
                            letterSpacing: 1,
                          ),
                        ],
                      ),
                      SizedBox(height: AppDimens.hSize(32)),
                      SizedBox(
                        width: AppDimens.wSize(600),
                        child: AppTextSora(
                          text:
                              "I'm Mutiu Ojo, a professional cross-platform mobile app developer with over 3 years of experience creating high-performance Android and iOS applications. As a dedicated flutter developer, I've been the driving force behind numerous app success stories from fledgling startups to established enterprises. I have been crafting digital marvels, helping business goals come to life.",
                          fontSize: AppDimens.fSize(14),
                          letterSpacing: 1,
                          color: AppColors.zinc5007171,
                        ),
                      ),
                      SizedBox(height: AppDimens.hSize(150)),
                      Row(
                        children: [
                          ...List.generate(socials.length, (index) {
                            return GestureDetector(
                              onTap: socials[index]["onTap"],
                              child: Container(
                                height: AppDimens.hSize(66),
                                width: AppDimens.wSize(56),
                                margin: EdgeInsets.only(
                                  right: AppDimens.wSize(10),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: AppDimens.hSize(12),
                                  horizontal: AppDimens.wSize(6),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: AppColors.blackColor,
                                    width: 2,
                                  ),
                                ),
                                child: SvgPicture.asset(socials[index]["icon"]),
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingOnly(bottom: AppDimens.hSize(20)),
          ),

          ///My Skills
          Container(
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
                      child: Icon(
                        Icons.engineering,
                        size: AppDimens.fSize(100),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimens.hSize(60)),

                ///Skill Card
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.wSize(32),
                  ),
                  child: GridView.builder(
                    itemCount: skillsNdTools.length,
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
            ).paddingOnly(bottom: AppDimens.hSize(20)),
          ),

          //Experience
          Container(
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
            child: Column(children: [
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
            ]),
          ),

          //About Me
          Container(
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
                SizedBox(height: AppDimens.hSize(60)),
                Row(children: [SvgPicture.asset(AppIcons.aboutMeIcon)]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
