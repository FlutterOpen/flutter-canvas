import 'package:flutter/material.dart';
import 'package:flutter_canvas/logo/OpenPainter.dart';
import 'OpenPainter.dart';
import 'package:flutter_canvas/const/PageConst.dart';

class LogoPage extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<LogoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PageConst.LOGO_PAGE),
      ),
      body: Container(
          child: Center(
        child: Container(
          width: 280,
          height: 320.0,
          child: CustomPaint(
            painter: OpenPainter(),
          ),
        ),
      )),
    );
  }
}
