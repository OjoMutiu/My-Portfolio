import 'package:flutter/material.dart';
import 'package:portfolio/responsive_layout_builder.dart';

import 'desktop_home_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      desktopView: DesktopHomePage(),
    );
  }
}


