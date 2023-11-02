// ignore_for_file: non_constant_identifier_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weather/Model/HistoryModelClass.dart';
import 'package:weather/Model/HiveHistory.dart';
import 'package:weather/Model/SizedBoxes.dart';
import 'package:weather/ViewModel/WeatherIcons.dart';

class ListViewsOfSearchHistory extends StatelessWidget {
  ListViewsOfSearchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<History>>(
        valueListenable: DataList,
        builder: (context, List<History> DataList, Widget? child) {
          return ListView.builder(
            shrinkWrap: true,
            // reverse: true,
            // dragStartBehavior:DragStartBehavior.start ,
            
            itemCount: DataList.length,
            itemBuilder: (BuildContext context, int index) {
              final historyItem = DataList.reversed.toList()[index]; /// here the data is showing new on top
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).shadowColor, //color of shadow
                          spreadRadius: 5, //spread radius
                          blurRadius: 7, // blur radius
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            itemsTextData(historyItem.place ?? "", context),
                            //SizedBox(height: 5,),
                            Text(
                              historyItem.Date.toString(),
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .color,
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                            ),
                            Text(
                              historyItem.time.toString(),
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .color,
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                               alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.45,
                              child: itemsTextData(
                                  historyItem.description.toString(), context),
                            ),
                            itemsTextData(
                                historyItem.temprature.toString(), context),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: WeatherIcons(historyItem.description)),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
