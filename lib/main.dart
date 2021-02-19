import 'package:audioplayers/audioplayers.dart'
    if (dart.library.io) 'package:audioplayers/audio_cache.dart'
    if (dart.library.js) 'package:audioplayers/audio_player_web.dart';
import 'package:flutter/material.dart';
import 'package:holiday2020/page2.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import "RealFlake/realflakes.dart";
import 'package:flutter/foundation.dart' show kIsWeb;
//openable packages
//gift cards

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final AudioCache audioCache = AudioCache();
  final WrappedPlayer audioWeb = WrappedPlayer();

  @override
  Widget build(BuildContext context) {
    if(kIsWeb){
        audioWeb.
    }
    else{
    audioCache.loop('audios/Holiday_mood.mp3');
    }
    return MaterialApp(
      title: 'Merry Christmas',
      theme: ThemeData(
        fontFamily: 'DancingScript',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Route _routeRight() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: child);
      },
      transitionDuration: Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: SwipeGestureRecognizer(
          child: Stack(
            children: <Widget>[
              Scaffold(
                backgroundColor: Color.fromRGBO(255, 255, 255, 1.0), //239
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ColorizeAnimatedTextKit(
                        repeatForever: true,
                        text: [
                          "Merry Christmas",
                        ],
                        textStyle: TextStyle(
                            fontSize: 60.0, fontWeight: FontWeight.bold),
                        colors: [
                          Colors.red,
                          Colors.green,
                        ],
                        textAlign: TextAlign.start,
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                          child: Image(image: AssetImage("assets/main.gif"))),
                      SizedBox(
                          height: 50,
                          child: FadeAnimatedTextKit(
                            pause: Duration(seconds: 5),
                            repeatForever: true,
                            text: [
                              "Swipe Me ->",
                            ],
                            textStyle: TextStyle(fontSize: 32.0),
                            textAlign: TextAlign.start,
                          )),
                    ],
                  ),
                ),
              ),
              Positioned.fill(child: RealFlake(50)),
            ],
          ),
          onSwipeLeft: () {
            Navigator.of(context).push(_routeRight());
          },
        ));
  }
}
