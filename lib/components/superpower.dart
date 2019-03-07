import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class SuperPower extends StatefulWidget {
  Widget title;
  String image;
  String route;
  Function completed;
  SuperPower(
      {@required this.title,
      @required this.image,
      @required this.route,
      this.completed});

  @override
  _SuperPowerState createState() => _SuperPowerState();
}

class _SuperPowerState extends State<SuperPower> {
  bool completed = false;

  @override
  void initState() {
    getCompleted(widget.route);
    super.initState();
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: completed
          ? null
          : () {
              onTap();
            },
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Positioned(
                  child: Align(
                      child: new Container(
                        height: MediaQuery.of(context).size.height / 2.8,
                        width: MediaQuery.of(context).size.width,
                        child: new Opacity(
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.fill,
                  ),
                  opacity: completed ? 0.25 : 1.0,
                ),
                alignment: AlignmentDirectional.center,
              ))),
              new Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  top: 0.0,
                  child: new Opacity(
                    child: new Image(image: AssetImage("assets/done.png")),
                    opacity: completed ? 1.0 : 0.0,
                  )),
            ],
          ),
          widget.title
        ],
      ),
    );
  }

  onTap() async {
    final result =
        await Navigator.of(context).pushNamed("/questions/" + widget.route);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (result == true) {
      prefs.setBool(widget.route, true);
      widget.completed();
      getCompleted(widget.route);
    }
  }

  getCompleted(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      completed = prefs.getBool(key) != null ? prefs.getBool(key) : false;
    });
  }
}
