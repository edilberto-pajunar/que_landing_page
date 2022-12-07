import 'package:flutter/material.dart';
import 'package:landing_page/constants/image_string.dart';
import 'package:landing_page/responsive/desktop_body.dart';
import 'package:landing_page/responsive/mobile_screen/mobile_body.dart';
import 'package:landing_page/responsive/responsive_layout.dart';
import 'package:landing_page/utils/white_piano_card.dart';

import '../utils/black_piano_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: ResponsiveLayout(
        desktopBody: DesktopBody(),
        mobileBody: MobileBody(),
      ),
    );
  }
}
