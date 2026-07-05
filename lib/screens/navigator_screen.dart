import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/widgets/academic_buildings_list.dart';
import 'package:wvsu_tour_app/widgets/admin_buildings_list.dart';
import 'package:wvsu_tour_app/widgets/campuses_list.dart';
import 'package:wvsu_tour_app/widgets/colleges_list.dart';
import 'package:wvsu_tour_app/widgets/facilities_amenities_list.dart';

class NavigatorScreen extends StatefulWidget {
  NavigatorScreen({Key? key}) : super(key: key);

  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  List<int> data = [];

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent));

    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    Size appScreenSize = MediaQuery.of(context).size;
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo is UserScrollNotification) {
          if (scrollInfo.direction == ScrollDirection.forward) {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: Colors.transparent));
            // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
          } else if (scrollInfo.direction == ScrollDirection.reverse) {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: appSecondaryColor));
          }
        }
        return false;
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          decoration: BoxDecoration(
              color: appSecondaryColor,
              image: DecorationImage(
                  alignment: Alignment.topRight,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/home-screen-top.png'))),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(appDefaultPadding,
                          appScreenSize.height * 0.07, appDefaultPadding, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Campus Tour",
                              style: GoogleFonts.lato(
                                  color: Colors.white, fontSize: 30)),
                          SizedBox(height: 10),
                          Text(
                            "From a dream, a University grew.",
                            style: GoogleFonts.lato(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: appScreenSize.height * 0.19),
                  child: Container(
                    decoration: BoxDecoration(
                        color: appPrimaryColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(36))),
                    width: appScreenSize.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
                          child: Text(
                            "Campuses",
                            style: appSecondaryTitleTextStyle,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 0),
                            child: Text(
                              "Main and External Campuses",
                              style: appBodyTextStyle,
                            )),
                        new CampusesList(),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Text(
                            "Colleges",
                            style: appSecondaryTitleTextStyle,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 0),
                            child: Text(
                              "Different colleges offering diverse spectrum of courses.",
                              style: appBodyTextStyle,
                            )),
                        new CollegesList(),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Text(
                            "Academic Buildings",
                            style: appSecondaryTitleTextStyle,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 0),
                            child: Text(
                              "Let wisdom set you free.",
                              style: appBodyTextStyle,
                            )),
                        new AcademicBuildingsList(),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Text(
                            "Administrative Offices",
                            style: appSecondaryTitleTextStyle,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 0),
                            child: Text(
                              "The administrative offices for effective and efficient University operations.",
                              style: appBodyTextStyle,
                            )),
                        new AdminBuildingsList(),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Text(
                            "Facilities and Amenities",
                            style: appSecondaryTitleTextStyle,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 0),
                            child: Text(
                              "Our University continues to expanded and improved her cultural and welfare facilities.",
                              style: appBodyTextStyle,
                            )),
                        new FacilitiesAmenitiesList(),
                        SizedBox(height: 30)
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
