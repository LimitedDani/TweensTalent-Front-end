import 'package:flutter/material.dart';
import 'package:tweenstalent/utils.dart' as utils;

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double opacity = 1.0;
  @override
  initState() {
    super.initState();
    controller =
        new AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    final CurvedAnimation curve =
        new CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    final animation = new Tween<double>(begin: 0.2, end: 1.0).animate(curve)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed)
          controller.reverse();
        else if (status == AnimationStatus.dismissed) controller.forward();
      });
    animation.addListener(() => setState(() => opacity = animation.value));
    controller.forward();
    new Future.delayed(Duration(seconds: 3), () {
      controller.stop();
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Material(
            child: new Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: new Image(image: AssetImage("assets/logo.png")),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(bottomLeft: new Radius.circular(90.0), bottomRight: new Radius.circular(90.0)),
                boxShadow: [
              BoxShadow(
                color: utils.colorLogo1.withOpacity(opacity),
                offset: Offset(0.0, 3.0),
                blurRadius: 100,
              ),
            ]),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Tweens"?.toUpperCase(),
                style: TextStyle(
                    color: utils.colorLogo1,
                    fontSize: 70.0,
                    fontFamily: "Bold Testament"),
              ),
              new Text(
                "Talent"?.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 70.0,
                    fontFamily: "Bold Testament"),
              )
            ],
          ),
          new Container(
            child: new Text(
              "Ontdek je eigen superkrachten",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          )
        ],
      ),
    )));
  }
}
