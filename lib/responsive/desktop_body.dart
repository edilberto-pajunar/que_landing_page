import 'package:flutter/material.dart';
import 'package:landing_page/models/tiles.dart';

import '../constants/image_string.dart';
import '../utils/black_piano_card.dart';
import '../utils/white_piano_card.dart';

class DesktopBody extends StatefulWidget {
  const DesktopBody({super.key});

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        alignment: Alignment.center,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 90.0),
              child: Center(
                child: Text(
                  "tuni studios",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Center(
              child: Text(
                "MELODY FOR YOUR EYES",
                style: TextStyle(
                  fontFamily: "Coolvetica",
                  fontSize: 133,
                  color: Colors.white,
                ),
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: pianotiles.length,
                      itemBuilder: ((context, index) {
                        return WhitePianoCard(
                          imageString: pianotiles[index],
                        );
                      })),
                ),
                Positioned(
                  left: 0,
                  child: SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: blackPianoTiles.length,
                      itemBuilder: ((context, index) {
                        return BlackPianoCard(
                          labelText: blackPianoTiles[index][0],
                          padding: blackPianoTiles[index][1],
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
