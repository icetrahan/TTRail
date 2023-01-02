import 'package:flutter/material.dart';
import 'package:ttrail_laptopo/globals.dart' as globals;
import 'package:ttrail_laptopo/mapcreation.dart' as mc;
import 'handbook.dart' as hb;
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async';
import 'dart:io';
import 'dart:math';

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: globals.buttonHeight * 0.2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Drop Down for location select
                      Text("Location:", style: globals.header1),
                      SizedBox(width: globals.buttonWidth * 0.2),
                      const LocationDropdown(),
                    ],
                  ),
                  SizedBox(height: globals.buttonHeight * 0.3),
                  Container(
                    height: globals.buttonHeight * 2,
                    width: globals.buttonWidth * 9,
                    color: Color.fromARGB(255, 192, 192, 192),
                    child: Column(
                      children: [
                        SizedBox(height: globals.buttonHeight * 0.1),
                        Row(
                          children: [
                            globals.bluetoothConnected
                                ? Icon(
                                    Icons.bluetooth_connected_outlined,
                                    color: Color.fromARGB(255, 21, 204, 27),
                                    size: globals.buttonHeight * 0.5,
                                  )
                                : Icon(
                                    Icons.bluetooth,
                                    color: Color.fromARGB(255, 214, 23, 9),
                                    size: globals.buttonHeight * 0.5,
                                  ),
                            globals.bluetoothConnected
                                ? Text(
                                    'Bluetooth Connected',
                                    style: TextStyle(
                                        fontSize: globals.buttonHeight * 0.3),
                                  )
                                : Text(
                                    'Bluetooth Not Connected',
                                    style: TextStyle(
                                        fontSize: globals.buttonHeight * 0.3),
                                  )
                          ],
                        ),
                        globals.bluetoothConnected
                            ? Text('Bluetooth Data Goes Here')
                            : TextButton(
                                onPressed: (() {}),
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
                                    'Connect',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: globals.buttonHeight * 0.35,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(height: globals.buttonHeight * 0.4),
                  //Container 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                            border:
                                Border.all(color: globals.logoOrange, width: 3),
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
                            border:
                                Border.all(color: globals.logoOrange, width: 3),
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
                    ],
                  ),
                  SizedBox(height: globals.buttonHeight * 0.35),
                  //Container 3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                            border:
                                Border.all(color: globals.logoOrange, width: 3),
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
                            border:
                                Border.all(color: globals.logoOrange, width: 3),
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

Future<void> _bluetoothDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Pair a Track Device', textAlign: TextAlign.center),
        content: RefreshIndicator(
          onRefresh: () => FlutterBluePlus.instance
              .startScan(timeout: const Duration(seconds: 4)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StreamBuilder<List<BluetoothDevice>>(
                  stream: Stream.periodic(const Duration(seconds: 2)).asyncMap(
                      (_) => FlutterBluePlus.instance.connectedDevices),
                  initialData: const [],
                  builder: (c, snapshot) => Column(
                    children: snapshot.data!
                        .map((d) => ListTile(
                              title: Text(d.name),
                              subtitle: Text(d.id.toString()),
                              trailing: StreamBuilder<BluetoothDeviceState>(
                                stream: d.state,
                                initialData: BluetoothDeviceState.disconnected,
                                builder: (c, snapshot) {
                                  if (snapshot.data ==
                                      BluetoothDeviceState.connected) {
                                    return ElevatedButton(
                                      child: const Text('OPEN'),
                                      onPressed: () => Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  DeviceScreen(device: d))),
                                    );
                                  }
                                  return Text(snapshot.data.toString());
                                },
                              ),
                            ))
                        .toList(),
                  ),
                ),
                StreamBuilder<List<ScanResult>>(
                  stream: FlutterBluePlus.instance.scanResults,
                  initialData: const [],
                  builder: (c, snapshot) => Column(
                    children: snapshot.data!
                        .map(
                          (r) => ScanResultTile(
                            result: r,
                            onTap: () => Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              r.device.connect();
                              return DeviceScreen(device: r.device);
                            })),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          StreamBuilder<bool>(
            stream: FlutterBluePlus.instance.isScanning,
            initialData: false,
            builder: (c, snapshot) {
              if (snapshot.data!) {
                return FloatingActionButton(
                  child: const Icon(Icons.stop),
                  onPressed: () => FlutterBluePlus.instance.stopScan(),
                  backgroundColor: Colors.red,
                );
              } else {
                return FloatingActionButton(
                    child: const Icon(Icons.search),
                    onPressed: () => FlutterBluePlus.instance
                        .startScan(timeout: const Duration(seconds: 4)));
              }
            },
          ),
        ],
      );
    },
  );
}

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key? key, required this.device}) : super(key: key);

  final BluetoothDevice device;

  List<int> _getRandomBytes() {
    final math = Random();
    return [
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255)
    ];
  }

  List<Widget> _buildServiceTiles(List<BluetoothService> services) {
    return services
        .map(
          (s) => ServiceTile(
            service: s,
            characteristicTiles: s.characteristics
                .map(
                  (c) => CharacteristicTile(
                    characteristic: c,
                    onReadPressed: () => c.read(),
                    onWritePressed: () async {
                      await c.write(_getRandomBytes(), withoutResponse: true);
                      await c.read();
                    },
                    onNotificationPressed: () async {
                      await c.setNotifyValue(!c.isNotifying);
                      await c.read();
                    },
                    descriptorTiles: c.descriptors
                        .map(
                          (d) => DescriptorTile(
                            descriptor: d,
                            onReadPressed: () => d.read(),
                            onWritePressed: () => d.write(_getRandomBytes()),
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(device.name),
        actions: <Widget>[
          StreamBuilder<BluetoothDeviceState>(
            stream: device.state,
            initialData: BluetoothDeviceState.connecting,
            builder: (c, snapshot) {
              VoidCallback? onPressed;
              String text;
              switch (snapshot.data) {
                case BluetoothDeviceState.connected:
                  onPressed = () => device.disconnect();
                  text = 'DISCONNECT';
                  break;
                case BluetoothDeviceState.disconnected:
                  onPressed = () => device.connect();
                  text = 'CONNECT';
                  break;
                default:
                  onPressed = null;
                  text = snapshot.data.toString().substring(21).toUpperCase();
                  break;
              }
              return TextButton(
                  onPressed: onPressed,
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .button
                        ?.copyWith(color: Colors.white),
                  ));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder<BluetoothDeviceState>(
              stream: device.state,
              initialData: BluetoothDeviceState.connecting,
              builder: (c, snapshot) => ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    snapshot.data == BluetoothDeviceState.connected
                        ? const Icon(Icons.bluetooth_connected)
                        : const Icon(Icons.bluetooth_disabled),
                    snapshot.data == BluetoothDeviceState.connected
                        ? StreamBuilder<int>(
                            stream: rssiStream(),
                            builder: (context, snapshot) {
                              return Text(
                                  snapshot.hasData ? '${snapshot.data}dBm' : '',
                                  style: Theme.of(context).textTheme.caption);
                            })
                        : Text('', style: Theme.of(context).textTheme.caption),
                  ],
                ),
                title: Text(
                    'Device is ${snapshot.data.toString().split('.')[1]}.'),
                subtitle: Text('${device.id}'),
                trailing: StreamBuilder<bool>(
                  stream: device.isDiscoveringServices,
                  initialData: false,
                  builder: (c, snapshot) => IndexedStack(
                    index: snapshot.data! ? 1 : 0,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () => device.discoverServices(),
                      ),
                      const IconButton(
                        icon: SizedBox(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.grey),
                          ),
                          width: 18.0,
                          height: 18.0,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
            ),
            StreamBuilder<int>(
              stream: device.mtu,
              initialData: 0,
              builder: (c, snapshot) => ListTile(
                title: const Text('MTU Size'),
                subtitle: Text('${snapshot.data} bytes'),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => device.requestMtu(223),
                ),
              ),
            ),
            StreamBuilder<List<BluetoothService>>(
              stream: device.services,
              initialData: const [],
              builder: (c, snapshot) {
                return Column(
                  children: _buildServiceTiles(snapshot.data!),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Stream<int> rssiStream() async* {
    var isConnected = true;
    final subscription = device.state.listen((state) {
      isConnected = state == BluetoothDeviceState.connected;
    });
    while (isConnected) {
      yield await device.readRssi();
      await Future.delayed(const Duration(seconds: 1));
    }
    subscription.cancel();
    // Device disconnected, stopping RSSI stream
  }
}

class ScanResultTile extends StatelessWidget {
  const ScanResultTile({Key? key, required this.result, this.onTap})
      : super(key: key);

  final ScanResult result;
  final VoidCallback? onTap;

  Widget _buildTitle(BuildContext context) {
    if (result.device.name.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            result.device.name,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            result.device.id.toString(),
            style: Theme.of(context).textTheme.caption,
          )
        ],
      );
    } else {
      return Text(result.device.id.toString());
    }
  }

  Widget _buildAdvRow(BuildContext context, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: Theme.of(context).textTheme.caption),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.apply(color: Colors.black),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  String getNiceHexArray(List<int> bytes) {
    return '[${bytes.map((i) => i.toRadixString(16).padLeft(2, '0')).join(', ')}]'
        .toUpperCase();
  }

  String getNiceManufacturerData(Map<int, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add(
          '${id.toRadixString(16).toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }

  String getNiceServiceData(Map<String, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add('${id.toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: _buildTitle(context),
      leading: Text(result.rssi.toString()),
      trailing: ElevatedButton(
        child: const Text('CONNECT'),
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: Colors.white,
        ),
        onPressed: (result.advertisementData.connectable) ? onTap : null,
      ),
      children: <Widget>[
        _buildAdvRow(
            context, 'Complete Local Name', result.advertisementData.localName),
        _buildAdvRow(context, 'Tx Power Level',
            '${result.advertisementData.txPowerLevel ?? 'N/A'}'),
        _buildAdvRow(context, 'Manufacturer Data',
            getNiceManufacturerData(result.advertisementData.manufacturerData)),
        _buildAdvRow(
            context,
            'Service UUIDs',
            (result.advertisementData.serviceUuids.isNotEmpty)
                ? result.advertisementData.serviceUuids.join(', ').toUpperCase()
                : 'N/A'),
        _buildAdvRow(context, 'Service Data',
            getNiceServiceData(result.advertisementData.serviceData)),
      ],
    );
  }
}

class ServiceTile extends StatelessWidget {
  final BluetoothService service;
  final List<CharacteristicTile> characteristicTiles;

  const ServiceTile(
      {Key? key, required this.service, required this.characteristicTiles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (characteristicTiles.isNotEmpty) {
      return ExpansionTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Service'),
            Text('0x${service.uuid.toString().toUpperCase().substring(4, 8)}',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Theme.of(context).textTheme.caption?.color))
          ],
        ),
        children: characteristicTiles,
      );
    } else {
      return ListTile(
        title: const Text('Service'),
        subtitle:
            Text('0x${service.uuid.toString().toUpperCase().substring(4, 8)}'),
      );
    }
  }
}

class CharacteristicTile extends StatelessWidget {
  final BluetoothCharacteristic characteristic;
  final List<DescriptorTile> descriptorTiles;
  final VoidCallback? onReadPressed;
  final VoidCallback? onWritePressed;
  final VoidCallback? onNotificationPressed;

  const CharacteristicTile(
      {Key? key,
      required this.characteristic,
      required this.descriptorTiles,
      this.onReadPressed,
      this.onWritePressed,
      this.onNotificationPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<int>>(
      stream: characteristic.value,
      initialData: characteristic.lastValue,
      builder: (c, snapshot) {
        final value = snapshot.data;
        return ExpansionTile(
          title: ListTile(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Characteristic'),
                Text(
                    '0x${characteristic.uuid.toString().toUpperCase().substring(4, 8)}',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Theme.of(context).textTheme.caption?.color))
              ],
            ),
            subtitle: Text(value.toString()),
            contentPadding: const EdgeInsets.all(0.0),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.file_download,
                  color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
                ),
                onPressed: onReadPressed,
              ),
              IconButton(
                icon: Icon(Icons.file_upload,
                    color: Theme.of(context).iconTheme.color?.withOpacity(0.5)),
                onPressed: onWritePressed,
              ),
              IconButton(
                icon: Icon(
                    characteristic.isNotifying
                        ? Icons.sync_disabled
                        : Icons.sync,
                    color: Theme.of(context).iconTheme.color?.withOpacity(0.5)),
                onPressed: onNotificationPressed,
              )
            ],
          ),
          children: descriptorTiles,
        );
      },
    );
  }
}

