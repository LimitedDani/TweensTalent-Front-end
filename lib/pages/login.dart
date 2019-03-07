import 'package:flutter/material.dart';
import 'package:tweenstalent/utils.dart' as utils;

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

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
                            "Inloggen"?.toUpperCase(),
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
                                    new Container(
                                      padding: EdgeInsets.only(left: 20.0),
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(10.0)),
                                        color: Colors.white,
                                      ),
                                      child: new TextFormField(
                                          obscureText: true,
                                          decoration: new InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '•••••••••••',
                                              labelText: 'Wachtwoord')),
                                    ),
                                    new GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, "/forgotpassword");
                                      },
                                      child: new Container(
                                        margin: EdgeInsets.only(top: 20.0),
                                        child: new Text(
                                          "Wachtwoord vergeten?",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.0),
                                        ),
                                      ),
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
                                              'Login',
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
                                              'Registreren',
                                              style: new TextStyle(color: Colors.white),
                                            ),
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                new BorderRadius.circular(30.0)),
                                            onPressed: () {
                                              Navigator.pushNamed(context, "/register");
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
