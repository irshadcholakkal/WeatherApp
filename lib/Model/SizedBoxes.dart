// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
    style: TextStyle(
      color: Theme.of(context).textTheme.bodySmall!.color,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  );
}

