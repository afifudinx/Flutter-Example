import 'package:flutter/material.dart';

class AppContext with ChangeNotifier {
  String _name = '';
  String _image = '';

  String get name => _name;
  String get image => _image;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  set image(String value) {
    _image = value;
    notifyListeners();
  }
}
