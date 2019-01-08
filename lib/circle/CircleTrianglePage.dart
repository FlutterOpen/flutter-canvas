import 'package:flutter/material.dart';
import 'CircleTrianglePainter.dart';
import 'package:flutter_canvas/const/PageConst.dart';

class CircleTrianglePage extends StatefulWidget {
  @override
  _CircleTriangleState createState() => _CircleTriangleState();
}

class _CircleTriangleState extends State<CircleTrianglePage> {
  double _len = 0.0;
  double _x = 0.0;
  double _y = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PageConst.LOGO_PAGE),
      ),
      body: Container(
          child: Center(
        child: GestureDetector(
          onHorizontalDragStart: (detail) {
            _x = detail.globalPosition.dx;
          },
          onVerticalDragStart: (detail) {
            _y = detail.globalPosition.dy;
          },
          onHorizontalDragUpdate: (detail) {
            setState(() {
              _len -= detail.globalPosition.dx - _x;
              _x = detail.globalPosition.dx;
            });
          },
          onVerticalDragUpdate: (detail) {
            setState(() {
              _len += detail.globalPosition.dy - _y;
              _y = detail.globalPosition.dy;
            });
          },
          child: Container(
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: (CircleTrianglePainter(scrollLen: _len)),
              child: Container(),
            ),
          ),
        ),
      )),
    );
  }
}
