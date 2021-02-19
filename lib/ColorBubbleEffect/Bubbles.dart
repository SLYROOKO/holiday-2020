import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:holiday2020/ColorBubbleEffect/Bubble_painter.dart';
import 'package:holiday2020/ColorBubbleEffect/Bubble_model.dart';

class Bubbles extends StatefulWidget {
  final int numberOfBubbles;

  Bubbles(this.numberOfBubbles);

  @override
  _BubblesState createState() => _BubblesState();
}

class _BubblesState extends State<Bubbles> {
  final Random random = Random();

  final List<BubbleModel> flakes = [];

  @override
  void initState() {
    List.generate(widget.numberOfBubbles, (index) {
      flakes.add(BubbleModel(random));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Rendering(
      startTime: Duration(seconds: 30),
      onTick: _simulateFlakes,
      builder: (context, time) {
        return CustomPaint(
          painter: BubblesPainter(flakes, time),
        );
      },
    );
  }

  _simulateFlakes(Duration time) {
    flakes.forEach((flake) => flake.maintainRestart(time));
  }
}
