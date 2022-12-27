import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

//Theme

Color logoOrange = const Color.fromARGB(255, 255, 132, 0);
Color logoGrey = const Color.fromARGB(255, 100, 100, 100);
Color appBlack = const Color.fromARGB(255, 15, 15, 15);
Color appWhite = const Color.fromARGB(255, 236, 233, 228);
Color appOffWhite = const Color.fromARGB(255, 216, 216, 216);
Color appGrey = const Color.fromARGB(255, 103, 103, 103);
Color appDarkGrey = const Color.fromARGB(255, 55, 55, 55);

TextStyle header1 = TextStyle(
  color: appBlack,
  fontSize: buttonHeight * 0.40,
  fontWeight: FontWeight.w700,
  fontFamily: 'DMSans',
);

TextStyle header2 = TextStyle(
  color: appWhite,
  fontSize: buttonHeight * 0.6,
  fontWeight: FontWeight.w700,
  fontFamily: 'DMSans',
);

TextStyle header3 = TextStyle(
  color: logoOrange,
  fontSize: buttonHeight * 0.6,
  fontWeight: FontWeight.w700,
  fontFamily: 'DMSans',
);

TextStyle bodyText1 = TextStyle(
  color: appBlack,
  fontSize: buttonHeight * 0.3,
  fontFamily: 'DMSans',
);

//Informational Variables

String btRecievedData = '';

//Firebase Variables

List<String> locationsList = [];
Map<String, dynamic> data = {};

String locationAddress = '';
String locationName = '';
String locationZoom = '';
String locationLat = '';
String locationLong = '';

//Methods

locationsGet() async {
  locationsList.clear();

  final snap = await FirebaseFirestore.instance.collection("locations").get();
  final List<DocumentSnapshot> locationsSnap = snap.docs;
  for (var location in locationsSnap) {
    locationsList.add(location.id);
  }

  locationsList.forEach((element) {
    print(element);
  });
}

locationsDataGet(selected) async {
  final snap = await FirebaseFirestore.instance
      .collection("locations")
      .doc(selected)
      .get();
  final Map<String, dynamic>? selectedSnap = snap.data();

  locationAddress = selectedSnap?['address'];
  locationLat = selectedSnap?['lat'];
  locationLong = selectedSnap?['long'];
  locationZoom = selectedSnap?['zoom'];
  locationName = selected;

  print(locationName);
  print(locationAddress);
  print(locationLat);
  print(locationLong);
}

//Screen Size Getter

double buttonHeight = 0.0;
double buttonWidth = 0.0;

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double blockSizeHorizontal = 0.0;
  static double blockSizeVertical = 0.0;

  static double _safeAreaHorizontal = 0.0;
  static double _safeAreaVertical = 0.0;
  static double safeBlockHorizontal = 0.0;
  static double safeBlockVertical = 0.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    buttonHeight = safeBlockVertical * 10;
    buttonWidth = safeBlockHorizontal * 10;
  }
}
