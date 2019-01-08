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
import 'PolygonUtil.dart';

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
  return SizeUtil.getInstance(key: SizeKeyConst.REGULAR_POLYGON_KEY);
}

class RegularPolygonPainter extends CustomPainter {
  RegularPolygonPainter({this.startAngle});

  final double startAngle;

  @override
  void paint(Canvas canvas, Size size) {
    //580*648
    if (size.width > 1.0 && size.height > 1.0) {
      print(">1.9");
      _sizeUtil.logicSize = size;
    }
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = BLUE_NORMAL
      ..strokeWidth = 10.0
      ..isAntiAlias = true;
    var center = Point(250.0, 250.0);
    var colors = [
      RED_DARK1,
      RED_DARK2,
      YELLOW_NORMAL,
      BLUE_DARK1,
      RED_DARK3,
      BLUE_NORMAL
    ];
    _drawSameCenterPolygon(canvas, paint,
        center: center,
        max: 250,
        min: 10,
        count: 7,
        polygonCount: 4,
        step: 40,
        colors: colors,
        rotateRadio: 0.1,
        startAngle: startAngle);
    canvas.save();
    canvas.restore();
  }

  void _drawSameCenterPolygon(Canvas canvas, Paint paint,
      {Point center,
      double max = 1.0,
      double min = 1.0,
      double step = 1.0,
      int count = 1,
      int polygonCount,
      List<Color> colors,
      rotateRadio = 0.1,
      double startAngle = 0.0}) {
    for (int i = 0; i < count; i++) {
      assert(polygonCount >= 3);
      assert(colors != null && colors.length > 0);
      var radius = max - i * step;
      var index = i % colors.length;
      paint.color = colors[index];
      if (radius < min) {
        radius = min;
        List<Point> list4 = PolygonUtil.convertToPoints(
          center,
          radius,
          polygonCount,
        );
        _drawWithPoint(canvas, paint, list4);
        break;
      }
      List<Point> list4 = PolygonUtil.convertToPoints(
          center, radius, polygonCount,
          startRadian: 2 * startAngle / max + i * pi * rotateRadio);
      _drawWithPoint(canvas, paint, list4);
    }
  }

  void _drawWithPoint(canvas, paint, list, {hasShadow = false}) {
    list = _resizePoint(list);
    var path = PolygonUtil.drawRoundPolygon(list, canvas, paint, distance: 2.0);
    if (hasShadow) {
      canvas.drawShadow(path, Colors.black26, 10.0, true);
    }
    canvas.drawPath(path, paint);
  }

  List<Point> _resizePoint(List<Point> list) {
    List<Point> l = List<Point>();
    for (var p in list) {
      l.add(Point(_sizeUtil.getAxisX(p.x), _sizeUtil.getAxisY(p.y)));
    }
    return l;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
