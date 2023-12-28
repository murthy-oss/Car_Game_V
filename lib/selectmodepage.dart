// select_mode.dart
// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, deprecated_member_use, sized_box_for_whitespace

import 'package:car_game_v/gamePage.dart';
import 'package:flutter/material.dart';

class SelectModePage extends StatefulWidget {
  @override
  _SelectModePageState createState() => _SelectModePageState();
}

class _SelectModePageState extends State<SelectModePage> {
  String selectedMode = 'Easy'; // Default mode
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:  Text(
          'Select Mode',
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
          Container(
            width: width*2.5,
            child: Image.asset('images/roadimg.jpg')),
          Positioned(
             top: height * 0.53,
            left: width * 0.30,
            child: Container(
              width: width*0.416,
              child: Image.asset('images/newcar.png')),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 SizedBox(height: height*0.192),
                 Text(
                  'Select Speed Level:',
                  style: TextStyle(
                    fontSize: width*0.076,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                 SizedBox(height: height*0.038),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildSpeedButton('Easy',width,height),
                     SizedBox(width: width*0.0255,),
                    buildSpeedButton('Medium',width,height),
                     SizedBox(width:  width*0.0255,),
                    buildSpeedButton('Hard',width,height),
                  ],
                ),
                 SizedBox(height: height*0.0384),
                ElevatedButton(
                  onPressed: () {
                   
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GamePage(speed: selectedMode),
                      ),
                    );
                  },
                  child:  Text(
                    'Start Game',
                    style: TextStyle(
                      
                      fontSize: width*0.051,color: Colors.black),

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSpeedButton(String mode,double width,double height) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedMode = mode;
        });
      },
      style: ElevatedButton.styleFrom(
        primary: selectedMode == mode ? Colors.amberAccent : Colors.grey,
        padding:  EdgeInsets.symmetric(
          horizontal: width*0.051, 
          vertical: height*0.0128),
      ),
      child: Text(
        mode,
        style:  TextStyle(
          fontSize: width*0.045
          ,color: Colors.black),
      ),
    );
  }
}
