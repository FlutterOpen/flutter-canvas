///
/// Created by NieBin on 2019/1/1
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///

import "package:flutter/material.dart";

//import 'package:flutter_canvas/size_const.dart';
import 'dart:math';
import 'package:flutter_canvas/const/size_const.dart';
import 'package:flutter_canvas/math/line.dart';

const BLUE_NORMAL = Color(0xff54c5f8);
const GREEN_NORMAL = Color(0xff6bde54);
const BLUE_DARK2 = Color(0xff01579b);
const BLUE_DARK1 = Color(0xff29b6f6);
const RED_DARK1 = Color(0xfff26388);
const RED_DARK2 = Color(0xfff782a0);
const RED_DARK3 = Color(0xfffb8ba8);
const RED_DARK4 = Color(0xfffb89a6);
const RED_DARK5 = Color(0xfffd86a5);
const YELLOW_NORMAL = Color(0xfffcce89);
const List<Point> POINT = [Point(100, 100)];

SizeUtil get _sizeUtil {
  return SizeUtil.getInstance(key: SizeKeyConst.CIRCLE_KEY);
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //580*648
    if (size.width > 1.0 && size.height > 1.0) {
      print(">1.9");
      _sizeUtil.logicSize = size;
    }
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = BLUE_NORMAL
      ..strokeWidth = 2.0
      ..isAntiAlias = true;
    paint.color = Colors.grey[900];
    canvas.drawCircle(
        Offset(_sizeUtil.getAxisX(250), _sizeUtil.getAxisY(250.0)),
        _sizeUtil.getAxisBoth(200.0),
        paint);
    paint.color = RED_DARK1;
    paint.strokeWidth = 20;
    _drawArcWithCenter(canvas, paint);
    canvas.save();
    canvas.restore();
  }

  void _drawArcWithCenter(Canvas canvas, Paint paint) {
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(
            _sizeUtil.getAxisX(250),
            _sizeUtil.getAxisY(250.0),
          ),
          radius: _sizeUtil.getAxisBoth(200.0)),
      pi / 2,
      pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
