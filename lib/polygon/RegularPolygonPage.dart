import 'package:flutter/material.dart';
import 'RegularPolygonPainter.dart';
import 'package:flutter_canvas/const/PageConst.dart';

class RegularPolygonPage extends StatefulWidget {
  @override
  _RegularState createState() => _RegularState();
}

class _RegularState extends State<RegularPolygonPage> {
  double _len = 0.0;
  double _x = 0.0;
  double _y = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PageConst.REGULAR_POLYGON_PAGE),
      ),
      body: Container(
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
            child: Center(
              child: Container(
                width: 300,
                height: 300,
                child: CustomPaint(
                  painter: RegularPolygonPainter(startAngle: _len),
                  child: Container(),
                ),
              ),
            )),
      ),
    );
  }
}
