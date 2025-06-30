import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';
import '../../../constants/app_icons.dart';
import '../../../controllers/user_controller.dart';
import '../../../widgets/button/custom_action_button.dart';
import '../../../widgets/text/app_text.dart';
import '../../../widgets/text_field/custom_txt_field.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
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

    return AppDimens.isDesktop
        ? Container(
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
                              controller:
                                  userController.userWebAddressController,
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
                          text:
                              "I seek to push the limits of creativity to create"
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppDimens.hSize(20)),
              GetBuilder(
                builder: (UserController userController) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        controller:
                            userController.userWebAddressController,
                        hintText: "Your website (if any)",
                      ),
                      SizedBox(height: AppDimens.hSize(20)),
                      CustomTxtField(
                        controller: userController.userHowCanIController,
                        hintText: "Let's discuss how we can create magic",
                        maxLines: 5,
                      ),
                      SizedBox(height: AppDimens.hSize(30)),
                      CustomActionButton(
                        btnText: 'Get In Touch',
                        width: AppDimens.wSize(150),
                        height: AppDimens.hSize(60),
                        onPressed: () {},
                      ),
                      SizedBox(height: AppDimens.hSize(30)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(socials.length, (index) {
                            return GestureDetector(
                              onTap: socials[index]["onTap"],
                              child: Container(
                                height: AppDimens.hSize(48),
                                width: AppDimens.wSize(48),
                                margin: EdgeInsets.only(
                                  right: AppDimens.wSize(10),
                                ),
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
                                child: SvgPicture.asset(
                                  socials[index]["icon"],
                                ),
                              ),
                            );

                          }),
                          SizedBox(width: AppDimens.wSize(30)),
                          const Spacer(),
                        ],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: AppDimens.hSize(20)),

              Row(
                children: [
                  AppTextSora(
                    text: "Let's ",
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.fSize(28),
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
                          fontSize: AppDimens.fSize(28),
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
                          fontSize: AppDimens.fSize(28),
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  AppTextSora(
                    text: " for",
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.fSize(28),
                    letterSpacing: 1.2,
                  ),
                ],
              ),
              SizedBox(height: AppDimens.hSize(12)),
              AppTextSora(
                text: "Something special",
                fontWeight: FontWeight.w800,
                fontSize: AppDimens.fSize(28),
                letterSpacing: 1.2,
              ),
              SizedBox(height: AppDimens.hSize(20)),
              AppTextSora(
                text:
                    "I seek to push the limits of creativity to create"
                    " high-engaging, user-friendly, and memorable "
                    "interactive mobile experiences.",
                fontWeight: FontWeight.w400,
                fontSize: AppDimens.fSize(14),
                color: AppColors.zinc5007171,
                letterSpacing: 1.2,
              ),
              SizedBox(height: AppDimens.hSize(20)),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Icon(
                      Icons.email,
                      size: AppDimens.fSize(20),
                    ),
                  ),
                  AppTextSora(
                    text: "  sourcecode.wildtech@gmail.com",
                    fontWeight: FontWeight.w600,
                    fontSize: AppDimens.fSize(18),
                  ),
                ],
              ),
              SizedBox(height: AppDimens.hSize(40)),
            ],
          ),
        );
  }
}
