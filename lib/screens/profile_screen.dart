import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wvsu_tour_app/config/app.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size appScreenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: appPrimaryColor,
        body: SingleChildScrollView(
          controller: ScrollController(initialScrollOffset: 0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: appPrimaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(appDefaultPadding,
                      appScreenSize.height * 0.07, appDefaultPadding, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Profile",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 30)),
                      Text(
                        'About you',
                        style: GoogleFonts.lato(color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
