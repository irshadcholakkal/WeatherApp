


// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';

part 'HistoryModelClass.g.dart';

@HiveType(typeId: 1)
class History{

  
  @HiveField(0)
  num ?temprature;
  @HiveField(1)
  String ? place;
@HiveField(2)
String?description;
@HiveField(3)
String ? Date;
@HiveField(4)
String ? time;




History({
  
  required this.place,
  required this.temprature,
  required this.description,
  required this.Date,
  required this.time

});
}


