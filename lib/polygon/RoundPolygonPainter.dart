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
  return SizeUtil.getInstance(key: SizeKeyConst.ROUND_ANGLE_KEY);
}

class RoundPolygonPainter extends CustomPainter {
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
      ..isAntiAlias = true;
    List<Point> list1 = [
      Point(250.0, 0.0),
      Point(425.0, 75.0),
      Point(500.0, 250.0),
      Point(425.0, 425.0),
      Point(250.0, 500.0),
      Point(75.0, 426.0),
      Point(0.0, 250.0),
      Point(75.0, 75.0),
    ];
    paint.color = RED_DARK1;
    _drawWithPoint(canvas, paint, list1);
    List<Point> list2 = [
      Point(250.0, 53.0),
      Point(392.0, 108.0),
      Point(449.0, 250.0),
      Point(392.0, 390.0),
      Point(250.0, 448.0),
      Point(110.0, 390.0),
      Point(54.0, 250.0),
      Point(110.0, 108.0),
    ];
    paint.color = RED_DARK2;
    _drawWithPoint(canvas, paint, list2, hasShadow: true);

    List<Point> list3 = [
      Point(250.0, 100.0),
      Point(358.0, 143.0),
      Point(400.0, 250.0),
      Point(355.0, 355.0),
      Point(250.0, 400.0),
      Point(144.0, 357.0),
      Point(100.0, 250.0),
      Point(144.0, 144.0),
    ];
    paint.color = RED_DARK3;
    _drawWithPoint(canvas, paint, list3, hasShadow: true);

    List<Point> list4 = [
      Point(250.0, 150.0),
      Point(320.0, 180.0),
      Point(348.0, 250.0),
      Point(320.0, 320.0),
      Point(250.0, 348.0),
      Point(180.0, 320.0),
      Point(150.0, 250.0),
      Point(180.0, 180.0),
    ];
    paint.color = RED_DARK4;
    _drawWithPoint(canvas, paint, list4, hasShadow: true);

    List<Point> list5 = [
      Point(250.0, 202.0),
      Point(286.0, 217.0),
      Point(300.0, 250.0),
      Point(284.0, 284.0),
      Point(250.0, 300.0),
      Point(214.0, 282.0),
      Point(202.0, 250.0),
      Point(216.0, 216.0),
    ];
    paint.color = RED_DARK5;
    _drawWithPoint(canvas, paint, list5, hasShadow: true);

    List<Point> listYellow = [
      Point(110.0, 104.0),
      Point(250.0, 153.0),
      Point(358.0, 143.0),
      Point(450.0, 252.0),
      Point(369.0, 349.0),
      Point(250.0, 504.0),
      Point(140.0, 353.0),
      Point(100.0, 250.0),
    ];
    paint.color = YELLOW_NORMAL.withOpacity(0.5);
    _drawWithPoint(canvas, paint, listYellow);
    canvas.save();
    canvas.restore();
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
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
