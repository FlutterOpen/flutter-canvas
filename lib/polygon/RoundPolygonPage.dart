import 'package:flutter/material.dart';
import './RoundPolygonPainter.dart';
import 'package:flutter_canvas/const/PageConst.dart';

class RoundPolygonPage extends StatefulWidget {
  @override
  _RoundState createState() => _RoundState();
}

class _RoundState extends State<RoundPolygonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PageConst.ROUND_ANGLE_POLYGON_PAGE),
      ),
      body: Container(
          child: Center(
        child: Container(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: RoundPolygonPainter(),
          ),
        ),
      )),
    );
  }
}
