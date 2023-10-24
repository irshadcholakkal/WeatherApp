
// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

ThemeData LightTheme=ThemeData(
  brightness: Brightness.light,
   colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.white,
   // shadow: Colors.grey.withOpacity(0.08),
    secondary: Colors.black,
    

    
    
   ),
   textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color:  Color(0xFF7F7F7F),),//for values name
    bodySmall: TextStyle(color:  Color(0xFF404B5A),)  ,//for values
    labelLarge: TextStyle(color: Color(0xFF414B5A)),//for temperathure
  
   ),


   searchBarTheme: SearchBarThemeData(
    backgroundColor:  MaterialStatePropertyAll( Colors.white,),
     shadowColor:   MaterialStatePropertyAll(Colors.black),
     hintStyle: MaterialStatePropertyAll(TextStyle(color: Colors.black)),
     
     ),


   bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor:  Colors.white,
    selectedItemColor: Colors.grey.shade800,
    
   ),
   shadowColor: Colors.grey.withOpacity(0.10),
   progressIndicatorTheme: ProgressIndicatorThemeData(
    refreshBackgroundColor: Color.fromARGB(255, 94, 20, 118),
    color: Colors.black,
    // refreshBackgroundColor: 
   ),
   splashColor: Colors.white,
   
   useMaterial3: true
   
   
);





ThemeData DarkTheme=ThemeData(
  brightness: Brightness.dark,
   colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.black,
   // shadow: Colors.grey.withOpacity(0.08),
    secondary: Colors.black,
    

    
    
   ),
   textTheme: TextTheme(
    bodyLarge: TextStyle(color:  Colors.white),
    bodyMedium: TextStyle(color:  Color.fromARGB(255, 181, 179, 179),),//for values name
    bodySmall: TextStyle(color:  Color.fromARGB(255, 220, 227, 234),)  ,//for values
    labelLarge: TextStyle(color: Color.fromARGB(255, 221, 222, 224)),//for temperathure
  
   ),


   searchBarTheme: SearchBarThemeData(
    backgroundColor:  MaterialStatePropertyAll( Colors.white,),
     shadowColor:   MaterialStatePropertyAll(Colors.black),
     hintStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
     
     ),


   bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor:  Colors.black,
    selectedItemColor: Colors.grey.shade500,
    
   ),
   shadowColor: Colors.white.withOpacity(0.1),
   progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.grey.shade100,
    // refreshBackgroundColor: 
   ),
   splashColor: Colors.black,
   
   useMaterial3: true
);


//const Color.fromARGB(255, 33, 33, 33), background
//Color.fromARGB(255, 24, 24, 24), container
////Color.fromARGB(27, 170, 170, 170), shadow
/////Color.fromARGB(255, 24, 24, 24),navigation bar background