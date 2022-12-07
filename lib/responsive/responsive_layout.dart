import 'package:flutter/material.dart';
import 'package:landing_page/constants/dimensions.dart';
import 'package:landing_page/responsive/desktop_body.dart';

import 'mobile_screen/mobile_body.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  const ResponsiveLayout(
      {super.key, required this.mobileBody, required this.desktopBody});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return MobileBody();
        } else {
          return DesktopBody();
        }
      },
    );
  }
}
