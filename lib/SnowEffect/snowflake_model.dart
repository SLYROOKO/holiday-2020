import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SnowflakeModel {
  MultiTween tween;
  double size;
  AnimationProgress animationProgress;
  Random random;

  SnowflakeModel(this.random) {
    restart();
  }

  void restart({Duration time = Duration.zero}) {
    final startPosition = Offset(-0.2 + 1.4 * random.nextDouble(), -0.2);
    final endPosition = Offset(-0.2 + 1.4 * random.nextDouble(), 1.2);
    final duration = Duration(milliseconds: 11000 + random.nextInt(10000));

    tween = MultiTween();
    tween.add(("x"), Tween(begin: startPosition.dx, end: endPosition.dx),
        duration, Curves.easeInOutSine);
    tween.add(("y"), Tween(begin: startPosition.dy, end: endPosition.dy),
        duration, Curves.easeIn);

    animationProgress = AnimationProgress(duration: duration, startTime: time);
    size = random.nextDouble().clamp(.35, .6) * 0.15;
  }

  void maintainRestart(Duration time) {
    if (animationProgress.progress(time) == 1.0) {
      restart(time: time);
    }
  }
}
