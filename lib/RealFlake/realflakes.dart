import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:holiday2020/RealFlake/realflakes_painter.dart';
import 'package:holiday2020/RealFlake/realflake_model.dart';

class RealFlake extends StatefulWidget {
  final int numberOfRealflake;

  RealFlake(this.numberOfRealflake);

  @override
  _RealFlakeState createState() => _RealFlakeState();
}

class _RealFlakeState extends State<RealFlake> {
  final Random random = Random();

  final List<RealFlakeModel> flakes = [];

  @override
  void initState() {
    List.generate(widget.numberOfRealflake, (index) {
      flakes.add(RealFlakeModel(random));
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
          painter: RealFlakePainter(flakes, time),
        );
      },
    );
  }

  _simulateFlakes(Duration time) {
    flakes.forEach((flake) => flake.maintainRestart(time));
  }
}