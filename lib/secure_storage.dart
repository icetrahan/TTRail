import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ttrail_laptopo/globals.dart' as globals;
import 'dart:convert';

class UserSecureStorage {
  static final _storage = new FlutterSecureStorage();

  static const _keyEmail = 'USER_EMAIL';
  static const _keyPassword = 'USER_PASS';

  String savingPass = '';

  Future saveLogin(bool _savePassword, TextEditingController _email,
      TextEditingController _pass) async {
    print('Saved');
    if (_savePassword) {
      await _storage.write(key: _keyEmail, value: _email.text);
      await _storage.write(key: _keyPassword, value: _pass.text);
      await _storage.write(key: "SavePass", value: 'true');
    } else {
      await _storage.write(key: _keyEmail, value: _email.text);
      await _storage.write(key: _keyPassword, value: '');
      await _storage.write(key: "SavePass", value: 'false');
    }
    return;
  }

  Future getLogin(
      TextEditingController _email, TextEditingController _pass) async {
    savingPass = await _storage.read(key: "SavePass") ?? '';
    if (savingPass == 'true') {
      globals.savePass = true;
    } else {
      globals.savePass = false;
    }
    _email.text = await _storage.read(key: _keyEmail) ?? '';
    _pass.text = await _storage.read(key: _keyPassword) ?? '';
    return;
  }
}
