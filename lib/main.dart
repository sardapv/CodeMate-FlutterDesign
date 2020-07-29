import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var getStartedButtonClicked = false;
  var backgroundColor;
  var textColor;
  var lightTextColor;

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
      shiftYheightofSignUpContainerBy = 5 * sheight / 13;
      shiftYheightofLoginContainerBy = 5 * sheight / 14;
      signUpContainerWidth = swidth - swidth / 10;
      signUpContainerXoffset = swidth / 20;
      opacity = 0.7;
    } else {
      shiftYheightofSignUpContainerBy = sheight;
      shiftYheightofLoginContainerBy = sheight;
      backgroundColor = Colors.white;
      textColor = Colors.deepPurple.shade900;
      lightTextColor = Colors.black87;
      signUpContainerWidth = swidth;
      signUpContainerXoffset = 0;
      opacity = 1;
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
            duration: Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                              fontSize: sheight / 18,
                              fontWeight: FontWeight.w800,
                              color: textColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sheight / 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        'Share your',
                        style: TextStyle(
                            fontSize: sheight / 50,
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
                            fontSize: sheight / 30,
                            fontWeight: FontWeight.w700,
                            color: textColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                      height: swidth / 2,
                      child: SvgPicture.asset("assets/images/welcome.svg")),
                  Spacer(),
                  Text(
                    'Ready to find your CodeMate?',
                    style: TextStyle(
                        fontSize: sheight / 50,
                        fontWeight: FontWeight.w500,
                        color: lightTextColor),
                    textAlign: TextAlign.end,
                  ),
                  Padding(
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
                            setState(() {
                              getStartedButtonClicked =
                                  !getStartedButtonClicked;
                            });
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
                ],
              ),
            ),
          ),
        ),
        buildLoginBottomSheet(signUpContainerXoffset, sheight,
            signUpContainerWidth, shiftYheightofLoginContainerBy, opacity),
        buildSignUpBottomSheet(sheight, swidth, shiftYheightofSignUpContainerBy)
      ]),
    );
  }

  AnimatedContainer buildSignUpBottomSheet(
      double sheight, double swidth, double shiftYheightofSignUpContainerBy) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
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
    );
  }

  AnimatedContainer buildLoginBottomSheet(
      double signUpContainerXoffset,
      double sheight,
      double signUpContainerWidth,
      double shiftYheightofLoginContainerBy,
      double opacity) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
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
    );
  }
}
