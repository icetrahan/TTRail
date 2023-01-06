import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';

class MyProvider extends ChangeNotifier {
  Map btDevice = {
    'services': List<BluetoothService>,
    'name': 'N/A',
    'data': 'N/A',
    'connected': false,
  };
}
