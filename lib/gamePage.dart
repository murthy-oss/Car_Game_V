// ignore_for_file: file_names, avoid_print, prefer_interpolation_to_compose_strings, use_build_context_synchronously, sized_box_for_whitespace

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'over.dart';
import 'main.dart';
import 'package:flutter/foundation.dart';


class GamePage extends StatefulWidget {
  final String speed;

  const GamePage({Key? key, required this.speed}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with SingleTickerProviderStateMixin {
  
  double _positionY = 0.0;
  double _posY = 0.0;
  Random random = Random();
  double _posX = 150.0;
  double _carPosX = 50;
  int score = 0;

  late AnimationController _controller;
  


final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
late double height;
  late double width;
   Future<void> _initScreenDimensions() async {
    // Use a Future to wait for the completion of initState
    await Future.delayed(Duration.zero);

    // Access screen dimensions after initState has completed
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
      print(height);
      print(width);
    // Force a rebuild to update the UI with the new values
    setState(() {});
  }
 @override
  void initState() {
    super.initState();
     _initScreenDimensions();
    double speedFactor = 1.0;
 assetsAudioPlayer.open(Audio("images/audio/test.mp3"));
    switch (widget.speed) {
      case 'Easy':
        speedFactor = 0.5;
        break;
      case 'Medium':
        speedFactor = 1.0;
        break;
      case 'Hard':
        speedFactor = 2.0;
        break;
    }

    _controller = AnimationController(
      duration: Duration(seconds: (5 / speedFactor).round()),
      vsync: this,
    )..repeat(reverse: true);

   

    _controller.addListener(() {
      setState(() {
        _positionY += height*0.019;
        _posY += height*0.010;

        if (_positionY > height*0.066) {
          _positionY = 0.0;
        }

        if (_posY > height*0.864) {
          _posY = 0.0;
         
          _posX = random.nextDouble() + random.nextInt(250);
          score += 1;
        }

        if (height*0.465 < _posY || _carPosX < width*0.0277 || _carPosX > width*0.638) {
          print('y crossover');

          if ((_carPosX + width*0.083) > (_posX - width*0.066) &&
              (_carPosX - width*0.083) < (_posX + width*0.0611) ||
              _carPosX < width*0.0277 ||
              _carPosX > width*0.638) {
            print(_carPosX);
          
            gameOver();
            _posY = 0.0;
          }
        }
      });
    });
  }

 
  void gameOver() {
    _posY = 0.0;
    _positionY = 0.0;
     assetsAudioPlayer.pause();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Over(score)),
    );
  }

  void gameToStart() {
    _posY = 0.0;
    _positionY = 0.0;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyApp(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
     assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
       height: (kIsWeb)?0:height*0.0930,
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 28,
        actions: [
           Text(
            'SCORE:' + score.toString(),
            style:  TextStyle(
              fontSize: width*0.051,
              fontWeight: FontWeight.bold,
              color: Colors.amberAccent,
            ),
          ),
        ],
        ),
      
      body: Stack(
        children: [
          Container(
            width: width*2.2,
            child: Image.asset('images/roadimg.jpg')),
          AnimatedContainer(
            duration: const Duration(milliseconds: 10),
            transform: Matrix4.translationValues(0.0, _positionY, 0.0),
            child: Container(
              width: width*2.2,
              child: Image.asset('images/roadimg.jpg')),
          ),
          Hero(
            tag: 'car_opponent',
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 10),
              transform: Matrix4.translationValues(_posX, _posY, 0.0),
              child: Container(
                //color: Colors.white,
                width: width*0.333,
                height: height*0.1728,
                child: Image.asset('images/caroppc.png')),
            ),
          ),
          Hero(
            tag: 'car_player',
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 10),
              transform: Matrix4.translationValues(_carPosX, width + 75, 0.0),
              child: Container(
               
                width: width*0.333,
                height: height*0.2260,
                child: Image.asset('images/newcar.png')),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Column(
              children: [
                Container(
                  width: width*2.5,
                  //height:height*0.053,
                  child: Image.asset('images/black_bg.png')),
              ],
            ),
          ),
          GestureDetector(
            onTapDown: (TapDownDetails details) {
              double X = details.globalPosition.dx;
              double y = details.globalPosition.dy;
              print('X:$_carPosX,Y:$y');
              if (X > (width)*0.52) {
                _carPosX += (width)*0.063;
              } else if (X < (width)*0.52) {
                _carPosX -=  (width)*0.063;
              }
            },
          ),
          /*Positioned(
            top: height * 0.84,
            left: 0,
            child: Container(
              width: width*2.5,
              height: height*0.065,
              child: Image.asset('images/black_bg.png')),
          ),
          Positioned(
            top: height * 0.9,
            left: 0,
            child: Container(
              width: width*2.2,
              height: height*0.053,
              
              child: Image.asset('images/black_bg.png')),
          ),*/
        ],
      ),
      
    );
    
  }
}
