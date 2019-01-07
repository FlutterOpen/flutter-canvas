import 'package:flutter/material.dart';
import 'package:flutter_canvas/const/size_const.dart';
import 'package:flutter_canvas/logo/LogoPage.dart';
import 'package:flutter_canvas/const/PageConst.dart';
import 'package:flutter_canvas/const/ImageConst.dart';
import "package:flutter_canvas/polygon/RoundPolygonPage.dart";
import 'package:flutter_canvas/polygon/RegularPolygonPage.dart';
import 'package:flutter_canvas/circle/CirclePage.dart';

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
        PageConst.ROUND_ANGLE_POLYGON_PAGE: (context) => RoundPolygonPage(),
        PageConst.REGULAR_POLYGON_PAGE: (context) => RegularPolygonPage(),
        PageConst.CIRCLE_PAGE: (context) => CirclePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//const PAGES = [PageConst.LOGO_PAGE, PageConst.CHART_PAGE];
const PAGES_CONST = [
  {
    "image": ImageConst.LOGO_CANVAS,
    "title": "Use canvas",
    "click": PageConst.LOGO_PAGE,
  },
  {
    "image": ImageConst.CIRCLE_ROUND_ANGLE,
    "title": "Round angle polygon",
    "click": PageConst.ROUND_ANGLE_POLYGON_PAGE,
  },
  {
    "image": ImageConst.REGULAR_POLYGON,
    "title": "Regular polygon with round angle",
    "click": PageConst.REGULAR_POLYGON_PAGE,
  },
  {
    "image": ImageConst.REGULAR_POLYGON,
    "title": "Circle",
    "click": PageConst.CIRCLE_PAGE,
  },
];

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeUtil.getInstance().logicSize = MediaQuery.of(context).size;
    SizeUtil.initDesignSize();
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Page"),
      ),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      PAGES_CONST[index]["image"],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.bottomCenter,
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      PAGES_CONST[index]["title"],
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  PAGES_CONST[index]["click"],
                );
              },
            );
          },
          itemCount: PAGES_CONST.length,
        ),
      ),
    );
  }
}
