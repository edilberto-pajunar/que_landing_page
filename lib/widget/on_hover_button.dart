import 'dart:math';

import 'package:flutter/material.dart';

class OnHoverButton extends StatefulWidget {
  final String labelText;

  const OnHoverButton({
    super.key,
    required this.labelText,
  });

  @override
  State<OnHoverButton> createState() =>
      _OnHoverButtonState(labelText: labelText);
}

class _OnHoverButtonState extends State<OnHoverButton> {
  final String labelText;
  _OnHoverButtonState({
    required this.labelText,
  });

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedDefaultTextStyle(
        duration: Duration(milliseconds: 200),
        style: TextStyle(
          foreground: Paint()
            ..style = isHovered ? PaintingStyle.fill : PaintingStyle.stroke
            ..color = Colors.white,
          fontFamily: "Coolvetica",
          fontSize: 45,
        ),
        child: Text(labelText),
      ),
    );
  }

  void onEntered(bool bool) {
    setState(() {
      isHovered = !isHovered;
    });
  }
}
