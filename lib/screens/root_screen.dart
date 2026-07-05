import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wvsu_tour_app/firebase/auth.dart';
import 'package:wvsu_tour_app/screens/auth_screen.dart';
import 'package:wvsu_tour_app/screens/home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key, required this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: widget.auth.checkAuthStatus(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return new HomeScreen();
        } else {
          return new AuthScreen(auth: widget.auth);
        }
      },
    );
  }
}
