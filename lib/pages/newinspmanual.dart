import 'package:flutter/material.dart';
import 'package:ttrail_laptopo/globals.dart' as globals;

class NewInspManual extends StatefulWidget {
  const NewInspManual({Key? key}) : super(key: key);

  @override
  State<NewInspManual> createState() => _NewInspManualState();
}

class _NewInspManualState extends State<NewInspManual> {
  late TextEditingController _segmentNumber = TextEditingController();

  late TextEditingController _averageCrosslevel = TextEditingController();

  late TextEditingController _averageGage = TextEditingController();

  late TextEditingController _worstCrosslevel = TextEditingController();

  late TextEditingController _worstGage = TextEditingController();

  late TextEditingController _comment = TextEditingController();

  late TextEditingController _inspector = TextEditingController();

  late TextEditingController _track = TextEditingController();

  late TextEditingController _crosstieCount = TextEditingController();

  late TextEditingController _trackClass = TextEditingController();

  String dropDown1value = 'Track Class';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globals.logoOrange,
        title: Text('New Inspection', style: globals.header1),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                color: globals.appOffWhite, height: globals.buttonHeight * 1.1),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton(
                        hint: Text(dropDown1value),
                        items: const [
                          DropdownMenuItem(
                              child: Text('Class 1'), value: 'class1'),
                          DropdownMenuItem(
                              child: Text('Class 2'), value: 'class2'),
                          DropdownMenuItem(
                              child: Text('Class 3'), value: 'class3'),
                          DropdownMenuItem(
                              child: Text('Class 4'), value: 'class4'),
                          DropdownMenuItem(
                              child: Text('Class 5'), value: 'class5'),
                        ],
                        onChanged: (value) {
                          _trackClass.text = value.toString();
                          dropDown1value = value.toString();
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: globals.logoOrange),
                          hintText: "avg gage",
                        ),
                        controller: _averageGage,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: globals.logoOrange),
                          hintText: "avg crosslevel",
                        ),
                        controller: _averageCrosslevel,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: globals.logoOrange),
                          hintText: "Crosstie count",
                        ),
                        controller: _crosstieCount,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: globals.logoOrange),
                          hintText: "Comment",
                        ),
                        controller: _comment,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: globals.logoOrange),
                          hintText: "Enter your name",
                        ),
                        controller: _inspector,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: globals.logoOrange),
                          hintText: "Segment Number",
                        ),
                        controller: _segmentNumber,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: globals.logoOrange),
                          hintText: "Track Number",
                        ),
                        controller: _track,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: globals.logoOrange),
                          hintText: "Worst Crosslevel",
                        ),
                        controller: _worstCrosslevel,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: globals.logoOrange),
                          hintText: "Worst Gage",
                        ),
                        controller: _worstGage,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: (() {
                              globals.dataWriteSegment(
                                  _segmentNumber.text,
                                  _averageCrosslevel.text,
                                  _averageGage.text,
                                  _worstCrosslevel.text,
                                  _worstGage.text,
                                  _comment.text,
                                  _inspector.text,
                                  _track.text,
                                  _crosstieCount.text,
                                  _trackClass.text);
                            }),
                            child: Container(
                              height: globals.buttonHeight * 0.75,
                              width: globals.buttonWidth * 4,
                              decoration: BoxDecoration(
                                color: globals.logoOrange,
                                border: Border.all(
                                    width: globals.buttonHeight * 0.05,
                                    color: globals.appDarkGrey),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: globals.buttonHeight * 0.4,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
