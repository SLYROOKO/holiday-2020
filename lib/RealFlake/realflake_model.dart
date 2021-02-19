import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:typed_data';



class RealFlakeModel {
  MultiTween tween;
  double size;
  AnimationProgress animationProgress;
  Random random;
  Path path;

  RealFlakeModel(this.random) {
    restart();
  }

  void restart({Duration time = Duration.zero}) {
    path = null;
    final startPosition = Offset(-0.2 + 1.4 * random.nextDouble(), -0.2);
    final endPosition = Offset(-0.2 + 1.4 * random.nextDouble(), 1.2);
    final duration = Duration(milliseconds: 11000 + random.nextInt(10000));

    tween = MultiTween();
    tween.add(("x"), Tween(begin: startPosition.dx, end: endPosition.dx),
        duration, Curves.easeInOutSine);
    tween.add(("y"), Tween(begin: startPosition.dy, end: endPosition.dy),
        duration, Curves.easeIn);

    animationProgress = AnimationProgress(duration: duration, startTime: time);
    size = random.nextDouble().clamp(.20, .6) * 50;
    drawPath(size);
  }

  void drawPath(double size) {
    if (path != null) {
      return;
    }
    double tl = size; //trunk length
    double bl = tl / 3; //branch length
    double sbl = bl / 2; //shortbranch

    path = Path();

    path
      ..moveTo(0, 0) //bottom right trunk
      ..lineTo(cos(pi / 3) * tl, sin(pi / 3) * tl)
      ..moveTo(cos(pi / 3) * tl / 3, sin(pi / 3) * tl / 3) //smallbranch
      ..lineTo(((cos(pi / 3) * tl / 3) + sbl), (sin(pi / 3) * tl / 3))
      ..moveTo(cos(pi / 3) * tl / 3, sin(pi / 3) * tl / 3)
      ..lineTo((cos(pi / 3) * tl / 3) - (cos(pi / 3) * sbl),
          (sin(pi / 3) * tl / 3) + (sin(pi / 3) * sbl))
      ..moveTo(cos(pi / 3) * 2 * tl / 3, sin(pi / 3) * 2 * tl / 3) //big branch
      ..lineTo(cos(pi / 3) * 2 * tl / 3 + bl, sin(pi / 3) * 2 * tl / 3)
      ..moveTo(cos(pi / 3) * 2 * tl / 3, sin(pi / 3) * 2 * tl / 3)
      ..lineTo((cos(pi / 3) * 2 * tl / 3) - (cos(pi / 3) * bl),
          (sin(pi / 3) * 2 * tl / 3) + (sin(pi / 3) * bl))
      ..moveTo(0, 0) //bottom left trunk
      ..lineTo(cos(pi / 3) * -tl, sin(pi / 3) * tl)
      ..moveTo(cos(pi / 3) * -tl / 3, sin(pi / 3) * tl / 3) //smallbranch
      ..lineTo(((cos(pi / 3) * -tl / 3) - sbl), (sin(pi / 3) * tl / 3))
      ..moveTo(cos(pi / 3) * -tl / 3, sin(pi / 3) * tl / 3)
      ..lineTo((cos(pi / 3) * -tl / 3) + (cos(pi / 3) * sbl),
          (sin(pi / 3) * (tl / 3)) + (sin(pi / 3) * sbl))
      ..moveTo(cos(pi / 3) * 2 * -tl / 3, sin(pi / 3) * 2 * tl / 3) //big branch
      ..lineTo(cos(pi / 3) * 2 * -tl / 3 - bl, sin(pi / 3) * 2 * tl / 3)
      ..moveTo(cos(pi / 3) * 2 * -tl / 3, sin(pi / 3) * 2 * tl / 3)
      ..lineTo((cos(pi / 3) * 2 * -tl / 3) + (cos(pi / 3) * bl),
          (sin(pi / 3) * 2 * tl / 3) + (sin(pi / 3) * bl))
      ..moveTo(0, 0) //left trunk
      ..lineTo(-tl, 0)
      ..moveTo(-tl / 3, 0) //smallbranch
      ..lineTo(((-tl / 3) - (cos(pi / 3) * sbl)), (sin(pi / 3) * sbl))
      ..moveTo(-tl / 3, 0)
      ..lineTo(((-tl / 3) - (cos(pi / 3) * sbl)), (sin(pi / 3) * (-sbl)))
      ..moveTo(2 * -tl / 3, 0) //big branch
      ..lineTo(2 * -tl / 3 - (cos(pi / 3) * bl), sin(pi / 3) * bl)
      ..moveTo(2 * -tl / 3, 0)
      ..lineTo(2 * -tl / 3 - (cos(pi / 3) * bl), -(sin(pi / 3) * bl))
      ..moveTo(0, 0) //top left trunk
      ..lineTo(cos(pi / 3) * -tl, sin(pi / 3) * -tl)
      ..moveTo(cos(pi / 3) * -tl / 3, sin(pi / 3) * -tl / 3) //smallbranch
      ..lineTo(((cos(pi / 3) * -tl / 3) - sbl), (sin(pi / 3) * -tl / 3))
      ..moveTo(cos(pi / 3) * -tl / 3, sin(pi / 3) * -tl / 3)
      ..lineTo((cos(pi / 3) * -tl / 3) - (cos(pi / 3) * -sbl),
          (sin(pi / 3) * -tl / 3) - (sin(pi / 3) * sbl))
      ..moveTo(
          cos(pi / 3) * 2 * -tl / 3, sin(pi / 3) * 2 * -tl / 3) //big branch
      ..lineTo(cos(pi / 3) * 2 * -tl / 3 - bl, sin(pi / 3) * 2 * -tl / 3)
      ..moveTo(cos(pi / 3) * 2 * -tl / 3, sin(pi / 3) * 2 * -tl / 3)
      ..lineTo((cos(pi / 3) * 2 * -tl / 3) - (cos(pi / 3) * -bl),
          (sin(pi / 3) * 2 * -tl / 3) + (sin(pi / 3) * -bl))
      ..moveTo(0, 0) //top right trunk
      ..lineTo(cos(pi / 3) * tl, sin(pi / 3) * -tl)
      ..moveTo(cos(pi / 3) * tl / 3, sin(pi / 3) * -tl / 3) //smallbranch
      ..lineTo(((cos(pi / 3) * tl / 3) + sbl), (sin(pi / 3) * -tl / 3))
      ..moveTo(cos(pi / 3) * tl / 3, sin(pi / 3) * -tl / 3)
      ..lineTo((cos(pi / 3) * tl / 3) - (cos(pi / 3) * sbl),
          (sin(pi / 3) * (-tl / 3)) - (sin(pi / 3) * sbl))
      ..moveTo(cos(pi / 3) * 2 * tl / 3, sin(pi / 3) * 2 * -tl / 3) //big branch
      ..lineTo(cos(pi / 3) * 2 * tl / 3 + bl, sin(pi / 3) * 2 * -tl / 3)
      ..moveTo(cos(pi / 3) * 2 * tl / 3, sin(pi / 3) * 2 * -tl / 3)
      ..lineTo((cos(pi / 3) * 2 * tl / 3) - (cos(pi / 3) * bl),
          (sin(pi / 3) * 2 * -tl / 3) - (sin(pi / 3) * bl))
      ..moveTo(0, 0) //right trunk
      ..lineTo(tl, 0)
      ..moveTo(tl / 3, 0) //smallbranch
      ..lineTo(((tl / 3) + (cos(pi / 3) * sbl)), (sin(pi / 3) * sbl))
      ..moveTo(tl / 3, 0)
      ..lineTo(((tl / 3) + (cos(pi / 3) * sbl)), (sin(pi / 3) * -(sbl)))
      ..moveTo(2 * tl / 3, 0) //big branch
      ..lineTo(2 * tl / 3 + (cos(pi / 3) * bl), sin(pi / 3) * bl)
      ..moveTo(2 * tl / 3, 0)
      ..lineTo(2 * tl / 3 + (cos(pi / 3) * bl), (sin(pi / 3) * -bl));
    Matrix4 m = Matrix4.identity();
    m.setRotationZ(random.nextDouble() * 6.28319);
    path = path.transform(Float64List.fromList(m.storage.toList()));
  }

  void maintainRestart(Duration time) {
    if (animationProgress.progress(time) == 1.0) {
      restart(time: time);
    }
  }
}
