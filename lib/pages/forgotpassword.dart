import 'package:flutter/material.dart';
import 'package:tweenstalent/utils.dart' as utils;
import 'package:tweenstalent/overlay/customOverlay.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  CustomOverlay customOverlay;
  OverlayEntry overlayEntry;

  @override
  void initState() {
    setState(() {
      overlayEntry = OverlayEntry(builder: (BuildContext context) {
        return customOverlay;
      });
      customOverlay = new CustomOverlay(
        overlayEntry: overlayEntry,
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(top: 30),
              child: new Text(
                "Verzonden"?.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            new Container(
                padding: EdgeInsets.only(top: 30),
                child: new Column(
              children: <Widget>[
                new Text(
                  "Wij hebben een nieuw wachtwoord",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      "naar je ",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    new Text(
                      "email-adres",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: utils.colorLogo1, fontSize: 15.0),
                    ),
                    new Text(
                      " verstuurd.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ],
                ),
                new Container(
                  padding: EdgeInsets.only(top: 30),
                  child: new Text(
                    "Geen mail ontvangen? Check voor",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
                new Container(
                  child: new Text(
                    "de zekerheid je spamfolder.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ],
            )),
          ],
        ),
      );
    });
    super.initState();
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
                child: new Stack(children: <Widget>[
                  new Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: new Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "Wachtwoord vergeten?"?.toUpperCase(),
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 40.0),
                          ),
                          new SizedBox(
                            height: 40.0,
                          ),
                          new Form(
                              key: this._formKey,
                              child: new Container(
                                width: MediaQuery.of(context).size.width / 1.3,
                                child: new Column(
                                  children: <Widget>[
                                    new Container(
                                      padding: EdgeInsets.only(left: 20.0),
                                      margin: EdgeInsets.only(bottom: 20.0),
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(10.0)),
                                        color: Colors.white,
                                      ),
                                      child: new TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'you@example.com',
                                            labelText: 'E-mailadres',
                                          )),
                                    ),
                                    new Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
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
                                              'Terug',
                                              style: new TextStyle(color: Colors.white),
                                            ),
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                new BorderRadius.circular(30.0)),
                                            onPressed: () {Navigator.pop(context);},
                                            color: utils.HexColor("#AA1741"),
                                          ),
                                          margin: new EdgeInsets.only(top: 20.0),
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
                                              'Aanvragen',
                                              style: new TextStyle(color: Colors.white),
                                            ),
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                new BorderRadius.circular(30.0)),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .overlay
                                                  .insert(overlayEntry);
                                            },
                                            color: utils.HexColor("#AA1741"),
                                          ),
                                          margin: new EdgeInsets.only(top: 20.0),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      )),
                ]))));
  }
}
