import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/widgets/campus_life_list.dart';
import 'package:wvsu_tour_app/widgets/historical_artistic_landmarks_list.dart';
import 'package:wvsu_tour_app/widgets/messages_list.dart';
import 'package:wvsu_tour_app/widgets/organizations_list.dart';

class CampusLifeScreen extends StatefulWidget {
  CampusLifeScreen({Key? key}) : super(key: key);

  @override
  _CampusLifeScreenState createState() => _CampusLifeScreenState();
}

class _CampusLifeScreenState extends State<CampusLifeScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white));
  }

  @override
  Widget build(BuildContext context) {
    Size appScreenSize = MediaQuery.of(context).size;

    return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo is UserScrollNotification) {
            if (scrollInfo.direction == ScrollDirection.forward) {
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.white));
            } else if (scrollInfo.direction == ScrollDirection.reverse) {
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.white));
            }
            return true;
          } else {
            return false;
          }
        },
        child: SingleChildScrollView(
          controller: _scrollController,
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
                      Text("Where Excellence\nis a Tradition!",
                          style: appTitleTextStyle),
                      SizedBox(height: 10),
                      Text(
                        'Not far away the goal comes in to view.',
                        style: appBodyTextStyle,
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 30,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Text("Radiant with Hope",
                        style: appSecondaryTitleTextStyle)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    child: Text(
                      "Our University president, student representatives and other key officials would like to express their thoughts.",
                      style: appBodyTextStyle,
                    )),
                new MessagesList(),
                Divider(),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child:
                        Text("Campus Life", style: appSecondaryTitleTextStyle)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    child: Text(
                      "Unique, vibrant, invigorating, aspiring to inspire - we have something to please you no matter what your interests are!",
                      style: appBodyTextStyle,
                    )),
                new CampusLifeList(),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Text("School Organizations",
                        style: appSecondaryTitleTextStyle)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    child: Text(
                      "Looking for a group to belong?",
                      style: appBodyTextStyle,
                    )),
                new OrganizationsList(),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Text("Timeless Culture",
                        style: appSecondaryTitleTextStyle)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    child: Text(
                      "Historical and Artistic Landmarks",
                      style: appBodyTextStyle,
                    )),
                HistoricalArtisticLandmarksList(),
                SizedBox(
                  height: appScreenSize.height * 0.05,
                )
              ],
            ),
          ),
        ));
  }
}
