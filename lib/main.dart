import 'package:flutter/material.dart';
import 'OpenPainter.dart';
import 'package:flutter_canvas/SizeUtil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Canvas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeUtil.size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("First Canvas"),
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
