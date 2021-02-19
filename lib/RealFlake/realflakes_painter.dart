import 'package:flutter/material.dart';
import 'package:holiday2020/RealFlake/realflake_model.dart';

class RealFlakePainter extends CustomPainter {
  List<RealFlakeModel> realflake;
  Duration time;
  RealFlakePainter(this.realflake, this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint p = Paint()
      ..color = Colors.lightBlue[100].withAlpha(150)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    realflake.forEach((snowflake) {
      var progress = snowflake.animationProgress.progress(time);
      final animation = snowflake.tween.transform(progress);
      final position = Offset(
          animation.get("x") * size.width, animation.get("y") * size.height);

      canvas.drawPath(snowflake.path.shift(position), p);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
