// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/ViewModel/Location.dart';
import 'package:weather/view/Pages/Home_Page.dart';
import 'package:weather/view/Properties/Containers.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Provider.of<LocPermissionProvider>(context, listen: false)
        .getCurrentLocation()
        .then((value) {
      Future.delayed(Duration(milliseconds: 0), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    });

    return LoadingScreen(context);// or your splash screen widget
  }
}
