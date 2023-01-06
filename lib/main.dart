import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttrail_laptopo/pages/login.dart';
import 'package:ttrail_laptopo/pages/newinsp.dart';
import 'package:ttrail_laptopo/pages/signup.dart';
import 'package:ttrail_laptopo/provider.dart';
import 'pages/home.dart';
import 'pages/newinspmanual.dart';
import 'pages/insps.dart';
import 'pages/map.dart';
import 'pages/testing.dart';
import 'pages/handbook.dart';
import 'package:firebase_core/firebase_core.dart';
import 'globals.dart' as globals;
import 'pages/login.dart';

void main() async {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await globals.locationsGet();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MyProvider()),
    ],
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const Home(),
        '/newinspm': (context) => NewInspManual(),
        '/newinspa': (context) => NewInspAuto(),
        '/insps': (context) => const Insps(),
        '/handbook': (context) => Handbook(),
        '/map': (context) => MapsPage(
              title: globals.locationName + ' Map',
            ),
      },
    ),
  ));
}
