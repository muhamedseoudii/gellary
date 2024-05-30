import 'package:flutter/material.dart';

class EllipticalGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the gradient
    final gradient = LinearGradient(
      colors: [Color(0xffDDCDFF), Color(0xffEA94D7)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    // Create a rect that fills the canvas
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Create the paint with the gradient
    final paint = Paint()..shader = gradient.createShader(rect);

    // Draw the ellipse with the gradient
    final path = Path()
      ..addOval(Rect.fromLTRB(
        rect.left,
        rect.top - (rect.height / 2),
        rect.right,
        rect.bottom + (rect.height / 2),
      ));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
