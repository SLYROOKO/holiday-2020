import 'dart:io';
import 'package:flutter/material.dart';
import 'package:holiday2020/ColorBubbleEffect/Bubbles.dart';
import 'package:holiday2020/main.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:random_color/random_color.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  Route _routeLeft() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 500),
    );
  }

  void sleeper() {
    sleep(Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: SwipeGestureRecognizer(
          child: Scaffold(
            backgroundColor: RandomColor().randomColor(),
            body: Center(
              child: Stack(children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/fireplace_cat.gif"),
                    ),
                    SizedBox(
                        height: 150,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: TyperAnimatedTextKit(
                            speed: Duration(milliseconds: 100),
                            text: [/*
                              "To my beloved family,",
                              "Even though this year was rough,",
                              "I'm grateful that we stayed safe.",
                              "I wish you happiness and health.",
                              "Merry Christmas!",
                              "Love, \n Roy",*/
                              "Greetings to all my wonderful friends.",
                              "I'm so glad that we all made it through this year.",
                              "Thank you guys for being the best.",
                              "Happy Holidays!\n Roy"
                            ],
                            textStyle: TextStyle(
                                fontSize: 34.0, fontFamily: "DancingScript"),
                            textAlign: TextAlign.center,
                          ),
                        ))
                  ],
                ),
                Positioned.fill(child: Bubbles(30)),
              ]),
            ),
          ),
          onSwipeRight: () {
            Navigator.of(context).push(_routeLeft());
          },
        ));
  }
}
