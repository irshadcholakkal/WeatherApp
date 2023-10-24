import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Model/FetchdataFromNet.dart';
import 'package:weather/Model/Providers.dart';
import 'package:weather/Model/Theme_Provider.dart';
import 'package:weather/ViewModel/Themes.dart';
import 'package:weather/ViewModel/Location.dart';
import 'package:weather/view/SplashScreen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider.of<ThemeProvider>(context, listen: false).setThemeBasedOnTime(); // Set theme based on time

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocPermissionProvider()),
        ChangeNotifierProvider(create: (context) => Locationss()),
        ChangeNotifierProvider(create: (context) => providers()),
        ChangeNotifierProvider(create: (context) => ThemeProvider(),)
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          themeProvider.setThemeBasedOnTime(context); 
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            theme: themeProvider.currenttheme,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
