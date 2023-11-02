// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget box(heights, widths, BuildContext context) {
  return  SizedBox(
    width: MediaQuery.of(context).size.width *widths,
    height: MediaQuery.of(context).size.height * heights,
  );
}

Widget itemsText(data,BuildContext context) {
  return Text(
    data,
    style: TextStyle(
      color: Theme.of(context).textTheme.bodyMedium!.color,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget itemsTextData(data,BuildContext context) {
  return Text(
    data,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: Theme.of(context).textTheme.bodySmall!.color,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  );
}
void noti(msg,BuildContext context) {
    Fluttertoast.showToast(
        msg:msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
        textColor: Theme.of(context).textTheme.displaySmall!.color,
        fontSize: 16.0);
  }

//   Widget itemsTextData(data,BuildContext context){
//   return
//   Marquee(
//   text: data,
//   style: TextStyle(
//     color: Theme.of(context).textTheme.bodySmall!.color,
//     fontSize: 14,
//           fontWeight: FontWeight.w600,
//   ), // Adjust the font size as needed
//   scrollAxis: Axis.horizontal,
//   crossAxisAlignment: CrossAxisAlignment.start,
//   blankSpace: 20.0, // Add some space between the end and beginning of the text
//   velocity: 50.0, // Adjust the scrolling speed
//   pauseAfterRound: Duration(seconds: 1), // Pause after each cycle
//   startPadding: 10.0, // Add some padding at the start
//   accelerationDuration: Duration(seconds: 1), // Adjust acceleration duration
//   accelerationCurve: Curves.linear, // Adjust acceleration curve
//   decelerationDuration: Duration(milliseconds: 500), // Adjust deceleration duration
//   decelerationCurve: Curves.easeOut, // Adjust deceleration curve
// );
//   }

