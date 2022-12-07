import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:landing_page/constants/audio_string.dart';
import 'package:landing_page/constants/image_string.dart';

class WhitePianoCard extends StatefulWidget {
  final String imageString;

  const WhitePianoCard({super.key, required this.imageString});

  @override
  State<WhitePianoCard> createState() =>
      _WhitePianoCardState(imageString: imageString);
}

class _WhitePianoCardState extends State<WhitePianoCard> {
  final String imageString;

  _WhitePianoCardState({required this.imageString});

  bool isHover = false;
  bool isVisibile = false;
  bool isMobile = true;

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
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 2.0 : 8.0),
        child: AnimatedContainer(
          color: Colors.red,
          padding: null,
          duration: Duration(milliseconds: 500),
          width: isMobile ? 85 : 160,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                child: Image(
                  fit: isMobile ? BoxFit.fitHeight : BoxFit.fitWidth,
                  height: 500,
                  width: 160,
                  image: AssetImage(imageString),
                ),
              ),
              AnimatedContainer(
                color: Colors.white,
                height: isHover ? 130 : 60,
                duration: Duration(milliseconds: 200),
                child: Visibility(
                  visible: isHover ? !isVisibile : isVisibile,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Text(
                            "Hello World",
                            style: TextStyle(),
                          ),
                          Text(
                            "2022",
                            style: TextStyle(
                              fontFamily: "Coolvetica",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onEntered(bool value) {
    setState(() {
      isHover = !isHover;
    });
  }
}
