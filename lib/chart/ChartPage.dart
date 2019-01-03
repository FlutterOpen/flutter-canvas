import 'package:flutter/material.dart';
import 'package:flutter_canvas/logo/OpenPainter.dart';
import 'package:flutter_canvas/SizeUtil.dart';
import './ChartPainter.dart';
import 'package:flutter_canvas/const/PageConst.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    SizeUtil.size = MediaQuery.of(context).size;
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
            painter: ChartPainter(),
          ),
        ),
      )),
    );
  }
}
