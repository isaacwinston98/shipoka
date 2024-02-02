import 'package:flutter/material.dart';

class ToolTipCustomShape extends ShapeBorder {

  final bool usePadding;
  const ToolTipCustomShape({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 20));
    double triangleSize = 5; // Adjust the triangle size as needed

    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 3)))
      ..moveTo(rect.centerRight.dx, rect.centerRight.dy - triangleSize) // Move to the bottom-right corner
      ..relativeLineTo(triangleSize * 2, triangleSize) // Draw a line to the tip of the triangle
      ..relativeLineTo(-triangleSize * 2, triangleSize) // Draw a line to the top-right corner of the triangle
      ..close();
  }


  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}