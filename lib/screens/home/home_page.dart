import 'package:flutter/material.dart';
import 'package:portfolio/responsive_layout_builder.dart';
import 'package:portfolio/screens/home/mobile_home_page.dart';

import 'desktop_home_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      desktopView: DesktopHomePage(),
      mobileView: MobileHomePage(),
    );
  }
}


