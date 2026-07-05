import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:websafe_svg/websafe_svg.dart';

class AppBrandHorizontal extends StatelessWidget {
  const AppBrandHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WebsafeSvg.asset('assets/icon/icon-light.svg', height: 70),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("West Visayas State University",
                style: GoogleFonts.lato(color: Colors.white)),
            Text("Campus Tour",
                style: GoogleFonts.pattaya(color: Colors.white, fontSize: 30))
          ],
        )
      ],
    );
  }
}
