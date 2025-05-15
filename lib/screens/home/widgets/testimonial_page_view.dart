import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';
import '../../../constants/app_images.dart';
import '../../../widgets/text/app_text.dart';


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
    _pageController = PageController(viewportFraction: 1/3, initialPage: 1);

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

    List<Map<String,dynamic>> testimonial = [
      {"name":"Flora Shreen", "role" : "Designer", "gender":"Male", "review":"",},
      {"name":"Flora Shreen", "role" : "Designer", "gender":"Male", "review":"",},
      {"name":"Flora Shreen", "role" : "Designer", "gender":"Male", "review":"",},
      {"name":"Flora Shreen", "role" : "Designer", "gender":"Male", "review":"",},
    ];


    double maxCardWidth = MediaQuery.of(context).size.width * (1/3);
    double totalWidth = maxCardWidth * testimonial.length + AppDimens.wSize(16) * 2; // add padding between cards


    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: AppDimens.hSize(40),
          horizontal: AppDimens.wSize(24),
        ),
        height: 478,
        width: totalWidth > MediaQuery.of(context).size.width
            ? MediaQuery.of(context).size.width
            : totalWidth,
        child: PageView.builder(
          controller: _pageController,
          itemCount: testimonial.length,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                if (_pageController.position.haveDimensions) {
                  value = (_pageController.page! - index).abs();
                  value = (1 - (value * 0.4)).clamp(0.6, 1.0);


                }
                var value1 = (1 - (value * 0.3)).clamp(0.0, 1.0);
                final yOffset = 50 * (1 - value);
                return Center(
                  child: Transform.scale(
                    scale: Curves.easeOut.transform(value),
                    child: Container(
                      width: AppDimens.wSize(370),
                      padding: EdgeInsets.symmetric(
                        vertical: AppDimens.hSize(40),
                        horizontal: AppDimens.wSize(35),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.blackColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 16,
                            spreadRadius: -6,
                            color: const Color(0xFF18274B).withValues(alpha: 0.08),
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        //width: AppDimens.wSize(280),
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
                                child: Image.asset(AppImages.maleAvatar, fit: BoxFit.cover,),
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
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: AppDimens.hSize(24)),
                            SizedBox(
                              width: AppDimens.wSize(150),
                              child: Divider(
                                thickness: 2,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(height: AppDimens.hSize(24)),
                            AppTextSora(
                              text:
                              "Flora Shreen",
                              fontSize: AppDimens.fSize(16),
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: AppDimens.hSize(24)),
                            AppTextSora(
                              text:
                              "Designer",
                              fontSize: AppDimens.fSize(16),
                              color: AppColors.zinc5007171,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
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
