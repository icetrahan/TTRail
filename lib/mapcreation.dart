import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'globals.dart' as globals;

getPoints(selected) async {
  final snap = await FirebaseFirestore.instance
      .collection("locations")
      .doc(selected)
      .get();

  final List<CollectionReference> tracks =
      snap.reference.collection("subcollection");

  final Map<String, dynamic>? selectedSnap = snap.data();

  selectedSnap?.forEach((key, value) {
    print(key + value);
  });
}
