import 'package:flutter/material.dart';
import 'package:ttrail_laptopo/pages/newinsp.dart';
import 'pages/home.dart';
import 'pages/newinspmanual.dart';
import 'pages/insps.dart';
import 'pages/map.dart';
import 'pages/testing.dart';
import 'pages/handbook.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'globals.dart' as globals;

void main() async {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await globals.locationsGet();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Home(),
      '/newinspm': (context) => NewInspManual(),
      '/newinspa': (context) => NewInspAuto(),
      '/insps': (context) => const Insps(),
      '/handbook': (context) => Handbook(),
      '/map': (context) => MapsPage(
            title: globals.locationName + ' Map',
          ),
    },
  ));
}
