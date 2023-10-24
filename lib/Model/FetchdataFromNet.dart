
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:vibration/vibration.dart';
import 'package:weather/Model/ModelClassOfWeather.dart';
import 'package:weather/Model/Variables.dart';
import 'package:weather/Model/forecastModelClass.dart';




class Locationss extends ChangeNotifier{

  void   setLocation( locate,locationss) {
    lat = locate;
    lon= locationss;

    print("---$location");
    
     notifyListeners();

    
  }

  // Locationss(context){
  //   fetchDatas(context);
  // }

//Datas?weather;
Future<dynamic> fetchDatas() async {
  

  
  final response = await http.get(
      Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=5d89423b6d701f45ff34c365d14d3b87&units=metric"));
             // "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=5d89423b6d701f45ff34c365d14d3b87&units=metric"));
  notifyListeners();
  print("888888888$location");
  if (response.statusCode == 200) {
    print("connected");
    print(response.body);
    Vibration.vibrate(duration: 500);
    notifyListeners();
     //weather= Datas.fromJson(jsonDecode(response.body));
    return Datas.fromJson(jsonDecode(response.body));

    
  } else {
    print("failed");
    Vibration.vibrate(amplitude: 10);
    throw Exception('Failed to load Datas');
  }
  
}


Future<dynamic> forecast() async {
  print('called forecast');

  
  final response = await http.get(
      Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=malappuram&appid=5d89423b6d701f45ff34c365d14d3b87&units=metric"));
             // "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=5d89423b6d701f45ff34c365d14d3b87&units=metric"));
  notifyListeners();
  print("888888888$location");
  if (response.statusCode == 200) {
    print("connected");
    print(response.body);
    Vibration.vibrate(duration: 500);
    notifyListeners();
     //weather= Datas.fromJson(jsonDecode(response.body));
    return forecastDatas.fromJson(jsonDecode(response.body));

    
  } else {
    print("failed");
    Vibration.vibrate(amplitude: 10);
    throw Exception('Failed to load Datas');
  }
  
}

}


