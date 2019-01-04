///
/// Created by NieBin on 2019/1/4
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com

import "package:flutter/material.dart";
import 'dart:math';

class LineCircle {
  ///give the center ,radius of the circle,
  ///and have radian from x clockwise direction.
  ///you can get the point coordinate in the circle.
  static Point radianPoint(Point center, double r, double radian) {
    return Point(center.x + r * cos(radian), center.y + r * sin(radian));
  }
}
