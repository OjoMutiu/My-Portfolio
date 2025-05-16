import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants/app_colors.dart';
import 'package:portfolio/constants/app_strings.dart';
import 'package:portfolio/screens/home/widgets/experience_card.dart';
import 'package:portfolio/screens/home/widgets/testimonial_page_view.dart';
import 'package:portfolio/widgets/text_field/custom_txt_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/app_dimensions.dart';
import '../../constants/app_icons.dart';
import '../../constants/app_images.dart';
import '../../controllers/user_controller.dart';
import '../../widgets/text/app_text.dart';
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
              const Spacer(flex: 3),
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
              const Spacer(flex: 2),
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

          ///Experience
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
                  return ExperienceCard(
                    role: experience["role"],
                    description: experience["description"],
                    duration: experience["duration"],
                    logo: experience["logo"],
                    bgColor:
                        (index % 2 != 0)
                            ? AppColors.zinc8002727
                            : Colors.transparent,
                  ).marginOnly(bottom: AppDimens.hSize(32));
                }),
              ],
            ),
          ),

          ///About Me
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: AppDimens.hSize(120)),
                      SvgPicture.asset(AppIcons.aboutMeIcon),
                    ],
                  ),
                ),
                Expanded(
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
          ),

          ///Portfolio
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
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppDimens.hSize(20)),
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
          ),

          ///Testimonials
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.wSize(80),
              vertical: AppDimens.hSize(60),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppDimens.hSize(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppTextSora(
                        text: "My ",
                        fontWeight: FontWeight.w400,
                        fontSize: AppDimens.fSize(58),
                        letterSpacing: 1.2,
                      ),
                      AppTextSora(
                        text: "Testimonial ",
                        fontWeight: FontWeight.w800,
                        fontSize: AppDimens.fSize(58),
                        letterSpacing: 1.2,
                      ),
                      const SizedBox(width: 15),
                      Transform.scale(
                        scale: 2,
                        child: Icon(
                          Icons.rate_review,
                          size: AppDimens.fSize(100),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppDimens.hSize(20)),
                AnimatedPageView(),
              ],
            ),
          ),

          ///Contact Me
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.wSize(112),
              vertical: AppDimens.hSize(80),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.blueGrey, width: 0.5),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: AppDimens.hSize(60)),
                Row(
                  children: [
                    GetBuilder(
                      builder: (UserController userController) {
                        return Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              CustomTxtField(
                                controller: userController.userNameController,
                                hintText: "Your name",
                              ),
                              SizedBox(height: AppDimens.hSize(20)),
                              CustomTxtField(
                                controller: userController.userEmailController,
                                hintText: "Email",
                              ),
                              SizedBox(height: AppDimens.hSize(20)),
                              CustomTxtField(
                                controller: userController.userWebAddressController,
                                hintText: "Your website (if any)",
                              ),
                              SizedBox(height: AppDimens.hSize(20)),
                              CustomTxtField(
                                controller: userController.userHowCanIController,
                                hintText: "Let's discuss how we can create magic",
                                maxLines: 5,
                              ),
                              SizedBox(height: AppDimens.hSize(30)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomActionButton(
                                    btnText: 'Get In Touch',
                                    width: AppDimens.wSize(150),
                                    height: AppDimens.hSize(60),
                                    onPressed: () {},
                                  ),
                                  const Spacer(),
                                  ...List.generate(socials.length, (index) {
                                    return GestureDetector(
                                      onTap: socials[index]["onTap"],
                                      child: Container(
                                        height: AppDimens.hSize(66),
                                        width: AppDimens.wSize(56),
                                        margin: EdgeInsets.only(
                                          right: AppDimens.wSize(15),
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
                                        child: SvgPicture.asset(
                                          socials[index]["icon"],
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    const Spacer(),

                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AppTextSora(
                                text: "Let's ",
                                fontWeight: FontWeight.w800,
                                fontSize: AppDimens.fSize(64),
                                letterSpacing: 1.2,
                              ),
                              Stack(
                                children: [
                                  // Outline
                                  Text(
                                    "talk",
                                    style: TextStyle(
                                      fontFamily: "Sora",
                                      fontWeight: FontWeight.w800,
                                      fontSize: AppDimens.fSize(64),
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
                                    "talk",
                                    style: TextStyle(
                                      fontFamily: "Sora",
                                      fontWeight: FontWeight.w800,
                                      fontSize: AppDimens.fSize(64),
                                      color: Colors.white,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ],
                              ),
                              AppTextSora(
                                text: " for",
                                fontWeight: FontWeight.w800,
                                fontSize: AppDimens.fSize(64),
                                letterSpacing: 1.2,
                              ),
                            ],
                          ),
                          SizedBox(height: AppDimens.hSize(12)),
                          AppTextSora(
                            text: "Something special",
                            fontWeight: FontWeight.w800,
                            fontSize: AppDimens.fSize(64),
                            letterSpacing: 1.2,
                          ),
                          SizedBox(height: AppDimens.hSize(20)),
                          AppTextSora(
                            text: "I seek to push the limits of creativity to create"
                                " high-engaging, user-friendly, and memorable "
                                "interactive mobile experiences.",
                            fontWeight: FontWeight.w400,
                            fontSize: AppDimens.fSize(14),
                            color: AppColors.zinc5007171,
                            letterSpacing: 1.2,
                          ),
                          SizedBox(height: AppDimens.hSize(40)),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.5,
                                child: Icon(
                                  Icons.email,
                                  size: AppDimens.fSize(20),
                                ),
                              ),
                              AppTextSora(
                                text: "  sourcecode.wildtech@gmail.com",
                                fontWeight: FontWeight.w600,
                                fontSize: AppDimens.fSize(28),
                              ),
                            ],
                          ),
                          AppTextSora(
                            text: "",
                            fontWeight: FontWeight.w600,
                            fontSize: AppDimens.fSize(28),
                            letterSpacing: 1.2,
                          ),
                          SizedBox(height: AppDimens.hSize(40)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ///Footer
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.wSize(80),
              vertical: AppDimens.hSize(24),
            ),
            color: AppColors.blackColor,
            child: Row(children: [
              SvgPicture.asset(AppIcons.logo, colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn,),),
              SizedBox(width: AppDimens.wSize(12)),
              Row(
                children: [
                  AppTextSora(
                    text: "</",
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.fSize(18),
                    color: AppColors.white,
                  ),
                  AppTextSora(text: "Source", fontWeight: FontWeight.w700, color: AppColors.white,),

                  AppTextSora(text: "Code", fontWeight: FontWeight.w700, color: AppColors.white,),
                  AppTextSora(
                    text: "/>",
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.fSize(18),
                    color: AppColors.white,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                AppTextSora(
                  text: "@ 2025",
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
                SizedBox(height: AppDimens.hSize(8)),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.flutterIcon, height: AppDimens.fSize(24),),
                    AppTextSora(
                      text: " Made with Flutter",
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ],)
            ],),
          )
        ],
      ),
    );
  }
}

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
    return Container(
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
            Container(
              height: AppDimens.hSize(430),
              //width: AppDimens.wSize(530),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
          ],
          SizedBox(
            width: AppDimens.wSize(590),
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
            Container(
              height: AppDimens.hSize(430),
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
          ],
        ],
      ),
    );
  }
}
