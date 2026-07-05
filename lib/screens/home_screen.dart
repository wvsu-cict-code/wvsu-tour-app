import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:wvsu_tour_app/firebase/auth.dart';
import 'package:wvsu_tour_app/screens/about_screen.dart';
import 'package:wvsu_tour_app/screens/campus_life_screen.dart';
import 'package:wvsu_tour_app/screens/navigator_screen.dart';
import 'package:wvsu_tour_app/screens/thankyou_frontliners_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, this.auth}) : super(key: key);

  static const int tabCount = 4;
  static const int initialTabIndex = 1;
  static const List<IconData> tabIcons = <IconData>[
    SimpleLineIcons.graduation,
    SimpleLineIcons.cursor,
    SimpleLineIcons.heart,
    SimpleLineIcons.info,
  ];

  final BaseAuth? auth;

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: HomeScreen.tabCount, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Auth appAuth = new Auth();
    return Scaffold(
        backgroundColor: Color(0xFFF3F3F3),
        bottomNavigationBar: ConvexAppBar(
          color: Color(0xFF106DCF),
          backgroundColor: Colors.white,
          activeColor: Color(0xFF106DCF),
          controller: _tabController,
          elevation: 1,
          items: HomeScreen.tabIcons
              .map((icon) => TabItem(
                    icon: icon,
                  ))
              .toList(),
          initialActiveIndex: HomeScreen.initialTabIndex,
          onTap: (int i) => print('click index=$i'),
        ),
        body: TabBarView(controller: _tabController, children: [
          new CampusLifeScreen(),
          new NavigatorScreen(),
          new ThankyouFrontlinersScreen(auth: appAuth),
          new AboutScreen(auth: appAuth),
        ]));
  }
}
