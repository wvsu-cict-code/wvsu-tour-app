import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/firebase/auth.dart';
import 'package:wvsu_tour_app/observers/default_block_observer.dart';
import 'package:wvsu_tour_app/screens/auth_screen.dart';
import 'package:wvsu_tour_app/screens/home_screen.dart';
import 'package:wvsu_tour_app/screens/legal_screen.dart';
import 'package:wvsu_tour_app/screens/root_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = DefaultBlocObserver();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Auth appAuth = Auth();
    return MaterialApp(
        home: RootScreen(auth: appAuth),
        theme: ThemeData(
          primaryColor: appPrimaryColor,
          scaffoldBackgroundColor: appScaffoldBackgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(bodyColor: appTextBodyColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => AuthScreen(auth: appAuth),
          '/home': (BuildContext context) => HomeScreen(),
          '/legal': (BuildContext context) => LegalScreen(),
        });
  }
}
