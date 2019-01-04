///
/// Created by NieBin on 2019/1/4
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import 'dart:math';
import 'package:flutter_canvas/math/line.dart';
import 'package:flutter_canvas/math/circle.dart';

const GREEN_NORMAL = Color(0xff6bde54);
const BLUE_DARK2 = Color(0xff01579b);
const BLUE_DARK1 = Color(0xff29b6f6);
const RED_DARK1 = Color(0xfff26388);
const YELLOW_NORMAL = Color(0xfffcce89);

///just test
void _testCircle() {
  var center = Point(100.0, 100.0);
  var p1 =
      Point(center.x + 100.0 * cos(pi / 2), center.y + 100.0 * sin(pi / 2));
  print("p1.x: ${p1.x},p1.y:${p1.y}");
  var p2 = Point(center.x + 100.0 * cos(pi), center.y + 100.0 * sin(pi));
  print("p2.x: ${p2.x},p2.y:${p2.y}");

  var p3 = Point(
      center.x + 100.0 * cos(pi + pi / 2), center.y + 100.0 * sin(pi + pi / 2));
  print("p3.x: ${p3.x},p3.y:${p3.y}");
  var p4 =
      Point(center.x + 100.0 * cos(pi + pi), center.y + 100.0 * sin(pi + pi));
  print("p4.x: ${p4.x},p4.y:${p4.y}");
}

class PolygonUtil {
  static List<Point> convertToPoints(Point center, double r, int num,
      {double startRadian = 0.0}) {
    var list = List<Point>();
    double perRadian = 2.0 * pi / num;
    for (int i = 0; i < num; i++) {
      double radian = i * perRadian + startRadian;
      var p = LineCircle.radianPoint(center, r, radian);
      list.add(p);
    }
    return list;
  }

  static Path drawRoundPolygon(
      List<Point> listPoints, Canvas canvas, Paint paint,
      {double distance = 4.0, double radius = 0.0}) {
    if (radius < 0.01) {
      radius = 6 * distance;
    }
    var path = Path();
    listPoints.add(listPoints[0]);
    listPoints.add(listPoints[1]);
    if (paint.style == PaintingStyle.stroke) {
      listPoints.add(listPoints[2]);
    }
    var p0 = LineInterCircle.intersectionPoint(
        listPoints[1], listPoints[0], distance);
    path.moveTo(p0.x, p0.y);
    for (int i = 0; i < listPoints.length - 2; i++) {
      var p1 = listPoints[i];
      var p2 = listPoints[i + 1];
      var p3 = listPoints[i + 2];
      var interP1 = LineInterCircle.intersectionPoint(p1, p2, distance);
      var interP2 = LineInterCircle.intersectionPoint(p3, p2, distance);
      path.lineTo(interP1.x, interP1.y);
      path.arcToPoint(
        Offset(interP2.x, interP2.y),
        radius: Radius.circular(radius),
      );
    }
    return path;
  }
}
