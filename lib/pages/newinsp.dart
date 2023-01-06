import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import 'package:ttrail_laptopo/globals.dart' as globals;
import 'package:ttrail_laptopo/provider.dart' as provider;

import '../provider.dart';

class NewInspAuto extends StatefulWidget {
  const NewInspAuto({super.key});

  @override
  State<NewInspAuto> createState() => _NewInspAutoState();
}

class _NewInspAutoState extends State<NewInspAuto> {
  @override
  Widget build(BuildContext context) {
    late BluetoothCharacteristic bluetoothChar;
    MyProvider myVariable = context.watch<MyProvider>();
    return StreamBuilder<List<BluetoothService>>(
        stream: globals.currentBTDevice.services,
        initialData: const [],
        builder: (c, snapshot) {
          snapshot.data!.forEach((service) {
            debugPrint(
                '0x${service.uuid.toString().toUpperCase().substring(4, 8)}');
            if ('0x${service.uuid.toString().toUpperCase().substring(4, 8)}' ==
                '0xFFE0') {
              service.characteristics.forEach((characteristic) {
                debugPrint(
                    '0x${characteristic.uuid.toString().toUpperCase().substring(4, 8)}');
                if ('0x${characteristic.uuid.toString().toUpperCase().substring(4, 8)}' ==
                    '0xFFE1') {
                  debugPrint('it works');
                  globals.bluetoothChar = characteristic;

                  return StreamBuilder<List<int>>(
                      stream: globals.bluetoothChar.value,
                      initialData: globals.bluetoothChar.lastValue,
                      builder: (c, snapshot) {
                        late List<int> snapData = [];
                        snapshot.data?.forEach((element) {
                          snapData.add(element);
                        });
                        final List<int> btData = snapData;
                        globals.bluetoothData = utf8.decode(btData);
                        print(globals.bluetoothData);
                        return Scaffold(
                          appBar: AppBar(backgroundColor: globals.logoOrange),
                          body: Center(
                            child: Text(
                              globals.bluetoothData,
                              textAlign: TextAlign.center,
                              style: globals.header2,
                            ),
                          ),
                        );
                      });
                }
              });
            }
          });
        });
  }
}
