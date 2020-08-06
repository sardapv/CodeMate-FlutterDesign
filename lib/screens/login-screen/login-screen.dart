import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key key,
    @required this.sheight,
    @required this.signUpContainerWidth,
    @required this.signUpContainerXoffset,
    @required this.shiftYheightofLoginContainerBy,
    @required this.opacity,
  }) : super(key: key);

  final double sheight;
  final double signUpContainerWidth;
  final double signUpContainerXoffset;
  final double shiftYheightofLoginContainerBy;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      curve: Curves.fastLinearToSlowEaseIn,
      height: 3 * sheight / 4,
      width: signUpContainerWidth,
      transform: Matrix4.translationValues(
          signUpContainerXoffset, shiftYheightofLoginContainerBy, 0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(opacity),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(sheight / 45),
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: sheight / 30,
                    color: Colors.deepPurple.shade900,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
