import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/newinsp.dart';
import 'pages/insps.dart';
import 'pages/map.dart';
import 'pages/testing.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/newinsp': (context) => const NewInsp(),
        '/insps': (context) => const Insps(),
        '/map': (context) => const Map(),
        '/test': (context) => MapsPage(
              title: 'Testing',
            ),
      },
    ));
