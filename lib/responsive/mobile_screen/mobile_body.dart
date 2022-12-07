import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:landing_page/responsive/mobile_screen/mobile_drawer.dart';

import '../../models/tiles.dart';
import '../../utils/black_piano_card.dart';
import '../../utils/white_piano_card.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 4,
        shadowColor: Colors.grey[500],
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: const Text("tuni studios"),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      drawer: const Drawer(
        child: MobileDrawer(),
      ),
      body: SafeArea(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Center(
              child: Text(
                "LET'S FIND YOUR TONE",
                style: TextStyle(
                  fontFamily: "Coolvetica",
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
            ),
            Stack(
              children: [
                RotatedBox(
                  quarterTurns: 1,
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: 500,
                    ),
                    child: ListView.builder(
                      itemCount: pianotiles.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return WhitePianoCard(
                          imageString: pianotiles[index],
                        );
                      }),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 0,
                  // child: Container(
                  //   width: 300,
                  //   height: 75,
                  //   color: Colors.black,
                  //   child: Center(
                  //     child: Text(
                  //       "About",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontFamily: "Coolvetica",
                  //         fontSize: 30,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  child: ListView.builder(
                      itemCount: blackPianoTiles.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return BlackPianoCard(
                          labelText: blackPianoTiles[index][0],
                          padding: blackPianoTiles[index][1],
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
