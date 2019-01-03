import 'package:flutter/material.dart';
import 'package:flutter_canvas/logo/OpenPainter.dart';
import 'package:flutter_canvas/SizeUtil.dart';
import 'package:flutter_canvas/logo/LogoPage.dart';
import 'package:flutter_canvas/const/PageConst.dart';
import 'package:flutter_canvas/const/ImageConst.dart';
import "package:flutter_canvas/chart/ChartPage.dart";

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
      routes: {
        PageConst.LOGO_PAGE: (context) => LogoPage(),
        PageConst.CHART_PAGE: (context) => ChartPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

const PAGES = [PageConst.LOGO_PAGE, PageConst.CHART_PAGE];

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeUtil.size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("First Canvas"),
      ),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      ImageConst.LOGO_CANVAS,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text("Logo Page"),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context).pushNamed(PAGES[index % 2]);
                print("hello");
              },
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
