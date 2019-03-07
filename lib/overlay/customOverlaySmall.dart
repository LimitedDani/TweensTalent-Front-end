import 'package:flutter/material.dart';
import 'package:tweenstalent/utils.dart' as utils;

class CustomOverlaySmall extends StatefulWidget {
  CustomOverlaySmall({Key key, @required this.overlayEntry, this.child}) : super(key: key);
  OverlayEntry overlayEntry;
  Widget child;
  @override
  State<StatefulWidget> createState() => CustomOverlaySmallState();
}

class CustomOverlaySmallState extends State<CustomOverlaySmall>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> opacityAnimation;
  Animation<double> scaleAnimatoin;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.4).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    scaleAnimatoin =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      color: Colors.black.withOpacity(opacityAnimation.value),
      child: Center(
        child: ScaleTransition(
          scale: scaleAnimatoin,
          child: Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  )),
              child: new Container(
                height: MediaQuery.of(context).size.height / 10,
                width: (MediaQuery.of(context).size.width / 4 * 3) - 2,
                decoration: ShapeDecoration(
                    color: utils.HexColor("#20202D"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        16.0,
                      ),
                    )),
                child: new Stack(
                  children: <Widget>[
                    new Positioned(child: new Align(
                      alignment: FractionalOffset.center,
                      child: widget.child,
                    )),
                    new Positioned(
                        child: new Align(
                            alignment: FractionalOffset.topRight,
                            child: new GestureDetector(
                              onTap: () {
                                controller.reverse().whenComplete(() {
                                  widget.overlayEntry.remove();
                                });
                              },
                              child: new Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ))),
                  ],
                ),
              )),
        ),
      ),
    ));
  }
}
