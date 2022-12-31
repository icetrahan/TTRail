import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'globals.dart' as globals;

getPoints(context, dateSelection) async {
  globals.tracksMap.clear();
  globals.polylineSet.clear();
  print('start');
  List<String> tracksList = [];

  final snap = await FirebaseFirestore.instance.collection(dateSelection).get();
  final List<DocumentSnapshot> tracksSnap = snap.docs;

  for (var track in tracksSnap) {
    print('loop');
    tracksList.add(track.id);

    final trackSnap = await FirebaseFirestore.instance
        .collection(dateSelection)
        .doc(track.id)
        .get();
    final Map<String, dynamic>? segmentsList = trackSnap.data();

    globals.tracksMap[track.id] = segmentsList;
  }

  getPolylines(context);

  await getHistoryDates();
  print('end');
}

getPolylines(context) async {
  globals.tracksMap.forEach((key, value) {
    if (key != "History") {
      int ticker = 1;

      while (ticker <= value.length) {
        Color color;

        if (value[ticker.toString()]['grade'] == '1') {
          color = Color.fromARGB(255, 220, 37, 0);
        } else if (value[ticker.toString()]['grade'] == '2') {
          color = Color.fromARGB(255, 222, 126, 0);
        } else if (value[ticker.toString()]['grade'] == '3') {
          color = Color.fromARGB(255, 211, 222, 0);
        } else if (value[ticker.toString()]['grade'] == '4') {
          color = Color.fromARGB(255, 151, 220, 1);
        } else if (value[ticker.toString()]['grade'] == '5') {
          color = Color.fromARGB(255, 0, 198, 36);
        } else {
          color = Color.fromARGB(255, 255, 255, 255);
        }

        final segmentId = ticker.toString();

        //Getting Box Colors

        //CrosslevelBox
        double avgCrossLevelPercent =
            (double.parse(value[segmentId]['averageCrosslevel']) /
                    globals.trackClasses[(value[segmentId]['class'])]
                        ['maxCrosslevel']) *
                100;

        double worstCrossLevelPercent =
            (double.parse(value[segmentId]['worstCrosslevel']) /
                    globals.trackClasses[(value[segmentId]['class'])]
                        ['maxCrosslevel']) *
                100;

        //CrosstieBox
        double crosstiePercent =
            ((24 - double.parse(value[segmentId]['crosstieCount'])) /
                    (24 -
                        globals.trackClasses[(value[segmentId]['class'])]
                            ['minCrosstieCount'])) *
                100;

        //GageBox

        //Avg Gage
        double avgGageMaxPercent =
            ((double.parse(value[segmentId]['averageGage']) - 56.5) /
                    (globals.trackClasses[(value[segmentId]['class'])]
                            ['maxGage'] -
                        56.5)) *
                100;

        double avgGageMinPercent =
            ((double.parse(value[segmentId]['averageGage']) - 56.5) /
                    (globals.trackClasses[(value[segmentId]['class'])]
                            ['minGage'] -
                        56.5)) *
                100;

        double avgGagePercent = 0;
        if (avgGageMaxPercent >= avgGageMinPercent) {
          avgGagePercent = avgGageMaxPercent;
        } else {
          avgGagePercent = avgGageMinPercent;
        }

        //Worst Gage
        double worstGageMaxPercent =
            ((double.parse(value[segmentId]['worstGage']) - 56.5) /
                    (globals.trackClasses[(value[segmentId]['class'])]
                            ['maxGage'] -
                        56.5)) *
                100;

        double worstGageMinPercent =
            ((double.parse(value[segmentId]['worstGage']) - 56.5) /
                    (globals.trackClasses[(value[segmentId]['class'])]
                            ['minGage'] -
                        56.5)) *
                100;

        double worstGagePercent = 0;
        if (worstGageMaxPercent >= worstGageMinPercent) {
          worstGagePercent = worstGageMaxPercent;
        } else {
          worstGagePercent = worstGageMinPercent;
        }

        //Colors

        Color avgCrossColor = getBoxColor(avgCrossLevelPercent);
        Color worstCrossColor = getBoxColor(worstCrossLevelPercent);
        Color avgGageColor = getBoxColor(avgGagePercent);
        Color worstGageColor = getBoxColor(worstGagePercent);
        Color crosstieColor = getBoxColor(crosstiePercent);

        //Boxes
        Widget emptyBox = Container();

        Widget avgCrossBox = Container(
          decoration: BoxDecoration(
              color: avgCrossColor,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                  color: globals.appBlack, width: globals.buttonWidth * 0.025)),
          height: globals.buttonHeight * 0.18,
          width: globals.buttonWidth * 0.34,
        );

        Widget worstCrossBox = Container(
          decoration: BoxDecoration(
              color: worstCrossColor,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                  color: globals.appBlack, width: globals.buttonWidth * 0.025)),
          height: globals.buttonHeight * 0.18,
          width: globals.buttonWidth * 0.34,
        );

        Widget avgGageBox = Container(
          decoration: BoxDecoration(
              color: avgGageColor,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                  color: globals.appBlack, width: globals.buttonWidth * 0.025)),
          height: globals.buttonHeight * 0.18,
          width: globals.buttonWidth * 0.34,
        );

        Widget worstGageBox = Container(
          decoration: BoxDecoration(
              color: worstGageColor,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                  color: globals.appBlack, width: globals.buttonWidth * 0.025)),
          height: globals.buttonHeight * 0.18,
          width: globals.buttonWidth * 0.34,
        );

        Widget crosstieBox = Container(
          decoration: BoxDecoration(
              color: crosstieColor,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                  color: globals.appBlack, width: globals.buttonWidth * 0.025)),
          height: globals.buttonHeight * 0.18,
          width: globals.buttonWidth * 0.34,
        );

        //Creating Lines

        addLine(
          context,
          value,
          color,
          segmentId,
          value[segmentId]['averageCrosslevel'],
          value[segmentId]['averageGage'],
          value[segmentId]['worstCrosslevel'],
          value[segmentId]['worstGage'],
          value[segmentId]['comment'],
          value[segmentId]['inspector'],
          key,
          value[segmentId]['crosstieCount'],
          value[segmentId]['class'],
          value[segmentId]['date'],
          emptyBox,
          avgCrossBox,
          worstCrossBox,
          avgGageBox,
          worstGageBox,
          crosstieBox,
        );

        ticker++;
      }
    }
  });
}

