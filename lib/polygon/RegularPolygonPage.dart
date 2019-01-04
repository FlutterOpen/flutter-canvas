import 'package:flutter/material.dart';
import 'RegularPolygonPainter.dart';
import 'package:flutter_canvas/const/PageConst.dart';

class RegularPolygonPage extends StatefulWidget {
  @override
  _RegularState createState() => _RegularState();
}

class _RegularState extends State<RegularPolygonPage> {
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
            painter: RegularPolygonPainter(),
          ),
        ),
      )),
    );
  }
}
