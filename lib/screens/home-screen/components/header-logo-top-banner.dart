import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderLogoTop extends StatelessWidget {
  const HeaderLogoTop({
    Key key,
    @required this.paddingTopHeader,
    @required this.sheight,
    @required this.textColor,
    @required this.fontfraction,
  }) : super(key: key);

  final double paddingTopHeader;
  final double sheight;
  final textColor;
  final int fontfraction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingTopHeader),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              height: sheight / 15,
              width: sheight / 15,
              child: SvgPicture.asset(
                "assets/images/dev.svg",
                color: textColor,
              )),
          Text(
            'CodeMate',
            style: TextStyle(
                fontSize: sheight / (fontfraction),
                fontWeight: FontWeight.w800,
                color: textColor),
          ),
        ],
      ),
    );
  }
}
