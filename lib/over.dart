// ignore_for_file: camel_case_types, duplicate_ignore, must_be_immutable, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:car_game_v/gamePage.dart';
import 'package:car_game_v/main.dart';
import 'package:flutter/material.dart';

class Over extends StatefulWidget {
  int? scoreShow;

  Over(int score) {
    scoreShow = score;
  }

  @override
  State<Over> createState() => _OverState();
}

class _OverState extends State<Over> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:  Text(
          'GAME OVER',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: width*0.076,
            fontWeight: FontWeight.bold,
            letterSpacing: width*0.0255,
          ),
        ),
        backgroundColor: Colors.amberAccent,
        toolbarHeight: width*0.127,
      ),
      body: Stack(
        children: [
          const Padding(padding: EdgeInsets.all(0)),
          Container(
            width: width*2.5,
            
            child: Image.asset('images/roadimg.jpg')),
          Positioned(
             top: height * 0.53,
            left: width * 0.30,
            child: Container(
              width: width*0.41,
              child: Image.asset('images/newcar.png')),
          )
        ],
      ),
      floatingActionButton: Column(
        children: [
           Padding(padding: EdgeInsets.all(width*0.178)),
          Text(
            '     SCORE:${widget.scoreShow}',
            style: const TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.25, vertical: height * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               SizedBox(height: height*0.05,),
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GamePage(speed: ''),
                      ),
                    );
                  },
                  label: Text(
                    '     RESTART',
                    style: TextStyle(
                      fontSize: height * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                SizedBox(height: height*0.05,),
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const MyApp(),
                      ),
                    );
                  },
            
                  label: Text(
                    '     HOME',
                    style: TextStyle(
                      fontSize: height * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
