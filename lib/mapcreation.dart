import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'globals.dart' as globals;

getPoints() async {
  List<String> tracksList = [];

  final snap = await FirebaseFirestore.instance
      .collection(globals.locationTracksCollection)
      .get();
  final List<DocumentSnapshot> tracksSnap = snap.docs;

  for (var track in tracksSnap) {
    tracksList.add(track.id);

    final trackSnap = await FirebaseFirestore.instance
        .collection(globals.locationTracksCollection)
        .doc(track.id)
        .get();
    final Map<String, dynamic>? segmentsList = trackSnap.data();

    segmentsList?.forEach((key, value) {
      print(key);
      print(value['start']);
    });

    // globals.tracksMap[track.id] = segmentsList;

    // globals.tracksMap.forEach((key, value) {
    //   print(value);
    // });
  }
}
