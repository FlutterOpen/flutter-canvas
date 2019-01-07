import 'package:flutter/material.dart';
import 'CirclePainter.dart';
import 'package:flutter_canvas/const/PageConst.dart';

class CirclePage extends StatefulWidget {
  @override
  _CircleState createState() => _CircleState();
}

class _CircleState extends State<CirclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PageConst.LOGO_PAGE),
      ),
      body: Container(
          child: Center(
        child: Container(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: CirclePainter(),
          ),
        ),
      )),
    );
  }
}
