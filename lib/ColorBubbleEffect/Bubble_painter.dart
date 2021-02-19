import 'package:flutter/material.dart';
import 'package:holiday2020/ColorBubbleEffect/Bubble_model.dart';
import 'dart:math';

class BubblesPainter extends CustomPainter {
  List<BubbleModel> bubbles;
  Duration time;
  final Random random = Random();

  BubblesPainter(this.bubbles, this.time);

  @override
  void paint(Canvas canvas, Size size) {
    bubbles.forEach((bubble) {
      final Paint p = Paint()
        ..color = bubble.bubblecolor.withAlpha(95)
        ..blendMode
        ..style = PaintingStyle.fill;

      var progress = bubble.animationProgress.progress(time);
      final animation = bubble.tween.transform(progress);
      final position = Offset(
          animation.get("x") * size.width, animation.get("y") * size.height);
      canvas.drawCircle(position, size.width * 0.2 * bubble.size, p);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
