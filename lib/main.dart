import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/newinsp.dart';
import 'pages/insps.dart';
import 'pages/map.dart';
import 'pages/testing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'globals.dart' as globals;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await globals.locationsGet();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Home(),
      '/newinsp': (context) => const NewInsp(),
      '/insps': (context) => const Insps(),
      '/map': (context) => MapsPage(
            title: globals.locationName + ' Map',
          ),
    },
  ));
}
