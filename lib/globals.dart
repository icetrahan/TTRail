import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:ttrail_laptopo/pages/handbook.dart';
import 'dart:math';

//Theme

Color logoOrange = Color.fromARGB(255, 239, 114, 4);
Color logoGrey = const Color.fromARGB(255, 100, 100, 100);
Color appBlack = const Color.fromARGB(255, 15, 15, 15);
Color appWhite = Color.fromARGB(255, 255, 255, 255);
Color appOffWhite = const Color.fromARGB(255, 216, 216, 216);
Color appLightGrey = Color.fromARGB(255, 160, 160, 160);
Color appGrey = const Color.fromARGB(255, 103, 103, 103);
Color appDarkGrey = const Color.fromARGB(255, 55, 55, 55);

TextStyle header1 = TextStyle(
  color: appBlack,
  fontSize: buttonHeight * 0.40,
  fontWeight: FontWeight.w700,
  fontFamily: 'DMSans',
);

TextStyle header2 = TextStyle(
  color: appBlack,
  fontSize: buttonHeight * 0.35,
  fontWeight: FontWeight.w700,
  fontFamily: 'DMSans',
);

TextStyle header3 = TextStyle(
  color: appBlack,
  fontSize: buttonHeight * 0.3,
  fontWeight: FontWeight.w700,
  fontFamily: 'DMSans',
);

TextStyle header4 = TextStyle(
  color: appBlack,
  fontSize: buttonHeight * 0.2,
  fontWeight: FontWeight.w700,
  fontFamily: 'DMSans',
);

TextStyle header5 = TextStyle(
  color: appBlack,
  fontSize: buttonHeight * 0.26,
  fontWeight: FontWeight.w700,
  fontFamily: 'DMSans',
);

TextStyle header6 = TextStyle(
  color: appWhite,
  fontSize: buttonHeight * 0.3,
  fontWeight: FontWeight.w700,
  fontFamily: 'DMSans',
);

TextStyle subheader1 = TextStyle(
  color: appDarkGrey,
  fontSize: buttonHeight * 0.15,
  fontWeight: FontWeight.w500,
  fontFamily: 'DMSans',
);

TextStyle bodyText1 = TextStyle(
  color: appBlack,
  fontSize: buttonHeight * 0.15,
  fontFamily: 'DMSans',
);

TextStyle bodyText2 = TextStyle(
  color: appBlack,
  fontSize: buttonHeight * 0.2,
  fontFamily: 'DMSans',
);

//App Variables

bool loading = false;
bool bluetoothConnected = false;

//Informational Variables

String btRecievedData = '';
Set<MapPolyline> polylineSet = {};

//Firebase Variables

List<String> locationsList = [];
Map<String, dynamic> data = {};

String locationAddress = '';
String locationName = '';
String locationZoom = '';
String locationLat = '';
String locationLong = '';
String locationTracksCollection = '';
String currentDateSelection = '';

Map<String, dynamic> tracksMap = {};

Map<String, dynamic> historyDatesMap = {};

//Widgets
Center LoadingWidget = Center(
  child: Image.asset(
    'assets/Loading.gif',
    height: buttonHeight * 3.5,
    width: buttonWidth * 3.5,
  ),
);

//User

bool savePass = false;
String userId = '';
String userFullName = '';
String userEmail = '';
String userRole = '';
bool userHasRole = false;
bool userHasRoleUser = false;
List<Map> usersList = [];
List idList = [];

class UserDatabaseManager {
  final CollectionReference userListFB =
      FirebaseFirestore.instance.collection('Users');

  Future<void> createUserData(String email, String name, String uid) async {
    return await userListFB.doc(uid).set({
      'email': email,
      'name': name,
      'role': '',
      'id': uid,
    });
  }

