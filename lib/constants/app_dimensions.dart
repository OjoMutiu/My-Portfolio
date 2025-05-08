import 'package:get/get.dart';

class AppDimens {
  static final double screenHeight = Get.context!.height;
  static final double screenWidth = Get.context!.width;

  static bool get isMobile => screenWidth < 600;
  static bool get isTablet => screenWidth >= 600 && screenWidth <= 1024;
  static bool get isDesktop => screenWidth > 1024;

  // Reference design dimensions (typically iPhone 11 for mobile)
  static const double mobileBaseWidth = 375.0;
  static const double mobileBaseHeight = 812.0;

  static const double tabletBaseWidth = 768.0;
  static const double tabletBaseHeight = 1024.0;

  static const double desktopBaseWidth = 1440.0;
  static const double desktopBaseHeight = 1024.0;

  static double wSize(double px) {
    double baseWidth = isDesktop
        ? desktopBaseWidth
        : isTablet
        ? tabletBaseWidth
        : mobileBaseWidth;

    return px * (screenWidth / baseWidth);
  }

  static double hSize(double px) {
    double baseHeight = isDesktop
        ? desktopBaseHeight
        : isTablet
        ? tabletBaseHeight
        : mobileBaseHeight;

    return px * (screenHeight / baseHeight);
  }

  static double fSize(double px) {
    double baseWidth = isDesktop
        ? desktopBaseWidth
        : isTablet
        ? tabletBaseWidth
        : mobileBaseWidth;

    double scaled = px * (screenWidth / baseWidth);
    return scaled.clamp(12.0, 28.0);
  }

}

