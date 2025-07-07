import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants/app_colors.dart';
import 'package:portfolio/controllers/user_controller.dart';
import 'package:portfolio/screens/home/screens/about_me.dart';
import 'package:portfolio/screens/home/screens/contact_me.dart';
import 'package:portfolio/screens/home/screens/experience.dart';
import 'package:portfolio/screens/home/screens/heros.dart';
import 'package:portfolio/screens/home/screens/my_skills.dart';
import 'package:portfolio/screens/home/screens/portfolios.dart';
import 'package:portfolio/screens/home/screens/testimonial.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../constants/app_dimensions.dart';
import '../../constants/app_icons.dart';
import '../../widgets/text/app_text.dart';
import '../../widgets/button/custom_action_button.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {});
  }

  List<Map<String,dynamic>> sections = [
    ///My Skills
    { "name" : "MySkills", "Widget" : MySkills(),},

    ///Experience
    {"name" : "MyExperience", "Widget" : Experience(),},

    ///About Me
    {"name" : "AboutMe", "Widget" : AboutMe(),},

    ///Portfolio
    {"name" : "MyProjects", "Widget" : Portfolios(),},

    ///Testimonials
    {"name" : "MyTestimonial", "Widget" : Testimonial(),},

    ///Contact Me
    {"name" : "ContactMe", "Widget" : ContactMe(),},
  ];

  final sectionKeys = List.generate(7, (_) => GlobalKey());

  void scrollToIndex(int index) {
    final context = sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screeWidth = MediaQuery.of(context).size.width;

    return GetBuilder(
      builder: (UserController userController) {
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
                          onTap: () {
                            scrollToIndex(2);
                          },
                          child: AppTextSora(
                            text: "About Me",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            scrollToIndex(0);
                          },
                          child: AppTextSora(
                            text: "Skills",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            scrollToIndex(3);
                          },
                          child: AppTextSora(
                            text: "Project",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            scrollToIndex(5);
                          },
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
                  screeWidth <= 1024
                      ? GestureDetector(
                        onTap: () async {
                          if (userController.isUserLoaded && !userController.isDownloadingResume) {
                            var result = await userController.launchResumeUrl();

                            if (result.isNotEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.blackColor,
                                  content: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.error_outline, color: AppColors.white,),
                                          AppTextSora(
                                            text: "  Error",
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      AppTextSora(
                                        text: result,
                                        fontSize: AppDimens.fSize(12),
                                        color: AppColors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          }
                        },
                        child: Container(
                          width: AppDimens.wSize(60),
                          height: AppDimens.hSize(50),
                          padding: EdgeInsets.symmetric(
                            vertical: AppDimens.hSize(10),
                            horizontal: AppDimens.wSize(6),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                              (userController.isUserLoaded || !userController.isDownloadingResume)
                                  ? SvgPicture.asset(AppIcons.downloadIcon)
                                  : Center(
                                    child: SizedBox(
                                      width: AppDimens.wSize(25),
                                      height: AppDimens.hSize(20),
                                      child: CircularProgressIndicator(
                                        color: AppColors.white,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  ),
                        ),
                      )
                      : CustomActionButton(
                        btnText: 'Resume',
                        inActive: (!userController.isUserLoaded || userController.isDownloadingResume),
                        width: AppDimens.wSize(150),
                        height: AppDimens.hSize(60),
                        icon: AppIcons.downloadIcon,
                        isLoading: userController.isDownloadingResume,
                        onPressed: () async{
                            if (userController.isUserLoaded) {
                              if(!userController.isDownloadingResume){
                                var result = await userController.launchResumeUrl();

                                if (result.isNotEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppColors.blackColor,
                                      content: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.error_outline, color: AppColors.white,),
                                              AppTextSora(
                                                text: "  Error",
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.white,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 6),
                                          AppTextSora(
                                            text: result,
                                            fontSize: AppDimens.fSize(12),
                                            color: AppColors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              }
                            }
                        },
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
                HeroSection(),
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: ListView.builder(
                    itemCount: sections.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      return FadeSlideInOnVisible(
                        key: sectionKeys[index],
                        sectionName: sections[index]['name'],
                        delayMilliseconds: index * 100,
                        child: sections[index]["Widget"],

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
      },
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.wSize(AppDimens.isDesktop ? 80 : 16),
        vertical: AppDimens.hSize(24),
      ),
      color: AppColors.blackColor,
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.logo,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
          SizedBox(width: AppDimens.wSize(AppDimens.isDesktop ? 12 : 4)),
          Row(
            children: [
              AppTextSora(
                text: "</",
                fontWeight: FontWeight.w800,
                fontSize: AppDimens.fSize(18),
                color: AppColors.white,
              ),
              AppTextSora(
                text: "Source",
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),

              AppTextSora(
                text: "Code",
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
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
                  SvgPicture.asset(
                    AppIcons.flutterIcon,
                    height: AppDimens.fSize(24),
                  ),
                  AppTextSora(
                    text: " Made with Flutter",
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FadeSlideInOnVisible extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final int delayMilliseconds;
  final String sectionName;

  const FadeSlideInOnVisible({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 400),
    this.curve = Curves.easeOut,
    this.delayMilliseconds = 0, required this.sectionName,
  });

  @override
  State<FadeSlideInOnVisible> createState() => _FadeSlideInOnVisibleState();
}

class _FadeSlideInOnVisibleState extends State<FadeSlideInOnVisible>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  bool _hasAnimated = false;
  bool _isInView = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  void _triggerAnimation() async {
    //await Future.delayed(Duration(milliseconds: widget.delayMilliseconds));
    if (mounted) {
      _controller.forward(from: 0);
    }
    _hasAnimated = true;
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(widget.sectionName),//UniqueKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1) {
          if (!_isInView) {
            // Entering view
            _isInView = true;
            if (!_hasAnimated) {
              _triggerAnimation();
            }
          }
        }
        // else if (info.visibleFraction < 0.1){
        //   // Leaving view
        //   _isInView = false;
        //   _hasAnimated = false; // Allow reanimation when re-entering
        // }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder:
            (_, child) => FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(position: _slideAnimation, child: child),
            ),
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

//
// @override
// void dispose() {
//   // scrollController.removeListener(_checkVisibility);
//   // _animationController.dispose();
//   super.dispose();
// }

// final GlobalKey _key = GlobalKey();
// bool _isInView = false;
// final triggerFraction = 0.8;
//
// late AnimationController _animationController;
// late Animation<double> _opacityAnimation;
//
// void _checkVisibility() {
//   final RenderBox? box =
//       _key.currentContext?.findRenderObject() as RenderBox?;
//   if (box != null) {
//     final offset = box.localToGlobal(Offset.zero).dy;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     bool inView = offset < screenHeight * triggerFraction && offset > 0;
//     if (inView != _isInView) {
//       setState(() => _isInView = inView);
//       if (inView) {
//         _animationController.forward();
//       } else {
//         _animationController.reverse();
//       }
//     }
//   }
// }

// _animationController = AnimationController(
//   vsync: this,
//   duration: const Duration(milliseconds: 300),
// );
//
// _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//   CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
// );

//_checkVisibility
