import 'package:flutter/material.dart';
class UserProvider {
  int _uid = 0; // We use int because Django IDs are integers

  int get uid => _uid;

  void setUid(int id) {
    _uid = id;
  }
}
