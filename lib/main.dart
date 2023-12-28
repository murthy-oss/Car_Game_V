// ignore_for_file: avoid_print, sized_box_for_whitespace

import 'package:car_game_v/selectmodepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // ignore: deprecated_member_use
        backgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'car race'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
  print(height);
  print(width);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:  Text(
          ' CAR RACE',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: width*0.076,
            fontWeight: FontWeight.bold,
            letterSpacing: width*0.051,
          ),
        ),
        backgroundColor: Colors.amberAccent,
        toolbarHeight: width*0.127,
      ),
      body: Stack(
        children: [
          Container(
            width: width*5,
            child: Image.asset('images/roadimg.jpg')),
          Positioned(
            top: height * 0.53,
            left: width * 0.30,
            child: Container(
              width: width*0.416,
              child: Image.asset('images/newcar.png')),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.25,
          vertical: height * 0.45,
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectModePage()),
            );
          },
          label:  Text(
            '      TAP TO START',
            style: TextStyle(
              fontSize: (height * 0.03), // Responsive font size
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
