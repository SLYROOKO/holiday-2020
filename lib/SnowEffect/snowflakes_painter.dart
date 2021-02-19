import 'package:flutter/material.dart';
import 'package:holiday2020/SnowEffect/snowflake_model.dart';

class SnowflakesPainter extends CustomPainter {
  List<SnowflakeModel> snowflakes;
  Duration time;
  SnowflakesPainter(this.snowflakes, this.time);

  @override
  void paint(Canvas canvas, Size size) {

    final Paint p = Paint()
      ..color = Colors.lightBlue[100].withAlpha(150)
      ..style = PaintingStyle.fill;

    snowflakes.forEach((snowflake) {
        
      var progress = snowflake.animationProgress.progress(time);
      final animation = snowflake.tween.transform(progress);
      final position =
          Offset(animation.get("x") * size.width, animation.get("y") * size.height);
      canvas.drawCircle(position, size.width * 0.2 * snowflake.size, p);

    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}