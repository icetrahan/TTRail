import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:ttrail_laptopo/globals.dart' as globals;

class MapsPage extends StatefulWidget {
  MapsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage>
    with SingleTickerProviderStateMixin {
  late List<MapLatLng> _polylinePoints;
  late AnimationController _animationController;
  late Animation<double>? _animation;
  late MapZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _polylinePoints = <MapLatLng>[
      MapLatLng(13.0827, 80.2707),
      MapLatLng(13.6373, 79.5037),
      MapLatLng(14.4673, 78.8242),
      MapLatLng(14.9091, 78.0092),
      MapLatLng(16.2160, 77.3566),
      MapLatLng(17.1557, 76.8697),
      MapLatLng(18.0975, 75.4249),
      MapLatLng(18.5204, 73.8567),
      MapLatLng(19.4760, 72.8777),
    ];

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
    return SfMaps(
      layers: [
        MapTileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          zoomPanBehavior: _zoomPanBehavior,
          initialMarkersCount: _polylinePoints.length,
          markerBuilder: (BuildContext context, int index) {
            return MapMarker(
              latitude: _polylinePoints[index].latitude,
              longitude: _polylinePoints[index].longitude,
              iconType: MapIconType.circle,
              iconColor: Colors.white,
              iconStrokeWidth: 2.0,
              size: index == 0 ? Size(12.0, 12.0) : Size(8.0, 8.0),
              iconStrokeColor: Colors.black,
            );
          },
          sublayers: [
            MapPolylineLayer(
              polylines: {
                MapPolyline(
                  points: _polylinePoints,
                  color: Color.fromRGBO(0, 102, 255, 1.0),
                  width: 6.0,
                )
              },
              animation: _animation,
            ),
          ],
        ),
      ],
    );
  }
}
