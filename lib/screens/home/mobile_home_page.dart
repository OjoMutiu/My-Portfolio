import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/screens/home/screens/about_me.dart';
import 'package:portfolio/screens/home/screens/contact_me.dart';
import 'package:portfolio/screens/home/screens/experience.dart';
import 'package:portfolio/screens/home/screens/heros.dart';
import 'package:portfolio/screens/home/screens/my_skills.dart';
import 'package:portfolio/screens/home/screens/portfolios.dart';
import 'package:portfolio/screens/home/screens/testimonial.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimensions.dart';
import '../../constants/app_icons.dart';
import '../../widgets/text/app_text.dart';
import 'desktop_home_page.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {});
  }

  List<Widget> sections = [
    ///My Skills
    MySkills(),

    ///Experience
    Experience(),

    ///About Me
    AboutMe(),

    ///Portfolio
    Portfolios(),

    ///Testimonials
    Testimonial(),

    ///Contact Me
    ContactMe(),
  ];

  final sectionKeys = List.generate(8, (_) => GlobalKey());

  void scrollToIndex(int index) {
    final context = sectionKeys[index].currentContext;
    if (context != null) {
      Navigator.of(context).pop();
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> drawers = [
      {
        "title": "Home",
        "icon": Icons.home,
        "onTap": () {
          scrollToIndex(6);
        },
      },{
        "title": "Skills",
        "icon": Icons.engineering,
        "onTap": () {
          scrollToIndex(0);
        },
      },
      {
        "title": "Experience",
        "icon": Icons.work_history,
        "onTap": () {
          scrollToIndex(1);
        },
      },
      {
        "title": "About Me",
        "icon": Icons.person,
        "onTap": () {
          scrollToIndex(2);
        },
      },
      {
        "title": "Project",
        "icon": Icons.folder_copy,
        "onTap": () {
          scrollToIndex(3);
        },
      },
      {
        "title": "Contact Me",
        "icon": Icons.phone_forwarded,
        "onTap": () {
          scrollToIndex(5);
        },
      },
      {
        "title": "Resume",
        "icon": Icons.save_alt,
        "onTap": () {
        },
      },
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actionsPadding: EdgeInsets.zero,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        toolbarHeight: AppDimens.hSize(
          MediaQuery.of(context).size.width >= 500 ? 100 : 58,
        ),

        title: Container(
          //color: Colors.blue,
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.wSize(16),
            vertical: AppDimens.hSize(
              MediaQuery.of(context).size.width >= 500 ? 24 : 16,
            ),
          ),

          child: Row(
            children: [
              SvgPicture.asset(AppIcons.logo),
              SizedBox(width: AppDimens.wSize(8)),
              Row(
                children: [
                  AppTextSora(
                    text: "</",
                    fontWeight: FontWeight.w700,
                    fontSize: AppDimens.fSize(18),
                  ),
                  AppTextSora(text: "Source", fontWeight: FontWeight.w700),

                  AppTextSora(text: "Code", fontWeight: FontWeight.w700),
                  AppTextSora(
                    text: "/>",
                    fontWeight: FontWeight.w700,
                    fontSize: AppDimens.fSize(18),
                  ),
                ],
              ),
              const Spacer(flex: 3),

              Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child:
                        MediaQuery.of(context).size.width >= 500
                            ? Container(
                              padding: EdgeInsets.symmetric(
                                vertical: AppDimens.hSize(10),
                                horizontal: AppDimens.wSize(6),
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.blackColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.menu, color: AppColors.white),
                            )
                            : Icon(Icons.menu, color: AppColors.blackColor),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.wSize(16),
            vertical: AppDimens.hSize(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppDimens.hSize(40)),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.logo),
                  SizedBox(width: AppDimens.wSize(8)),
                  Row(
                    children: [
                      AppTextSora(
                        text: "</",
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimens.fSize(18),
                      ),
                      AppTextSora(text: "Source", fontWeight: FontWeight.w700),

                      AppTextSora(text: "Code", fontWeight: FontWeight.w700),
                      AppTextSora(
                        text: "/>",
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimens.fSize(18),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                      decoration: BoxDecoration(
                        color: AppColors.blackColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppDimens.hSize(40)),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    ...List.generate(drawers.length, (index) {
                      var drawer = drawers[index];
                      return InkWell(
                        onTap: drawer["onTap"],
                        hoverColor: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: AppDimens.hSize(10),
                            horizontal: AppDimens.wSize(4),
                          ),
                          margin: EdgeInsets.only(bottom: AppDimens.hSize(14)),
                          decoration: BoxDecoration(
                            //color: AppColors.blackColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              Icon(drawer["icon"], color: AppColors.blackColor),
                              SizedBox(width: AppDimens.wSize(10)),
                              AppTextSora(
                                text: drawer["title"],
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.blackColor,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTextSora(
                    text: "</> Mutiu Ojo",
                    fontWeight: FontWeight.w600,
                  ),
                  AppTextSora(text: " @ 2025", fontWeight: FontWeight.w600),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            ///Hero Section
            HeroSection(
              key: sectionKeys.last,
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: ListView.builder(
                itemCount: sections.length,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return FadeSlideInOnVisible(
                    key: sectionKeys[index],
                    delayMilliseconds: 100,
                    child: sections[index],
                  );
                },
              ),
            ),

            ///Footer
            Footer(),
          ],
        ),
      ),
    );
  }
}
