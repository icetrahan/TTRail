import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:ttrail_laptopo/globals.dart' as globals;
import 'package:ttrail_laptopo/mapcreation.dart' as mc;

class MapsPage extends StatefulWidget {
  MapsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MapsPageState createState() => MapsPageState();
}

class MapsPageState extends State<MapsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double>? _animation;
  late MapZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward(from: 0);

    _zoomPanBehavior = MapZoomPanBehavior(
        minZoomLevel: double.parse(globals.locationZoom), maxZoomLevel: 19)
      ..zoomLevel = double.parse(globals.locationZoom)
      ..focalLatLng = MapLatLng(double.parse(globals.locationLat),
          double.parse(globals.locationLong));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              SfMaps(
                layers: [
                  MapTileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    zoomPanBehavior: _zoomPanBehavior,
                    sublayers: [
                      MapPolylineLayer(
                        polylines: globals.polylineSet,
                        animation: _animation,
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: globals.buttonWidth * 0.2,
                width: globals.buttonWidth * 9.6,
                height: globals.buttonHeight * 2,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(height: globals.buttonHeight * 0.4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/ttLogo2.png',
                            height: globals.buttonHeight * 0.75,
                          ),
                          PopupMenuButton(
                            onSelected: (value) {
                              // your logic
                            },
                            itemBuilder: (BuildContext bc) {
                              return [
                                PopupMenuItem(
                                  value: 'Past Inspections',
                                  child: Text('Past Inspections'),
                                  onTap: () {
                                    _historyDialog(context);
                                  },
                                ),
                                PopupMenuItem(
                                  value: 'Current Inspection',
                                  child: Text('Current Inspection'),
                                  onTap: () {
                                    rebuildMapCurrent(context,
                                        globals.locationTracksCollection);
                                  },
                                ),
                                const PopupMenuItem(
                                  value: 'Sort by Inspector',
                                  child: Text('Sort by Inspector'),
                                ),
                                const PopupMenuItem(
                                  value: 'Sort by Grade',
                                  child: Text('Sort by Grade'),
                                ),
                              ];
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: globals.logoOrange,
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                      color: globals.appBlack,
                                      width: globals.buttonWidth * 0.03)),
                              height: globals.buttonHeight * 0.55,
                              width: globals.buttonWidth * 1.1,
                              child: Icon(
                                Icons.menu,
                                color: globals.appBlack,
                                size: globals.buttonHeight * 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _historyDialog(context) async {
  int cells = globals.historyDatesMap.length;

  List<Widget> datesList = [];

  globals.historyDatesMap.forEach((key, value) {
    datesList.add(bodyText(context, key, value));
  });

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Inspection History Selection',
            textAlign: TextAlign.center),
        content: Container(
          height: (globals.buttonHeight * 0.716 * cells),
          width: globals.buttonWidth * 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[...datesList],
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          TextButton(
            child: Container(
              height: globals.buttonHeight * 0.5,
              width: globals.buttonWidth * 3,
              decoration: BoxDecoration(
                  color: globals.logoOrange,
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                      color: globals.appBlack,
                      width: globals.buttonWidth * 0.025)),
              child: Text(
                'Close',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: globals.buttonHeight * 0.4),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

bodyText(context, String date, String collectionTitle) {
  return TextButton(
    onPressed: (() {
      rebuildMap(context, collectionTitle);
    }),
    child: Container(
      width: globals.buttonWidth * 4,
      height: globals.buttonHeight * 0.5,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'End Date: ' + date,
                style: globals.bodyText2,
              ),
            ],
          ),
          Divider(
            color: globals.appBlack,
            thickness: globals.buttonHeight * 0.02,
          ),
        ],
      ),
    ),
  );
}

rebuildMap(context, dateSelection) {
  mc.getPoints(context, dateSelection);
  Navigator.pop(context);
  Navigator.pushReplacementNamed(context, '/map');
}

rebuildMapCurrent(context, dateSelection) {
  mc.getPoints(context, dateSelection);
  Navigator.pop(context);
  Navigator.pushReplacementNamed(context, '/map');
}
