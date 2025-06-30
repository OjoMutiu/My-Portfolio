import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';
import '../../../constants/app_icons.dart';
import '../../../widgets/text/app_text.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Offset> _textOffsetAnimation;
  late Animation<Offset> _imageOffsetAnimation;
  late Animation<double> _opacityAnimation;

  late List<Animation<Offset>> _slideAnimations;
  late List<Animation<double>> _fadeAnimations;

  late List<Animation<Offset>> _iconSlideAnimations;
  late List<Animation<double>> _iconFadeAnimations;

  final int itemCount = 4;
  final int iconCount = 3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _textOffsetAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _imageOffsetAnimation = Tween<Offset>(
      begin: const Offset(0.5, 0), // Slide from right
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // Setup staggered animations for text
    _slideAnimations = List.generate(itemCount, (i) {
      return Tween<Offset>(
        begin: const Offset(0, 0.4),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(i * 0.1, 0.6 + i * 0.1, curve: Curves.easeOut),
        ),
      );
    });

    _fadeAnimations = List.generate(itemCount, (i) {
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(i * 0.1, 0.6 + i * 0.1, curve: Curves.easeIn),
        ),
      );
    });

    _iconSlideAnimations = List.generate(iconCount, (i) {
      return Tween<Offset>(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0.5 + i * 0.1, 0.8 + i * 0.1, curve: Curves.easeOut),
        ),
      );
    });

    _iconFadeAnimations = List.generate(iconCount, (i) {
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0.5 + i * 0.1, 0.8 + i * 0.1, curve: Curves.easeIn),
        ),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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

  Widget animatedText({required Widget child, required int index}) {
    return SlideTransition(
      position: _slideAnimations[index],
      child: FadeTransition(opacity: _fadeAnimations[index], child: child),
    );
  }

  Widget animatedIcon({required Widget child, required int index}) {
    return SlideTransition(
      position: _iconSlideAnimations[index],
      child: FadeTransition(opacity: _iconFadeAnimations[index], child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
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

    return AppDimens.isDesktop ? Container(
      padding: EdgeInsets.only(
        left: AppDimens.wSize(80),
        //right: AppDimens.wSize(80),
        bottom: AppDimens.hSize(60),
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.blueGrey, width: 0.5)),
      ),

      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(flex: 2,),
              SlideTransition(
                position: _imageOffsetAnimation,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: SizedBox(
                    height: AppDimens.hSize(756),
                    width: AppDimens.wSize(700),
                    child: SvgPicture.asset(
                      AppIcons.bannerIcon,
                    ),
                  ),
                ),
              ),
              SizedBox(width: AppDimens.wSize(50),)
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: AppDimens.hSize(130),
                  left: AppDimens.wSize(32),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    animatedText(
                      child: Row(
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
                      index: 0,
                    ),
                    SizedBox(height: AppDimens.hSize(20)),
                    animatedText(
                      index: 1,
                      child: Row(
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
                    ),
                    SizedBox(height: AppDimens.hSize(20)),
                    animatedText(
                      index: 2,
                      child: Row(
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
                    ),
                    SizedBox(height: AppDimens.hSize(32)),
                    animatedText(
                      index: 3,
                      child: SizedBox(
                        width: AppDimens.wSize(600),
                        child: AppTextSora(
                          text:
                              "I'm Mutiu Ojo, a professional cross-platform mobile app developer with over 3 years of experience creating high-performance Android and iOS applications. As a dedicated flutter developer, I've been the driving force behind numerous app success stories from fledgling startups to established enterprises. I have been crafting digital marvels, helping business goals come to life.",
                          fontSize: AppDimens.fSize(16),
                          letterSpacing: 1,
                          color: AppColors.zinc5007171,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimens.hSize(130)),
                    Row(
                      children: [
                        ...List.generate(socials.length, (index) {
                          return animatedIcon(
                            index: index,
                            child: GestureDetector(
                              onTap: socials[index]["onTap"],
                              child: Container(
                                height: AppDimens.hSize(66),
                                width: AppDimens.wSize(56),
                                margin: EdgeInsets.only(right: AppDimens.wSize(10)),
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
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    )
        ///Mobile
        : Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.wSize(24),
        vertical: AppDimens.hSize(24),
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.blueGrey, width: 0.5)),
      ),
      child: Column(
        children: [
          SizedBox(height: AppDimens.hSize(16)),
          SlideTransition(
            position: _imageOffsetAnimation,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: SizedBox(
                height: AppDimens.hSize(332),
                width: AppDimens.wSize(343),
                child: SvgPicture.asset(
                  AppIcons.bannerIcon,
                ),
              ),
            ),
          ),
          SizedBox(height: AppDimens.hSize(48)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              animatedText(
                child: Row(
                  children: [
                    AppTextSora(
                      text: "Hello I'am  ",
                      fontSize: AppDimens.fSize(28),
                      letterSpacing: 2,
                    ),
                    AppTextSora(
                      text: "Mutiu Ojo.",
                      fontWeight: FontWeight.w800,
                      fontSize: AppDimens.fSize(28),
                      letterSpacing: 2,
                    ),
                  ],
                ),
                index: 0,
              ),
              SizedBox(height: AppDimens.hSize(12)),
              animatedText(
                index: 1,
                child: Wrap(
                  children: [
                    AppTextSora(
                      text: "Mobile ",
                      fontWeight: FontWeight.w800,
                      fontSize: AppDimens.fSize(26),
                      letterSpacing: 2,
                    ),
                    AppTextSora(
                      text: "App ",
                      fontWeight: FontWeight.w800,
                      fontSize: AppDimens.fSize(26),
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
                            fontSize: AppDimens.fSize(26),
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
                            fontSize: AppDimens.fSize(26),
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimens.hSize(12)),
              animatedText(
                index: 2,
                child: Row(
                  children: [
                    AppTextSora(
                      text: "Based In  ",
                      fontSize: AppDimens.fSize(28),
                      letterSpacing: 2,
                    ),
                    AppTextSora(
                      text: "Nigeria",
                      fontWeight: FontWeight.w800,
                      fontSize: AppDimens.fSize(28),
                      letterSpacing: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimens.hSize(32)),
              animatedText(
                index: 3,
                child: SizedBox(
                  width: AppDimens.wSize(600),
                  child: AppTextSora(
                    text:
                    "I'm Mutiu Ojo, a professional cross-platform mobile app developer with over 3 years of experience creating high-performance Android and iOS applications. As a dedicated flutter developer, I've been the driving force behind numerous app success stories from fledgling startups to established enterprises. I have been crafting digital marvels, helping business goals come to life.",
                    fontSize: AppDimens.fSize(14),
                    letterSpacing: 1,
                    color: AppColors.zinc5007171,
                  ),
                ),
              ),
              SizedBox(height: AppDimens.hSize(32)),
              Row(
                children: [
                  ...List.generate(socials.length, (index) {
                    return animatedIcon(
                      index: index,
                      child: GestureDetector(
                        onTap: socials[index]["onTap"],
                        child: Container(
                          height: AppDimens.hSize(48),
                          width: AppDimens.wSize(48),
                          margin: EdgeInsets.only(right: AppDimens.wSize(10)),
                          padding: EdgeInsets.symmetric(
                            vertical: AppDimens.hSize(8),
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
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
