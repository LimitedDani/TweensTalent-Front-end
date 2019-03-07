import 'package:flutter/material.dart';
import 'package:tweenstalent/utils.dart' as utils;
import 'package:tweenstalent/pages/login.dart';
import 'package:tweenstalent/pages/register.dart';
import 'package:tweenstalent/components/dots.dart';
import 'package:tweenstalent/components/superpower.dart';
import 'package:tweenstalent/overlay/customOverlaySmall.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [];
  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  CustomOverlaySmall customSmallOverlay;
  OverlayEntry overlayEntry;
  int completed;

  @override
  void initState() {
    setState(() {
      overlayEntry = OverlayEntry(builder: (BuildContext context) {
        return customSmallOverlay;
      });
      pages = [
        SuperPower(
            route: "natuurtalent",
            image: "assets/green.png",
            completed: () {
              openCompletePopup();
            },
            title: new Column(
              children: <Widget>[
                new Text(
                  "Natuur"?.toUpperCase(),
                  style: TextStyle(
                      color: utils.HexColor("#1EDE81"), fontSize: 40.0),
                ),
                new Text(
                  "Talent"?.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                )
              ],
            )),
        SuperPower(
            route: "beeldtalent",
            image: "assets/purple.png",
            completed: () {
              openCompletePopup();
            },
            title: new Column(
              children: <Widget>[
                new Text(
                  "Beeld"?.toUpperCase(),
                  style: TextStyle(
                      color: utils.HexColor("#6932A5"), fontSize: 40.0),
                ),
                new Text(
                  "Talent"?.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                )
              ],
            )),
        SuperPower(
            route: "beweegtalent",
            image: "assets/yellow.png",
            completed: () {
              openCompletePopup();
            },
            title: new Column(
              children: <Widget>[
                new Text(
                  "Beweeg"?.toUpperCase(),
                  style: TextStyle(
                      color: utils.HexColor("#FFDD15"), fontSize: 40.0),
                ),
                new Text(
                  "Talent"?.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                )
              ],
            )),
        SuperPower(
            route: "menstalent",
            image: "assets/pink.png",
            completed: () {
              openCompletePopup();
            },
            title: new Column(
              children: <Widget>[
                new Text(
                  "Mens"?.toUpperCase(),
                  style: TextStyle(
                      color: utils.HexColor("#FF66FC"), fontSize: 40.0),
                ),
                new Text(
                  "Talent"?.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                )
              ],
            )),
        SuperPower(
            route: "zelftalent",
            image: "assets/lightblue.png",
            completed: () {
              openCompletePopup();
            },
            title: new Column(
              children: <Widget>[
                new Text(
                  "Zelf"?.toUpperCase(),
                  style: TextStyle(
                      color: utils.HexColor("#00B9F1"), fontSize: 40.0),
                ),
                new Text(
                  "Talent"?.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                )
              ],
            )),
        SuperPower(
            route: "taaltalent",
            image: "assets/darkblue.png",
            completed: () {
              openCompletePopup();
            },
            title: new Column(
              children: <Widget>[
                new Text(
                  "Taal"?.toUpperCase(),
                  style: TextStyle(
                      color: utils.HexColor("#0076FF"), fontSize: 40.0),
                ),
                new Text(
                  "Talent"?.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                )
              ],
            )),
        SuperPower(
            route: "rekentalent",
            image: "assets/red.png",
            completed: () {
              openCompletePopup();
            },
            title: new Column(
              children: <Widget>[
                new Text(
                  "Reken"?.toUpperCase(),
                  style: TextStyle(
                      color: utils.HexColor("#F00D4C"), fontSize: 40.0),
                ),
                new Text(
                  "Talent"?.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                )
              ],
            )),
        SuperPower(
            route: "muziektalent",
            image: "assets/orange.png",
            completed: () {
              openCompletePopup();
            },
            title: new Column(
              children: <Widget>[
                new Text(
                  "Muziek"?.toUpperCase(),
                  style: TextStyle(
                      color: utils.HexColor("#FF9133"), fontSize: 40.0),
                ),
                new Text(
                  "Talent"?.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                )
              ],
            )),
      ];
    });
    super.initState();
  }

  openCompletePopup() {
    utils.countCompletedTalents([
      "natuurtalent",
      "beeldtalent",
      "beweegtalent",
      "menstalent",
      "zelftalent",
      "taaltalent",
      "muziektalent",
      "rekentalent"
    ]).then((result) {
      customSmallOverlay = new CustomOverlaySmall(
        overlayEntry: overlayEntry,
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Text(
                "Je hebt " +
                    result.toString() +
                    " van de 8 talenten voltooid.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
            ),
          ],
        ),
      );
      Navigator.of(context).overlay.insert(overlayEntry);
    });
  }

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
                        "Ontdek jouw superkrachten"?.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      ),
                    ),
                    new SizedBox(
                      height: 20.0,
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: new Text(
                        "Kies uit een talent om mee te beginnen",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                    ),
                    new Expanded(
                      child: new Stack(
                        children: <Widget>[
                          new PageView.builder(
                            physics: new AlwaysScrollableScrollPhysics(),
                            controller: _controller,
                            itemCount: pages.length,
                            itemBuilder: (BuildContext context, int index) {
                              return pages[index];
                            },
                          ),
                          new Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: new Container(
                              color: Colors.transparent,
                              padding: const EdgeInsets.all(10.0),
                              child: new Center(
                                child: new DotsIndicator(
                                  controller: _controller,
                                  itemCount: pages.length,
                                  color: utils.colorLogo1,
                                  onPageSelected: (int page) {
                                    _controller.animateToPage(
                                      page,
                                      duration: _kDuration,
                                      curve: _kCurve,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ])),
    )));
  }
}
