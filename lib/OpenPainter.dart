///
/// Created by NieBin on 2019/1/1
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///

import "package:flutter/material.dart";
import 'SizeUtil.dart';
import 'dart:math';

const BLUE_NORMAL = Color(0xff54c5f8);
const GREEN_NORMAL = Color(0xff6bde54);
const BLUE_DARK2 = Color(0xff01579b);
const BLUE_DARK1 = Color(0xff29b6f6);

class OpenPainter extends CustomPainter {
  void _drawFourShape(Canvas canvas,
      {Offset left_top,
      Offset right_top,
      Offset right_bottom,
      Offset left_bottom,
      Size size,
      paint}) {
    left_top = _convertLogicSize(left_top, size);
    right_top = _convertLogicSize(right_top, size);
    right_bottom = _convertLogicSize(right_bottom, size);
    left_bottom = _convertLogicSize(left_bottom, size);
    var path1 = Path()
      ..moveTo(left_top.dx, left_top.dy)
      ..lineTo(right_top.dx, right_top.dy)
      ..lineTo(right_bottom.dx, right_bottom.dy)
      ..lineTo(left_bottom.dx, left_bottom.dy);
    canvas.drawPath(path1, paint);
  }

  Offset _convertLogicSize(Offset off, Size size) {
    return Offset(SizeUtil.getAxisX(off.dx), SizeUtil.getAxisY(off.dy));
  }

  @override
  void paint(Canvas canvas, Size size) {
    //580*648
    if (size.width > 1.0 && size.height > 1.0) {
      print(">1.9");
      SizeUtil.size = size;
    }
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = BLUE_NORMAL
      ..isAntiAlias = true;
    _drawFourShape(canvas,
        left_top: Offset(291, 178),
        right_top: Offset(580, 458),
        right_bottom: Offset(580, 628),
        left_bottom: Offset(203, 267),
        size: size,
        paint: paint);
    _drawFourShape(canvas,
        left_top: Offset(156, 314),
        right_top: Offset(312, 468),
        right_bottom: Offset(312, 645),
        left_bottom: Offset(70, 402),
        size: size,
        paint: paint);
    paint.color = BLUE_DARK2;
    _drawFourShape(canvas,
        left_top: Offset(156, 314),
        right_top: Offset(245, 402),
        right_bottom: Offset(4, 643),
        left_bottom: Offset(4, 467),
        size: size,
        paint: paint);
    paint.color = BLUE_DARK1;
    _drawFourShape(canvas,
        left_top: Offset(156, 314),
        right_top: Offset(245, 402),
        right_bottom: Offset(157, 490),
        left_bottom: Offset(70, 402),
        size: size,
        paint: paint);
    var circleCenter = Offset(SizeUtil.getAxisX(294), SizeUtil.getAxisY(175));
    paint.color = BLUE_NORMAL;
    canvas.drawCircle(circleCenter, SizeUtil.getAxisBoth(174), paint);
    paint.color = GREEN_NORMAL;
    canvas.drawCircle(circleCenter, SizeUtil.getAxisBoth(124), paint);
    paint.color = Colors.white;
    canvas.drawCircle(circleCenter, SizeUtil.getAxisBoth(80), paint);
    canvas.save();
    canvas.restore();

//    _drawFourShape(canvas, left_top: Offset(291, 178));
//    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