//Line Builder

addLine(
  context,
  Map value,
  Color color,
  String segmentNumber,
  String averageCrosslevel,
  String averageGage,
  String worstCrosslevel,
  String worstGage,
  String comment,
  String inspector,
  String track,
  String crosstieCount,
  String trackClass,
  String date,
  Widget emptyBox,
  Widget avgCrossBox,
  Widget worstCrossBox,
  Widget avgGageBox,
  Widget worstGageBox,
  Widget crosstieBox,
) {
  globals.polylineSet.add(MapPolyline(
    onTap: () {
      _infoPopup(
        context,
        segmentNumber,
        averageCrosslevel,
        averageGage,
        worstCrosslevel,
        worstGage,
        comment,
        inspector,
        track,
        crosstieCount,
        trackClass,
        date,
        emptyBox,
        avgCrossBox,
        worstCrossBox,
        avgGageBox,
        worstGageBox,
        crosstieBox,
      );
    },
    points: [
      MapLatLng(value[segmentNumber]['start'].latitude,
          value[segmentNumber]['start'].longitude),
      MapLatLng(value[segmentNumber]['end'].latitude,
          value[segmentNumber]['end'].longitude),
    ],
    color: color,
    width: globals.buttonWidth * 0.1,
  ));
}

//Info Popup

Future<void> _infoPopup(
  context,
  String segmentNumber,
  String averageCrosslevel,
  String averageGage,
  String worstCrosslevel,
  String worstGage,
  String comment,
  String inspector,
  String track,
  String crosstieCount,
  String trackClass,
  String date,
  Widget emptyBox,
  Widget avgCrossBox,
  Widget worstCrossBox,
  Widget avgGageBox,
  Widget worstGageBox,
  Widget crosstieBox,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(track + ' Segment Info', textAlign: TextAlign.center),
        content: Container(
          height: globals.buttonHeight * 4.75,
          width: globals.buttonWidth * 7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              bodyText('Date of Inspection', date, emptyBox),
              bodyText('Segment', segmentNumber, emptyBox),
              bodyText('Average Crosslevel', averageCrosslevel, avgCrossBox),
              bodyText('Worst Crosslevel', worstCrosslevel, worstCrossBox),
              bodyText('Average Gage', averageGage, avgGageBox),
              bodyText('Worst Gage', worstGage, worstGageBox),
              bodyText('Acceptable Crosstie Count', crosstieCount, crosstieBox),
              bodyText('Comment', comment, emptyBox)
            ],
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

bodyText(String item, String value, Widget gradeBox) {
  bool isComment = false;
  if (value.length > 15) {
    isComment = true;
  }
  return Container(
    width: isComment ? globals.buttonWidth * 6.8 : globals.buttonWidth * 6,
    height:
        isComment ? globals.buttonHeight * 1.25 : globals.buttonHeight * 0.5,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item + ':',
              style: globals.bodyText2,
            ),
            Row(
              children: [
                isComment
                    ? Container(
                        width: globals.buttonWidth * 4,
                        height: globals.buttonHeight * 1,
                        child: SingleChildScrollView(
                          child: Text(
                            value,
                            style: globals.bodyText2,
                            softWrap: true,
                            maxLines: 8,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    : Text(
                        value,
                        style: globals.bodyText2,
                      ),
                SizedBox(width: globals.buttonWidth * 0.06),
                isComment
                    ? Column(
                        children: [
                          Icon(Icons.arrow_drop_up_rounded),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    : gradeBox
              ],
            ),
          ],
        ),
        Divider(
          color: globals.appBlack,
          thickness: globals.buttonHeight * 0.02,
        ),
      ],
    ),
  );
}

getBoxColor(percent) {
  if (100 - percent < 11) {
    return Color.fromARGB(255, 220, 37, 0);
  } else if (100 - percent < 26) {
    return Color.fromARGB(255, 222, 126, 0);
  } else if (100 - percent < 51) {
    return Color.fromARGB(255, 211, 222, 0);
  } else if (100 - percent < 66) {
    return Color.fromARGB(255, 151, 220, 1);
  } else {
    return Color.fromARGB(255, 0, 198, 36);
  }
}

getHistoryDates() async {
  final snap = await FirebaseFirestore.instance
      .collection(globals.locationTracksCollection)
      .doc('History')
      .get();

  globals.historyDatesMap = snap.data()!;
  print(snap.data);
  print(globals.historyDatesMap);
}
