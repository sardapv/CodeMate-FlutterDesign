import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MainScreenMotoBanner extends StatelessWidget {
  const MainScreenMotoBanner({
    Key key,
    @required this.sheight,
    @required this.shareyourStringFraction,
    @required this.lightTextColor,
    @required this.animatedTextFraction,
    @required this.textColor,
  }) : super(key: key);

  final double sheight;
  final int shareyourStringFraction;
  final lightTextColor;
  final int animatedTextFraction;
  final textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Expanded(
            child: Text(
          'Share your',
          style: TextStyle(
              fontSize: sheight / shareyourStringFraction,
              fontWeight: FontWeight.w500,
              color: lightTextColor),
          textAlign: TextAlign.end,
        )),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: TyperAnimatedTextKit(
            isRepeatingAnimation: true,
            speed: Duration(milliseconds: 100),
            text: [
              'Idea!',
              'Skills!',
              'Code!',
            ],
            textStyle: TextStyle(
              fontSize: sheight / animatedTextFraction,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
