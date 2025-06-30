import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';
import '../../../constants/app_images.dart';
import '../../../widgets/text/app_text.dart';

class Testimonial extends StatelessWidget {
  const Testimonial({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.wSize(AppDimens.isDesktop ? 80 : 16),
        vertical: AppDimens.hSize(AppDimens.isDesktop ? 60: 24),
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
                  fontSize: AppDimens.fSize(AppDimens.isDesktop ? 58 :28),
                  letterSpacing: 1.2,
                ),
                AppTextSora(
                  text: "Testimonial ",
                  fontWeight: FontWeight.w800,
                  fontSize: AppDimens.fSize(AppDimens.isDesktop ? 58 :28),
                  letterSpacing: 1.2,
                ),
                const SizedBox(width: 15),
                Transform.scale(
                  scale: 2,
                  child: Icon(
                    Icons.rate_review,
                    size: AppDimens.fSize(AppDimens.isDesktop ? 100 :25),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppDimens.hSize(20)),
          AnimatedPageView(),
        ],
      ),
    );
  }
}


class AnimatedPageView extends StatefulWidget {
  const AnimatedPageView({super.key});

  @override
  AnimatedPageViewState createState() => AnimatedPageViewState();
}

class AnimatedPageViewState extends State<AnimatedPageView> {
  late PageController _pageController;
  double value = 1.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: AppDimens.isDesktop ? 1/3 : 0.8, initialPage: 1);

    // Trigger a rebuild after the first frame to get the page value
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String,dynamic>> testimonials = [
      {"name":"Flora Shreen", "role" : "Designer", "gender":"Male", "review":"",},
      {"name":"Flora Shreen", "role" : "Designer", "gender":"Female", "review":"",},
      {"name":"Flora Shreen", "role" : "Designer", "gender":"Male", "review":"",},
      {"name":"Flora Shreen", "role" : "Designer", "gender":"Male", "review":"",},
    ];


    double maxCardWidth = MediaQuery.of(context).size.width * (0.4);
    double totalWidth = maxCardWidth * testimonials.length + AppDimens.wSize(5) * 2; // add padding between cards


    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: AppDimens.hSize(AppDimens.isDesktop ? 40 : 20),
          horizontal: AppDimens.isDesktop ? AppDimens.wSize(24) : 0,
        ),
        height: AppDimens.hSize(AppDimens.isDesktop ? 532 : 470),
        width:
        AppDimens.isDesktop ?totalWidth > MediaQuery.of(context).size.width
            ? MediaQuery.of(context).size.width
            : totalWidth : AppDimens.screenWidth,
        child: PageView.builder(
          controller: _pageController,
          itemCount: testimonials.length,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                if (_pageController.position.haveDimensions) {
                  value = (_pageController.page! - index).abs();
                  value = (1 - (value * 0.35)).clamp(0.65, 1.0);


                }
                final yOffset = 50 * (1 - value);
                var testimonial = testimonials[index];
                return Center(
                  child: Transform.scale(
                    scale: Curves.easeOut.transform(value),
                    child: Container(
                      width: AppDimens.wSize(400),
                      padding: EdgeInsets.symmetric(
                        vertical: AppDimens.hSize(40),
                        horizontal: AppDimens.wSize(35),
                      ),
                      decoration: BoxDecoration(
                        color:  AppColors.blackColor.withValues(alpha: value),
                        //: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 16,
                            spreadRadius: -6,
                            color: const Color(0xFF18274B).withValues(alpha: 0.18),
                            offset: Offset(0, AppDimens.hSize(8)),
                          ),
                          BoxShadow(
                            blurRadius: 8,
                            spreadRadius: -6,
                            color: const Color(0xFF18274B).withValues(alpha: 0.28),
                            offset: Offset(0, AppDimens.hSize(6)),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: AppDimens.hSize(96),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.white,
                                  width: 2,
                                )
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(99),
                              child: Image.asset(testimonial["gender"] == "Male" ? AppImages.maleAvatar : AppImages.femaleAvatar, fit: BoxFit.cover,),
                            ),
                          ),
                          SizedBox(height: AppDimens.hSize(24)),
                          Transform.translate(
                            offset: Offset(0, yOffset),
                            child: Opacity(
                              opacity: value,
                              child: AppTextSora(
                                text:
                                "I recently had to jump on 10+ different calls "
                                    "across eight different countries to find "
                                    "the right owner.",
                                textAlign: TextAlign.center,
                                fontSize: AppDimens.fSize(13),
                                color:
                                AppColors.white ,
                              ),
                            ),
                          ),
                          SizedBox(height: AppDimens.hSize(24)),
                          Transform.translate(
                            offset: Offset(0, yOffset),
                            child: SizedBox(
                              width: AppDimens.wSize(150),
                              child: Divider(
                                thickness: 2,
                                color:AppColors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: AppDimens.hSize(24)),
                          Transform.translate(
                            offset: Offset(0, yOffset),
                            child: AppTextSora(
                              text:
                              "Flora Shreen",
                              fontSize: AppDimens.fSize(16),
                              color:  AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: AppDimens.hSize(24)),
                          Transform.translate(
                            offset: Offset(0, yOffset),
                            child: AppTextSora(
                              text:
                              "Designer",
                              fontSize: AppDimens.fSize(16),
                              color: AppColors.zinc5007171,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}