// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather/Model/FetchdataFromNet.dart';
import 'package:weather/Model/ModelClassOfWeather.dart';
import 'package:weather/Model/Providers.dart';
import 'package:weather/Model/SizedBoxes.dart';
import 'package:weather/Model/Theme_Provider.dart';
import 'package:weather/Model/Variables.dart';
import 'package:weather/ViewModel/Location.dart';
import 'package:weather/ViewModel/WeatherIcons.dart';
import 'package:weather/view/Pages/Home_Page.dart';

DateTime now = DateTime.now();
String formattedDate =
    "${DateFormat('E').format(now)}-${DateFormat('MMM').format(now)}-${DateFormat('y').format(now)}";

Widget place(BuildContext context, AsyncSnapshot<Datas> snapshot) {


   Future<void>refresh(){
      return Future.delayed(Duration(seconds: 2));
    }
  final provid = Provider.of<providers>(context);
  
  return RefreshIndicator(
    onRefresh: refresh,
    child: Column(
      
      children: [
        
        box(0.09, 0, context),
        Center(
          child: InkWell(
              onTap: () {
                provid.search(false);
              },
              child: provid.pos ? City(snapshot,context) : SearchBars(context)
             
              ),
        ),
        box(0.01, 0, context),
        Text(
          formattedDate,
          style: TextStyle(
            color: Theme.of(context).textTheme.labelLarge!.color,
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w300,
            height: 0,
          ),
        ),
        box(0.05, 0, context),
        tempratureContainer(context, snapshot),
        // box(0.01, 0, context),
        
        box(0.09, 0, context),
        items(context, snapshot),
        box(0.12, 0, context),
        naigationBar(context),
      ],
    ),
  );
}

Widget tempratureContainer(
    BuildContext context, AsyncSnapshot<Datas> snapshot) {
  return Container(
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color:Theme.of(context).shadowColor
             , //color of shadow
            spreadRadius: 5, //spread radius
            blurRadius: 7, // blur radius
            offset: Offset(0, 2),
          )
        ]),
    height: MediaQuery.of(context).size.height * 0.22,
    width: MediaQuery.of(context).size.width * 0.89,
    child: Column(
      children: [
        Row(
          children: [
            box(0.05, 0.05, context),
            Text(
              'TEMPERATURE',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium!.color,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        box(0.000, 0, context),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              snapshot.data!=null?
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: snapshot.data?.temp.toString(),
                  style: TextStyle(
                    color: Theme.of(context).textTheme.labelLarge!.color,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: "°c",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ])):CircularProgressIndicator(
                color: Theme.of(context).progressIndicatorTheme.color,
                strokeCap: StrokeCap.round,
                
              ),
              // Image.asset(
              //   'Assets/cloud (1).png',
              //   height: 50,
              // )
              WeatherIcons(snapshot.data?.description)
            ],
          ),
        ),
        box(0.00, 0, context),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Real feel: ${snapshot.data?.feelsLike.toString()??0}°c',
                style: TextStyle(
                  color: Theme.of(context).textTheme.labelLarge!.color,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                snapshot.data?.description ?? 'loading...',
                style: TextStyle(
                  color: Theme.of(context).textTheme.labelLarge!.color,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget items(BuildContext context, AsyncSnapshot<Datas> snapshot) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.75,
    height: MediaQuery.of(context).size.height * 0.23,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.min,
            children: [
              itemsText('Visibility', context),
              box(0.01, 0.0, context),
              itemsText('Humidity', context),
              box(0.01, 0, context),
              itemsText('Wind Speed', context),
              box(0.01, 0, context),
              itemsText('Temprerature Min', context),
              box(0.01, 0, context),
              itemsText('Temprerature Max', context),
              box(0.01, 0, context),
              itemsText('Pressure', context),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //mainAxisSize: MainAxisSize.min,
            children: [
              itemsTextData('${snapshot.data?.visibility??0}',context),
              box(0.01, 0, context),
              itemsTextData('${snapshot.data?.humidity.toString()??0} %',context),
              box(0.01, 0, context),
              itemsTextData('${snapshot.data?.speed?.round()??0} mph',context),
              box(0.01, 0, context),
              itemsTextData('${snapshot.data?.tempMin.toString()??0} °c',context),
              box(0.01, 0, context),
              itemsTextData('${snapshot.data?.tempMax.toString()??0} °c',context),
              box(0.01, 0, context),
              itemsTextData('${snapshot.data?.pressure.toString()??0} pa',context),
            ],
            
          )
        ],
      ),
    ),
  );
}

Widget naigationBar(BuildContext context) {
  final provid = Provider.of<providers>(context);

  return Container(
    width: MediaQuery.of(context).size.width * 0.90,
    height: MediaQuery.of(context).size.height * 0.07,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).shadowColor, //color of shadow
          spreadRadius: 7, //spread radius
          blurRadius: 7, // blur radius
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'Assets/cloud-drizzle (2).png',
          color: //Colors.white,
          Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          height: 30,
        ),
        Image.asset(
          'Assets/activity (2).png',
          color://Colors.white,
          Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          height: 31,
        ),
        Image.asset(
          'Assets/layout.png',
          color:// Colors.white,
           Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          height: 30,
        ),
        InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => GoogleMaps(),
            //     ));
             provid.theme=false;
            
          },
          child: Image.asset(
            'Assets/map-pin (1).png',
            color:/// Colors.white,
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            height: 30,
          ),
        )
      ],
    ),
  );
}

Widget LoadingScreen(BuildContext context) {
  return Scaffold(
    
    backgroundColor: Theme.of(context).splashColor,
    body: Column(
      children: [
        box(0.25, 0, context),
        Lottie.asset('Assets/Loading.json'),
        CircularProgressIndicator(
          color: Theme.of(context).progressIndicatorTheme.refreshBackgroundColor,
          strokeCap: StrokeCap.round,
          strokeAlign: 1,
          strokeWidth: 3,
        ),
        box(0.2, 0, context),
        Text(
          'Please Check Internet Connection !',
          style: TextStyle(color: Colors.grey.withOpacity(0.8)),
        )
      ],
    ),
  );
}

Widget City(AsyncSnapshot<Datas> snapshot,BuildContext context) {
  return Text(
    '${snapshot.data?.name ?? 'loading...'} | ${snapshot.data?.country ?? 'loading...'}',
    style: TextStyle(
      color: Theme.of(context).textTheme.labelLarge!.color,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
  );
}

// TextEditingController loc = TextEditingController();
Widget SearchBars(BuildContext context) {
    final provid = Provider.of<LocPermissionProvider>(context);
        final prov = Provider.of<providers>(context);

      //  final pr= Provider.of<Locationss>(context);


  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.8,
    child: TextField(
      textCapitalization: TextCapitalization.sentences,
      // controller: loc,
      onSubmitted: (value) {
        

         provid.getadress(value,context).then((value) =>  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),), (route) => false));
                prov.search(true);      
                      //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),), (route) => false);
        
      },
      
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          label: Icon(
            Icons.location_pin,
            color: Colors.red.shade900,
          ),
          hintText: 'Location',
          
          
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.black)),
              
          // suffixIcon: InkWell(
          //   // onTap: () {
          //   //    location=loc.text;
          //   //    provid.getadress(location,context);
          //   //           prov.search(true);
                
                      
          //   //          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),), (route) => false);
              
              
          //   // },
          //   child: Icon(
          //     Icons.search_outlined,
          //     color: Colors.black,
          //   ),
          // )
          ),
      )
    );
 // );
}


