import 'package:flutter/material.dart';
import 'package:ttrail_laptopo/globals.dart' as globals;

class NewInspAuto extends StatefulWidget {
  const NewInspAuto({super.key});

  @override
  State<NewInspAuto> createState() => _NewInspAutoState();
}

class _NewInspAutoState extends State<NewInspAuto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: globals.logoOrange),
      body: Center(
        child: Text(
          'Currently Being Worked On\n\n Come Back Soon!',
          textAlign: TextAlign.center,
          style: globals.header2,
        ),
      ),
    );
  }
}
