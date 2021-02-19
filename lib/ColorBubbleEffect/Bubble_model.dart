import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:random_color/random_color.dart';


class BubbleModel {
  MultiTween tween;
  double size;
  AnimationProgress animationProgress;
  Random random;
  Color bubblecolor;

  BubbleModel(this.random) {
    restart();
  }

  void restart({Duration time = Duration.zero}) {
    final startPosition = Offset(-0.2 + 1.4 * random.nextDouble(), 1.2);
    final endPosition = Offset(-0.2 + 1.4 * random.nextDouble(), -0.2);
    final duration = Duration(milliseconds: 5000 + random.nextInt(2000));

    tween = MultiTween();
    tween.add(("x"), Tween(begin: startPosition.dx, end: endPosition.dx),
        duration, Curves.easeInOutSine);
    tween.add(("y"), Tween(begin: startPosition.dy, end: endPosition.dy),
        duration, Curves.easeIn);

    animationProgress = AnimationProgress(duration: duration, startTime: time);
    size = 0.2 + random.nextDouble() * 0.4;

    RandomColor _randomColor = RandomColor();
    switch (random.nextInt(2)) {
      case 0:
        bubblecolor = _randomColor.randomColor(colorHue: ColorHue.red).withAlpha(100);
        break;
      case 1:
        bubblecolor =
            _randomColor.randomColor(colorHue: ColorHue.blue).withAlpha(100);
        break;
      case 2:
        bubblecolor =
            _randomColor.randomColor(colorHue: ColorHue.green).withAlpha(100);
        break;
      default:
        bubblecolor = _randomColor.randomColor().withAlpha(100);
    }

  }

  void maintainRestart(Duration time) {
    if (animationProgress.progress(time) == 1.0) {
      restart(time: time);
    }
  }
}
