import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_animations/screens/home-screen/components/header-logo-top-banner.dart';
import 'package:learn_animations/screens/home-screen/components/main-screen-moto-banner.dart';
import 'package:learn_animations/screens/login-screen/login-screen.dart';
import 'package:learn_animations/screens/sign-up-screen/sign-up-screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var getStartedButtonClicked = false;
  var backgroundColor;
  var textColor;
  var lightTextColor;
  var fontfraction = 18;
  var shareyourStringFraction = 50;
  var animatedTextFraction = 30;
  var paddingTopHeader = 40.0;

  Widget build(BuildContext context) {
    @override
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    double shiftYheightofSignUpContainerBy = sheight;
    double shiftYheightofLoginContainerBy = sheight;
    double signUpContainerWidth = swidth;
    double signUpContainerXoffset = 0;
    double opacity = 1;

    if (getStartedButtonClicked) {
      backgroundColor = Colors.deepPurple.shade900;
      textColor = Colors.white;
      lightTextColor = Colors.white70;

      // when signup clicked\

      shiftYheightofSignUpContainerBy = 5 * sheight / 13;
      shiftYheightofLoginContainerBy = 5 * sheight / 14;
      signUpContainerWidth = swidth - swidth / 10;
      signUpContainerXoffset = swidth / 20;
      opacity = 0.7;
      shareyourStringFraction = 52;
      animatedTextFraction = 32;
      fontfraction = 20;
      paddingTopHeader = 38;
    } else {
      shiftYheightofSignUpContainerBy = sheight;
      shiftYheightofLoginContainerBy = sheight;
      backgroundColor = Colors.white;
      textColor = Colors.deepPurple.shade900;
      lightTextColor = Colors.black87;
      signUpContainerWidth = swidth;
      signUpContainerXoffset = 0;
      opacity = 1;
      fontfraction = 18;
      shareyourStringFraction = 50;
      animatedTextFraction = 30;
    }
    return Scaffold(
      body: Stack(children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              getStartedButtonClicked = !getStartedButtonClicked;
            });
          },
          child: AnimatedContainer(
            color: backgroundColor,
            duration: Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HeaderLogoTop(
                      paddingTopHeader: paddingTopHeader,
                      sheight: sheight,
                      textColor: textColor,
                      fontfraction: fontfraction),
                  SizedBox(
                    height: sheight / 20,
                  ),
                  MainScreenMotoBanner(
                    sheight: sheight,
                    shareyourStringFraction: shareyourStringFraction,
                    lightTextColor: lightTextColor,
                    animatedTextFraction: animatedTextFraction,
                    textColor: textColor,
                  ),
                  Spacer(),
                  loadMainScreenCenterImage(swidth),
                  Spacer(),
                  Center(
                    child: Text(
                      'Ready to find your CodeMate?',
                      style: TextStyle(
                          fontSize: sheight / 50,
                          fontWeight: FontWeight.w500,
                          color: lightTextColor),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: textColor.withOpacity(0.2),
                              blurRadius: 45,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: RaisedButton(
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            onPressed: () {
                              changePageState();
                              //backgroundColor = Colors.deepPurple.shade900;
                            },
                            child: Container(
                              width: 3 * swidth / 5,
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                    color: backgroundColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            color: textColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        LoginScreen(
            sheight: sheight,
            signUpContainerWidth: signUpContainerWidth,
            signUpContainerXoffset: signUpContainerXoffset,
            shiftYheightofLoginContainerBy: shiftYheightofLoginContainerBy,
            opacity: opacity),
        SignUpScreen(
            sheight: sheight,
            swidth: swidth,
            shiftYheightofSignUpContainerBy: shiftYheightofSignUpContainerBy),
      ]),
    );
  }

  void changePageState() {
    return setState(() {
      getStartedButtonClicked = !getStartedButtonClicked;
    });
  }

  Center loadMainScreenCenterImage(double swidth) {
    return Center(
      child: Container(
          height: swidth / 2,
          child: SvgPicture.asset("assets/images/welcome.svg")),
    );
  }
}
