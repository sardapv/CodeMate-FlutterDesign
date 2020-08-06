import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    Key key,
    @required this.sheight,
    @required this.swidth,
    @required this.shiftYheightofSignUpContainerBy,
  }) : super(key: key);

  final double sheight;
  final double swidth;
  final double shiftYheightofSignUpContainerBy;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        height: 3 * sheight / 4,
        width: swidth,
        transform:
            Matrix4.translationValues(0, shiftYheightofSignUpContainerBy, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Container(
          color: Colors.white,
        ));
  }
}
