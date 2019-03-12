import 'package:flutter/material.dart';
import 'package:tweenstalent/utils.dart' as utils;
import 'package:tweenstalent/pages/login.dart';
import 'package:tweenstalent/pages/register.dart';
import 'package:tweenstalent/components/dots.dart';
import 'package:tweenstalent/components/result.dart';
import 'package:tweenstalent/overlay/customOverlaySmall.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tweenstalent/enum/SuperPower.dart';
class ResultPage extends StatefulWidget {
  ResultPage({Key key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    super.initState();
  }
  double one = 0.25;
  double two = 0.25;
  double three = 0.25;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Material(
            child: new SingleChildScrollView(
      child: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: new Stack(children: <Widget>[
            new Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: new Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width,
                      child: new Text(
                        "Resultaten"?.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      ),
                    ),
                    new SizedBox(
                      height: 20.0,
                    ),
                    Result(),
                    new SizedBox(
                      height: 20.0,
                    ),
                    new Container(
                      padding: EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width,
                      child: new Text(
                        "Verzamen 3 superkrachten",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new GestureDetector(
                          onTap: () {
                            setState(() {
                              one = one == 0.25 ? 1.0 : 0.25;
                            });
                          },
                          child: new Container(
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 4,
                            child: new Column(
                              children: <Widget>[
                                new Opacity(
                                  opacity: one,
                                  child: new Image(
                                    image: AssetImage("assets/purple.png"),
                                    fit: BoxFit.contain,
                                    height:
                                    MediaQuery.of(context).size.height / 6,
                                  ),
                                ),
                                new Text(
                                  "Beeldtalent",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        new GestureDetector(
                          onTap: () {
                            setState(() {
                              two = two == 0.25 ? 1.0 : 0.25;
                            });
                          },
                          child: new Container(
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 4,
                            child: new Column(
                              children: <Widget>[
                                new Opacity(
                                  opacity: two,
                                  child: new Image(
                                    image: AssetImage("assets/green.png"),
                                    fit: BoxFit.contain,
                                    height:
                                    MediaQuery.of(context).size.height / 6,
                                  ),
                                ),
                                new Text(
                                  "Natuurtalent",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        new GestureDetector(
                          onTap: () {
                            setState(() {
                              three = three == 0.25 ? 1.0 : 0.25;
                            });
                          },
                          child: new Container(
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 4,
                            child: new Column(
                              children: <Widget>[
                                new Opacity(
                                  opacity: three,
                                  child: new Image(
                                    image: AssetImage("assets/yellow.png"),
                                    fit: BoxFit.contain,
                                    height:
                                    MediaQuery.of(context).size.height / 6,
                                  ),
                                ),
                                new Text(
                                  "Beweegtalent",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new GestureDetector(
                          onTap: () {
                            setState(() {
                              one = one == 0.25 ? 1.0 : 0.25;
                            });
                          },
                          child: new Container(
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 4,
                            child: new Column(
                              children: <Widget>[
                                new Opacity(
                                  opacity: one,
                                  child: new Image(
                                    image: AssetImage("assets/purple.png"),
                                    fit: BoxFit.contain,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                  ),
                                ),
                                new Text(
                                  "Beeldtalent",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        new GestureDetector(
                          onTap: () {
                            setState(() {
                              two = two == 0.25 ? 1.0 : 0.25;
                            });
                          },
                          child: new Container(
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 4,
                            child: new Column(
                              children: <Widget>[
                                new Opacity(
                                  opacity: two,
                                  child: new Image(
                                    image: AssetImage("assets/green.png"),
                                    fit: BoxFit.contain,
                                    height:
                                    MediaQuery.of(context).size.height / 6,
                                  ),
                                ),
                                new Text(
                                  "Natuurtalent",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        new GestureDetector(
                          onTap: () {
                            setState(() {
                              three = three == 0.25 ? 1.0 : 0.25;
                            });
                          },
                          child: new Container(
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 4,
                            child: new Column(
                              children: <Widget>[
                                new Opacity(
                                  opacity: three,
                                  child: new Image(
                                    image: AssetImage("assets/yellow.png"),
                                    fit: BoxFit.contain,
                                    height:
                                    MediaQuery.of(context).size.height / 6,
                                  ),
                                ),
                                new Text(
                                  "Beweegtalent",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width / 2.8,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: utils.HexColor("#AA1741"),
                          offset: Offset(0.0, 1.5),
                          blurRadius: 20.0,
                        ),
                      ]),
                      child: new RaisedButton(
                        child: new Text(
                          'Volgende',
                          style: new TextStyle(color: Colors.white),
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius:
                            new BorderRadius.circular(30.0)),
                        onPressed: () {Navigator.pushReplacementNamed(context, "/home");},
                        color: utils.HexColor("#AA1741"),
                      ),
                      margin: new EdgeInsets.only(top: 20.0),
                    ),
                  ],
                )),
          ])),
    )));
  }
}