  Future getUsersList() async {
    try {
      await userListFB.get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((user) {
          Map tempMap = {
            'id': user["id"],
            "email": user["email"],
            'name': user["name"],
            'role': user["role"],
          };
          usersList.add(tempMap);
          idList.add(user["id"]);
        });
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

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
  locationTracksCollection = selectedSnap?['tracksId'];
  currentDateSelection = locationTracksCollection;
  locationName = selected;

  print(locationName);
  print(locationAddress);
  print(locationLat);
  print(locationLong);
  print(locationTracksCollection);
}

dataWriteSegment(
    String segmentNumber,
    String averageCrosslevel,
    String averageGage,
    String worstCrosslevel,
    String worstGage,
    String comment,
    String inspector,
    String track,
    String crosstieCount,
    String trackClass) async {
  DateTime now = DateTime.now();
  String dateSimp = now.month.toString() +
      '/' +
      now.day.toString() +
      '/' +
      now.year.toString().substring(2, 4);

  int grade =
      getTrackGrade(worstCrosslevel, worstGage, crosstieCount, trackClass);

  final trackSnap = await FirebaseFirestore.instance
      .collection(locationTracksCollection)
      .doc(track)
      .get();
  final Map<String, dynamic>? segmentsList = trackSnap.data();

  GeoPoint start = segmentsList![segmentNumber]['start'];
  GeoPoint end = segmentsList[segmentNumber]['end'];

  final snap = await FirebaseFirestore.instance
      .collection(locationTracksCollection)
      .doc(track)
      .update({
    segmentNumber: {
      'averageCrosslevel': averageCrosslevel,
      'averageGage': averageGage,
      'worstCrosslevel': worstCrosslevel,
      'worstGage': worstGage,
      'crosstieCount': crosstieCount,
      'comment': comment,
      'date': dateSimp,
      'inspector': inspector,
      'grade': grade.toString(),
      'start': start,
      'end': end,
      'class': trackClass,
    }
  });
}

getTrackGrade(String worstCrosslevel, String worstGage, String crosstieCount,
    String trackClass) {
  //ballast, vegetation, jointbars, defective rail, alignment, railend tread, railend gage
  double total = 10;

  //Crosslevel
  double crossLevelPercent = (double.parse(worstCrosslevel) /
          trackClasses[trackClass]['maxCrosslevel']) *
      100;

  //Crossties
  double crosstiePercent = ((24 - double.parse(crosstieCount)) /
          (24 - trackClasses[trackClass]['minCrosstieCount'])) *
      100;

  //Gage
  double gageMaxPercent = ((double.parse(worstGage) - 56.5) /
          (trackClasses[trackClass]['maxGage'] - 56.5)) *
      100;

  print(double.parse(worstGage));
  print(trackClasses[trackClass]['maxGage']);
  print(gageMaxPercent);

  double gageMinPercent = ((double.parse(worstGage) - 56.5) /
          (trackClasses[trackClass]['minGage'] - 56.5)) *
      100;

  double gagePercent = 0;
  if (gageMaxPercent >= gageMinPercent) {
    gagePercent = gageMaxPercent;
  } else {
    gagePercent = gageMinPercent;
  }

  List<double> percentList = [gagePercent, crossLevelPercent, crosstiePercent];

  double highestPercent = percentList.reduce((max));

  if (highestPercent < 35) {
    return 5;
  } else if (highestPercent < 50) {
    return 4;
  } else if (highestPercent < 75) {
    return 3;
  } else if (highestPercent < 90) {
    return 2;
  } else {
    return 1;
  }
}

test() {
  DateTime now = DateTime.now();
  String dateSimp = now.month.toString() +
      '/' +
      now.day.toString() +
      '/' +
      now.year.toString().substring(2, 4);
  print(dateSimp);
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

//function data
Map trackClasses = {
  'class1': {
    'maxGage': 58,
    'minGage': 56,
    'maxCrosslevel': 3,
    'minCrosstieCount': 5,
    'maxAlinementDeviation': 5,
    'maxRailEndMismatchTread': 0.25,
    'maxRailEndMismatchGage': 0.25,
  },
  'class2': {
    'maxGage': 57.75,
    'minGage': 56,
    'maxCrosslevel': 2.25,
    'minCrosstieCount': 8,
    'maxAlinementDeviation': 3,
    'maxRailEndMismatchTread': 0.25,
    'maxRailEndMismatchGage': 0.1875,
  },
  'class3': {
    'maxGage': 57.75,
    'minGage': 56,
    'maxCrosslevel': 2,
    'minCrosstieCount': 8,
    'maxAlinementDeviation': 1.75,
    'maxRailEndMismatchTread': 0.1875,
    'maxRailEndMismatchGage': 0.1875,
  },
  'class4': {
    'maxGage': 57.5,
    'minGage': 56,
    'maxCrosslevel': 1.75,
    'minCrosstieCount': 12,
    'maxAlinementDeviation': 1.5,
    'maxRailEndMismatchTread': 0.125,
    'maxRailEndMismatchGage': 0.125,
  },
  'class5': {
    'maxGage': 57.5,
    'minGage': 56,
    'maxCrosslevel': 1.5,
    'minCrosstieCount': 12,
    'maxAlinementDeviation': 0.75,
    'maxRailEndMismatchTread': 0.125,
    'maxRailEndMismatchGage': 0.125,
  }
};

//////
Map btDevice = {
  'name': 'N/A',
  'data': 'N/A',
  'connected': false,
};

late BluetoothDevice currentBTDevice;
late BluetoothCharacteristic bluetoothChar;
String bluetoothData = '';
