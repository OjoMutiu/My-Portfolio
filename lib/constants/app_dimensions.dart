import 'package:get/get.dart';

class AppDimens {
  static double get screenHeight => Get.context!.height;
  static double get screenWidth => Get.context!.width;

  static bool get isMobile => screenWidth < 600;
  static bool get isDesktop => screenWidth >= 800;
  static bool get isTablet => screenWidth >= 600 && screenWidth <= 1024;
  //static bool get isDesktop => screenWidth > 1024;

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
        // : isTablet
        // ? tabletBaseWidth
        : mobileBaseWidth;

    return px * (screenWidth / baseWidth);
  }

  static double hSize(double px) {
    double baseHeight = isDesktop
        ? desktopBaseHeight
        // : isTablet
        // ? tabletBaseHeight
        : mobileBaseHeight;

    return px * (screenHeight / baseHeight);
  }

  static double fSize(double px) {
    // double baseWidth = isDesktop
    //     ? desktopBaseWidth
    //     // : isTablet
    //     // ? tabletBaseWidth
    //     : mobileBaseWidth;



    if(isDesktop){
      double baseWidth =  desktopBaseWidth;
      double scaled = px * (screenWidth / baseWidth);
      if(screenWidth >= 800) {
        return scaled.clamp(12.0, 30.0);
      }else{
        return px * (screenHeight / 1024);
      }
    }else if (screenHeight < 670) {
      return px * ((screenHeight) / 660);
    } else if (screenHeight < 785) {
      return px * ((screenHeight) / 760);
    } else if (screenHeight < 820) {
      return px * ((screenHeight) / 812);
    } else if (screenHeight < 870) {
      return px * ((screenHeight) / 860);
    } else if (screenHeight < 940) {
      return px * ((screenHeight) / 930);
    }else{
      return px;
    }
  }

}

