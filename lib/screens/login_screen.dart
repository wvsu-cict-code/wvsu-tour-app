import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/widgets/app_primary_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          decoration: BoxDecoration(
              color: appPrimaryColor,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                  image: AssetImage('assets/images/login-bg.png'))),
          child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    exit(0);
                  },
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(appDefaultPadding + 30),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(30),
                                        child: Column(children: [
                                          WebsafeSvg.asset(
                                              'assets/icon/icon.svg',
                                              height: 100),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          FittedBox(
                                              fit: BoxFit.cover,
                                              child: Text(
                                                  "West Visayas State University",
                                                  style: GoogleFonts.lato(
                                                    color: Color(0xFF106DCF),
                                                  ))),
                                          FittedBox(
                                            fit: BoxFit.cover,
                                            child: Text("Campus Tour",
                                                style: GoogleFonts.pattaya(
                                                    color: Color(0xFF106DCF),
                                                    fontSize: 35,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 1)),
                                          ),
                                          SizedBox(
                                            height: 50,
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: FittedBox(
                                              child: AppPrimaryButton(
                                                text: "Login with Facebook",
                                                icon: SimpleLineIcons
                                                    .social_facebook,
                                                onPressed: () {
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context, "/home");
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: FittedBox(
                                              child: AppPrimaryButton(
                                                text: "Login with Google",
                                                icon: SimpleLineIcons
                                                    .social_google,
                                                onPressed: () {
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context, "/home");
                                                },
                                              ),
                                            ),
                                          ),
                                        ]))),
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "Taga-West! By creating or logging into an account, you are agreeing with our. ",
                                  style: GoogleFonts.lato(color: Colors.white)),
                              TextSpan(
                                  text: "Privacy Policy",
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                            ])))
                      ])
                ],
              ))),
    );
  }
}
