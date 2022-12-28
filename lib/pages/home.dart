import 'package:flutter/material.dart';
import 'package:ttrail_laptopo/globals.dart' as globals;
import 'package:ttrail_laptopo/mapcreation.dart' as mc;

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
        body: SizedBox(
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
                    Navigator.pushNamed(context, '/newinsp');
                  } else {
                    _notSelected(context);
                  }
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.green, width: 3),
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.content_paste_search_outlined,
                          size: 100),
                      Text(
                        'New Inspection',
                        style: globals.header1,
                      ),
                    ],
                  ),
                ),
              ),
              //Container 2
              GestureDetector(
                onTap: () {
                  if (locationSelected == true) {
                    Navigator.pushNamed(context, '/insps');
                  } else {
                    _notSelected(context);
                  }
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.green, width: 3),
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.folder_open_outlined, size: 100),
                      Text('Inspections', style: globals.header1),
                    ],
                  ),
                ),
              ),
              //Container 3
              GestureDetector(
                onTap: () {
                  if (locationSelected == true) {
                    Navigator.pushNamed(context, '/map');
                  } else {
                    _notSelected(context);
                  }
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.green, width: 3),
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.map_outlined, size: 100),
                      Text(
                        'Track Map',
                        style: globals.header1,
                      ),
                    ],
                  ),
                ),
              ),

              //Container 4
              GestureDetector(
                onTap: () {
                  mc.getPoints();
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.green, width: 3),
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Null', style: globals.header1),
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
