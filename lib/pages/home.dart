import 'package:flutter/material.dart';
import 'package:ttrail_laptopo/globals.dart' as globals;
import 'package:ttrail_laptopo/mapcreation.dart' as mc;
import 'handbook.dart' as hb;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

bool locationSelected = false;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    globals.SizeConfig().init(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: globals.logoOrange,
          title: Text('TT Rail', style: globals.header1),
        ),
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Drop Down for location select
                      Text("Location:", style: globals.header1),
                      SizedBox(width: globals.buttonWidth * 0.2),
                      const LocationDropdown(),
                    ],
                  ),

                  SizedBox(height: globals.buttonHeight * 0.2),
                  //Container 1
                  GestureDetector(
                    onTap: () {
                      if (locationSelected == true) {
                        _inspSelection(context);
                      } else {
                        _notSelected(context);
                      }
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: globals.logoOrange,
                        border: Border.all(color: globals.logoOrange, width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.content_paste_search_outlined,
                              size: 80),
                          Text(
                            'New Inspection',
                            textAlign: TextAlign.center,
                            style: globals.header2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Container 2
                  GestureDetector(
                    onTap: () {
                      if (locationSelected == true) {
                        // Navigator.pushNamed(context, '/insps');
                        globals.dataWriteSegment(
                          '1',
                          '1',
                          '56.75',
                          '1',
                          '57',
                          'Track will need repairs soon',
                          'Caleb L Trahan',
                          'Track 400',
                          '14',
                          'class1',
                        );
                      } else {
                        _notSelected(context);
                      }
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: globals.logoOrange,
                        border: Border.all(color: globals.logoOrange, width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.folder_open_outlined, size: 100),
                          Text('Inspections',
                              textAlign: TextAlign.center,
                              style: globals.header2),
                        ],
                      ),
                    ),
                  ),
                  //Container 3
                  GestureDetector(
                    onTap: () async {
                      if (locationSelected == true) {
                        globals.loading = true;
                        await mc.getPoints(
                            context, globals.currentDateSelection);
                        globals.loading = false;
                        Navigator.pushNamed(context, '/map');
                      } else {
                        _notSelected(context);
                      }
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: globals.logoOrange,
                        border: Border.all(color: globals.logoOrange, width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.map_outlined, size: 100),
                          Text(
                            'Track Map',
                            textAlign: TextAlign.center,
                            style: globals.header2,
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Container 4
                  GestureDetector(
                    onTap: () {
                      if (locationSelected == true) {
                        hb.buildTiles(context);
                        hb.getPageText();
                        Navigator.pushNamed(context, '/handbook');
                      } else {
                        _notSelected(context);
                      }
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: globals.logoOrange,
                        border: Border.all(color: globals.logoOrange, width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.menu_book_outlined, size: 100),
                          Text('Handbook',
                              textAlign: TextAlign.center,
                              style: globals.header2),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            globals.loading
                ? const Opacity(
                    opacity: 0.5,
                    child:
                        ModalBarrier(dismissible: false, color: Colors.black))
                : Container(),
            globals.loading ? globals.LoadingWidget : Container()
          ],
        ),
      ),
    );
  }
}

class LocationDropdown extends StatefulWidget {
  const LocationDropdown({super.key});

  @override
  State<LocationDropdown> createState() => _LocationDropdownState();
}

class _LocationDropdownState extends State<LocationDropdown> {
  String? dropdownValue = null;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      hint: Text(
        'Select Location',
        style: TextStyle(
          fontSize: globals.buttonHeight * 0.35,
          fontWeight: FontWeight.w500,
          fontFamily: 'DMSans',
        ),
      ),
      onTap: () async {
        await globals.locationsGet();
      },
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      focusColor: globals.appOffWhite,
      underline: Container(
        height: globals.buttonHeight * 0.03,
        color: globals.logoOrange,
      ),
      onChanged: (String? value) {
        globals.locationsDataGet(value);
        locationSelected = true;
        setState(() {
          dropdownValue = value!;
        });
      },
      items:
          globals.locationsList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              fontSize: globals.buttonHeight * 0.35,
              fontWeight: FontWeight.w500,
              fontFamily: 'DMSans',
            ),
          ),
        );
      }).toList(),
    );
  }
}

Future<void> _notSelected(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select a Location'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('You must select a location to continue'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _inspSelection(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select an Inspection', textAlign: TextAlign.center),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                  'Would you like to start an automatic inspection, or a manual inspection?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Container(
              height: globals.buttonHeight * 0.6,
              width: globals.buttonWidth * 3,
              decoration: BoxDecoration(
                color: globals.logoOrange,
                border: Border.all(
                    width: globals.buttonHeight * 0.05,
                    color: globals.appDarkGrey),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                'Auto',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: globals.buttonHeight * 0.35,
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/newinspa');
            },
          ),
          TextButton(
            child: Container(
              height: globals.buttonHeight * 0.6,
              width: globals.buttonWidth * 3,
              decoration: BoxDecoration(
                color: globals.logoOrange,
                border: Border.all(
                    width: globals.buttonHeight * 0.05,
                    color: globals.appDarkGrey),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                'Manual',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: globals.buttonHeight * 0.35,
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/newinspm');
            },
          ),
        ],
      );
    },
  );
}