class DescriptorTile extends StatelessWidget {
  final BluetoothDescriptor descriptor;
  final VoidCallback? onReadPressed;
  final VoidCallback? onWritePressed;

  const DescriptorTile(
      {Key? key,
      required this.descriptor,
      this.onReadPressed,
      this.onWritePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Descriptor'),
          Text('0x${descriptor.uuid.toString().toUpperCase().substring(4, 8)}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Theme.of(context).textTheme.caption?.color))
        ],
      ),
      subtitle: StreamBuilder<List<int>>(
        stream: descriptor.value,
        initialData: descriptor.lastValue,
        builder: (c, snapshot) => Text(snapshot.data.toString()),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.file_download,
              color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
            ),
            onPressed: onReadPressed,
          ),
          IconButton(
            icon: Icon(
              Icons.file_upload,
              color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
            ),
            onPressed: onWritePressed,
          )
        ],
      ),
    );
  }
}

class AdapterStateTile extends StatelessWidget {
  const AdapterStateTile({Key? key, required this.state}) : super(key: key);

  final BluetoothState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: ListTile(
        title: Text(
          'Bluetooth adapter is ${state.toString().substring(15)}',
          style: Theme.of(context).primaryTextTheme.subtitle2,
        ),
        trailing: Icon(
          Icons.error,
          color: Theme.of(context).primaryTextTheme.subtitle2?.color,
        ),
      ),
    );
  }
}
