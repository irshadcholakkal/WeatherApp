import 'package:flutter/material.dart';

class providers extends ChangeNotifier{

   bool pos = true;
  void search(val) {
    pos = val;
    notifyListeners();
  }

  bool www = true;
  void vvv(c) {
    www = c;
    notifyListeners();
  }

  bool theme = true;
  void th(vv) {
    theme = vv;
    notifyListeners();
  }
}