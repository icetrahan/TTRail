import 'package:flutter/material.dart';
import 'package:ttrail_laptopo/globals.dart' as globals;

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                  Text("Location", style: globals.header1),
                  SizedBox(width: globals.buttonWidth * 0.5),
                  const LocationDropdown(),
                ],
              ),

              SizedBox(height: globals.buttonHeight * 0.2),
              //Container 1
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/newinsp');
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
                  Navigator.pushNamed(context, '/insps');
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
                  Navigator.pushNamed(context, '/map');
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
                  Navigator.pushNamed(context, '/test');
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
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: globals.bodyText1,
      underline: Container(
        height: 2,
        color: globals.logoOrange,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
