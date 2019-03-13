import 'package:flutter/material.dart';
import 'package:tweenstalent/utils.dart' as utils;
import 'package:tweenstalent/pages/login.dart';
import 'package:tweenstalent/pages/register.dart';
import 'package:tweenstalent/components/scrollBar.dart';
import 'package:tweenstalent/components/result.dart';
import 'package:tweenstalent/overlay/customOverlaySmall.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tweenstalent/enum/SuperPower.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
  double four = 0.25;
  double five = 0.25;
  double six = 0.25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Material(
            child: new ScrollbarCustom(
            child: new SingleChildScrollView(
          child: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: new Stack(children: <Widget>[
            new Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: new Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Flexible(
                      flex: 1,
                      child: new Container(
                      padding: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width,
                      child: new Text(
                        "Resultaten"?.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      ),
                    ),),
                    new Flexible(
                      flex: 4,
                      child: new Center(child: Result()),
                    ),
                    new Flexible(
                      flex: 4,
                      child: new Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            child: new Text(
                              "Verzamen 3 superkrachten",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    one = one == 0.25 ? 1.0 : 0.25;
                                  });
                                },
                                child: new Container(
                                  margin: EdgeInsets.all(7),
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: new Column(
                                    children: <Widget>[
                                      new Opacity(
                                        opacity: one,
                                        child: new Image(
                                          image: AssetImage("assets/purple.png"),
                                          fit: BoxFit.contain,
                                          height:
                                          MediaQuery.of(context).size.height / 8,
                                        ),
                                      ),
                                      new AutoSizeText(
                                        "Beeldtalent",
                                        maxLines: 1,
                                        style: TextStyle(color: Colors.white.withOpacity(one)),
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
                                  margin: EdgeInsets.all(7),
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: new Column(
                                    children: <Widget>[
                                      new Opacity(
                                        opacity: two,
                                        child: new Image(
                                          image: AssetImage("assets/green.png"),
                                          fit: BoxFit.contain,
                                          height:
                                          MediaQuery.of(context).size.height / 8,
                                        ),
                                      ),
                                      new AutoSizeText(
                                        "Natuurtalent",
                                        maxLines: 1,
                                        style: TextStyle(color: Colors.white.withOpacity(two)),
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
                                  margin: EdgeInsets.all(7),
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: new Column(
                                    children: <Widget>[
                                      new Opacity(
                                        opacity: three,
                                        child: new Image(
                                          image: AssetImage("assets/yellow.png"),
                                          fit: BoxFit.contain,
                                          height:
                                          MediaQuery.of(context).size.height / 8,
                                        ),
                                      ),
                                      new AutoSizeText(
                                        "Beweegtalent",
                                        maxLines: 1,
                                        style: TextStyle(color: Colors.white.withOpacity(three)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    four = four == 0.25 ? 1.0 : 0.25;
                                  });
                                },
                                child: new Container(
                                  margin: EdgeInsets.all(7),
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: new Column(
                                    children: <Widget>[
                                      new Opacity(
                                        opacity: four,
                                        child: new Image(
                                          image: AssetImage("assets/red.png"),
                                          fit: BoxFit.contain,
                                          height:
                                          MediaQuery.of(context).size.height / 8,
                                        ),
                                      ),
                                      new AutoSizeText(
                                        "Muziektalent",
                                        maxLines: 1,
                                        style: TextStyle(color: Colors.white.withOpacity(four)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    five = five == 0.25 ? 1.0 : 0.25;
                                  });
                                },
                                child: new Container(
                                  margin: EdgeInsets.all(7),
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: new Column(
                                    children: <Widget>[
                                      new Opacity(
                                        opacity: five,
                                        child: new Image(
                                          image: AssetImage("assets/orange.png"),
                                          fit: BoxFit.contain,
                                          height:
                                          MediaQuery.of(context).size.height / 8,
                                        ),
                                      ),
                                      new AutoSizeText(
                                        "Rekentalent",
                                        maxLines: 1,
                                        style: TextStyle(color: Colors.white.withOpacity(five)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    six = six == 0.25 ? 1.0 : 0.25;
                                  });
                                },
                                child: new Container(
                                  margin: EdgeInsets.all(7),
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: new Column(
                                    children: <Widget>[
                                      new Opacity(
                                        opacity: six,
                                        child: new Image(
                                          image: AssetImage("assets/pink.png"),
                                          fit: BoxFit.contain,
                                          height:
                                          MediaQuery.of(context).size.height / 8,
                                        ),
                                      ),
                                      new AutoSizeText(
                                        "Menstalent",
                                        maxLines: 1,
                                        style: TextStyle(color: Colors.white.withOpacity(six)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    new Flexible(
                      flex: 1,
                      child: new Container(
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
                        onPressed: checkIfThreeSelected() ? () {Navigator.pushReplacementNamed(context, "/occupationalprofile");} : null,
                        color: utils.HexColor("#AA1741"),
                      ),
                      margin: new EdgeInsets.only(top: 20.0),
                    ),)
                  ],
                )),
          ]))),
    )));
  }
  bool checkIfThreeSelected() {
    int selected = 0;
    if(one == 1.0) {
      selected++;
    }
    if(two == 1.0) {
      selected++;
    }
    if(three == 1.0) {
      selected++;
    }
    if(four == 1.0) {
      selected++;
    }
    if(five == 1.0) {
      selected++;
    }
    if(six == 1.0) {
      selected++;
    }
    return selected > 2;
  }
}
