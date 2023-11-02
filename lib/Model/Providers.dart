import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Model/FetchdataFromNet.dart';
import 'package:weather/Model/ModelClassOfWeather.dart';
import 'package:weather/Model/Variables.dart';

class providers extends ChangeNotifier{

 Datas?datassss;



 Future<void> datas(BuildContext context) async {
    final provid = Provider.of<providers>(context,listen:false);

  provid.datassss = await Locationss().fetchDatas(context);
  forecastdata = await Locationss().forecast();
  notifyListeners();
  }


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