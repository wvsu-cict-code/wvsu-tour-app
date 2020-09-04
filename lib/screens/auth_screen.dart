import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:wvsu_tour_app/config/app.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _pageState = 0;

  var _backgroundColor = Colors.white;

  var _appIcon = Container();

  double _loginOpacity = 1;
  double _loginYOffset = 0;
  double windowWidth = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size appScreenSize = MediaQuery.of(context).size;
    double appIconSize = appScreenSize.width * 0.2;
    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _appIcon = Container(
          child: Column(
            children: [
              Image.asset("assets/images/wvsu-big-logo.png",
                  height: appIconSize),
              SizedBox(height: 20),
              Text(
                "West Visayas State University",
                style: GoogleFonts.openSans(color: appPrimaryColor),
              ),
              Text("Campus Tour",
                  style:
                      GoogleFonts.pattaya(color: appPrimaryColor, fontSize: 30))
            ],
          ),
        );
        _loginYOffset = appScreenSize.height;
        break;
      case 1:
        _backgroundColor = appPrimaryColor;
        _loginOpacity = 1;

        _loginYOffset = appScreenSize.height * 0.34;
        break;
      case 2:
        _backgroundColor = Color(0xFFBD34C59);
        break;
    }

    return new Scaffold(
        body: Stack(
      children: [
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: appScreenSize.height * 0.07),
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                      duration: Duration(milliseconds: 1000),
                      switchInCurve: Curves.fastLinearToSlowEaseIn,
                      child: _appIcon,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: WebsafeSvg.asset(
                    "assets/images/welcome_illustration.svg",
                    height: appScreenSize.width * 0.8),
              ),
              Padding(
                  padding: EdgeInsets.all(30),
                  child: SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                        color: Color(0xFF075BB3),
                        padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                        onPressed: () {
                          setState(() {
                            _pageState != 0 ? _pageState = 0 : _pageState = 1;
                          });

                          setState(() {
                            _appIcon = Container(
                                key: ValueKey(2),
                                child: Column(
                                  children: [
                                    WebsafeSvg.asset(
                                        "assets/icon/icon-light.svg",
                                        height: appIconSize),
                                    SizedBox(height: 20),
                                    Text(
                                      "West Visayas State University",
                                      style: GoogleFonts.openSans(
                                          color: Colors.white),
                                    ),
                                    Text("Campus Tour",
                                        style: GoogleFonts.pattaya(
                                            color: Colors.white, fontSize: 30))
                                  ],
                                ));
                          });

                          print(_pageState);
                        },
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.openSans(
                              color: Colors.white, fontSize: 15),
                        ),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ))
            ],
          ),
        ),
        AnimatedContainer(
          padding: EdgeInsets.all(32),
          width: double.infinity,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _loginYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            children: [
              Text("dfgsdfg"),
              MaterialButton(
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _pageState != 0 ? _pageState = 0 : _pageState = 1;
                  });

                  print(_pageState);
                },
                child: Text("fsdfsdf"),
              ),
            ],
          ),
        )
      ],
    ));
  }
}