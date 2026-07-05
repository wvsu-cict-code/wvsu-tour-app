import 'package:flutter/material.dart';
import 'package:wvsu_tour_app/config/app.dart';

class AppLegalLinks extends StatelessWidget {
  const AppLegalLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/legal");
        },
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text:
                  "Taga West! By logging in or creating an account, you are agreeing with our ",
              style: appBodyTextStyle),
          TextSpan(text: "Terms and Conditions", style: appBodyBoldTextStyle),
          TextSpan(text: " and ", style: appBodyTextStyle),
          TextSpan(text: "Privacy Policy.", style: appBodyBoldTextStyle)
        ])),
      ),
    );
  }
}
