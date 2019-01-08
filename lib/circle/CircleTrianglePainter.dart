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
import 'package:flutter_canvas/math/circle.dart';

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
  return SizeUtil.getInstance(key: SizeKeyConst.CIRCLE_TRIANGLE_KEY);
}

class CircleTrianglePainter extends CustomPainter {
  CircleTrianglePainter({this.scrollLen});

  final double scrollLen;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width > 1.0 && size.height > 1.0) {
      print(">1.9");
      _sizeUtil.logicSize = size;
    }
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = BLUE_NORMAL
      ..strokeWidth = 2.0
      ..isAntiAlias = true;
    paint.color = Colors.grey[900];
//    canvas.drawCircle(
//        Offset(_sizeUtil.getAxisX(250), _sizeUtil.getAxisY(250.0)),
//        _sizeUtil.getAxisBoth(200.0),
//        paint);
    paint.color = RED_DARK1;
    paint.strokeWidth = 20;
    paint.style = PaintingStyle.stroke;
    var center = Offset(
      _sizeUtil.getAxisX(250.0),
      _sizeUtil.getAxisY(250.0),
    );
    var radius = _sizeUtil.getAxisBoth(200);
    paint.style = PaintingStyle.fill;
//    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
//        1.4 * scrollLen / radius, pi / 2, true, paint);
    _drawTriCircle(
      canvas,
      paint,
      sources: [1,2,1,1,1,1,1],
      colors: [
        RED_DARK1,
        BLUE_NORMAL,
      GREEN_NORMAL,
        RED_DARK5,
        YELLOW_NORMAL
      ],
      center: center,
      radius: radius,
      startRadian: 1.4 * scrollLen / radius,
    );
    canvas.save();
    canvas.restore();
  }

  void _drawTriCircle(Canvas canvas, Paint paint,
      {Offset center,
      double radius,
      List<double> sources,
      List<Color> colors,
      double startRadian}) {
    assert(sources != null && sources.length > 0);
    assert(colors != null && colors.length > 0);
    var total = 0.0;
    for (var d in sources) {
      total += d;
    }
    List<double> radians = [];
    for (var data in sources) {
      radians.add(data * 2 * pi / total);
    }
    for (int i = 0; i < radians.length; i++) {
      paint.color = colors[i % colors.length];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, radians[i], true, paint);
      startRadian += radians[i];
    }
  }

  @override
  bool shouldRepaint(CircleTrianglePainter oldDelegate) =>
      oldDelegate.scrollLen != scrollLen;
}
