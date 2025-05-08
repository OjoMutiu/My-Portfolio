import 'package:flutter/material.dart';

import 'constants/app_dimensions.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget? mobileView;
  final Widget? desktopView;

  const ResponsiveLayoutBuilder({super.key, this.mobileView, this.desktopView});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileView ?? SizedBox();
        } else {
          return desktopView ?? SizedBox();
        }
      },
    );
  }
}