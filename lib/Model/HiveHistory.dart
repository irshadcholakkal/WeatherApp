

// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weather/Model/HistoryModelClass.dart';

ValueNotifier<List<History>>DataList=ValueNotifier([]);


Future<void>SearchHistories(History value)async{

  var box = await Hive.openBox<History>('history');


await box.add(value);
DataList.value.add(value);

DataList.notifyListeners();

print("=========================================================================${DataList}");

}

Future<void>getData()async{
   final box = await Hive.openBox<History>('history');
  DataList.value.clear();

DataList.value.addAll(box.values);  
  DataList.notifyListeners();
  

}

class DataClearedNotifier extends ChangeNotifier {
  
    Future<void> clearAllData() async {
    // Clear Hive data
    await Hive.deleteFromDisk(); 
    notifyListeners();
  }
}