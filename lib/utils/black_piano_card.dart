import 'package:audioplayers/audioplayers.dart';
import 'package:dynamic_fonts/dynamic_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landing_page/constants/audio_string.dart';

import '../widget/on_hover_button.dart';

class BlackPianoCard extends StatefulWidget {
  final String labelText;
  final double padding;

  const BlackPianoCard(
      {super.key, required this.labelText, required this.padding});

  @override
  State<BlackPianoCard> createState() =>
      _BlackPianoCardState(labelText: labelText, padding: padding);
}

class _BlackPianoCardState extends State<BlackPianoCard> {
  final String labelText;
  final double padding;

  _BlackPianoCardState({required this.labelText, required this.padding});

  bool isHover = false;
  bool isMobile = false;

  @override
  Widget build(BuildContext context) {
    final _currentWidth = MediaQuery.of(context).size.width;
    final _currentHeight = MediaQuery.of(context).size.height;

    setState(() {
      if (_currentWidth < 600) {
        isMobile = true;
      } else {
        isMobile = false;
      }
    });
    return MouseRegion(
        onEnter: (event) => OnEntered(true),
        onExit: (event) => OnEntered(false),
        child: Padding(
          padding: EdgeInsets.only(left: padding),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: isMobile ? 50 : 100,
              height: isMobile ? 75 : 300,
              color: Colors.black,
              child: Center(
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    labelText,
                    style: TextStyle(
                      foreground: Paint()
                        ..style =
                            isHover ? PaintingStyle.fill : PaintingStyle.stroke
                        ..color = Colors.white,
                      fontFamily: "Coolvetica",
                      fontSize: isMobile ? 30 : 40,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  OnEntered(bool value) {
    setState(() {
      isHover = !isHover;
    });
  }
}
