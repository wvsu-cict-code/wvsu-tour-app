import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:wvsu_tour_app/screens/home_screen.dart';

void main() {
  test('home screen tab configuration removes announcements', () {
    expect(HomeScreen.tabCount, 4);
    expect(HomeScreen.initialTabIndex, 1);
    expect(HomeScreen.tabIcons, isNot(contains(SimpleLineIcons.bell)));
    expect(
      HomeScreen.tabIcons,
      <IconData>[
        SimpleLineIcons.graduation,
        SimpleLineIcons.cursor,
        SimpleLineIcons.heart,
        SimpleLineIcons.info,
      ],
    );
  });
}
