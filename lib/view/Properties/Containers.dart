// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_import, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather/Model/FetchdataFromNet.dart';
import 'package:weather/Model/HistoryModelClass.dart';
import 'package:weather/Model/HiveHistory.dart';
import 'package:weather/Model/ModelClassOfWeather.dart';
import 'package:weather/Model/Providers.dart';
import 'package:weather/Model/SizedBoxes.dart';
import 'package:weather/Model/Theme_Provider.dart';
import 'package:weather/Model/Variables.dart';
import 'package:weather/Model/Location.dart';
import 'package:weather/ViewModel/WeatherIcons.dart';
import 'package:weather/view/Pages/ForecastDatas.dart';
import 'package:weather/view/Pages/Home_Page.dart';
import 'package:weather/view/Pages/SearchHistory.dart';

DateTime now = DateTime.now();
String formattedDate =
    "${DateFormat('E').format(now)}-${DateFormat('MMM').format(now)}-${DateFormat('y').format(now)}";

String formattedTime = DateFormat.jm()
    .format(now.toLocal()); // This formats time in 12-hour format with AM/PM

Widget place(BuildContext context) {
  getData();

  final provid = Provider.of<providers>(context);

  return Column(
    children: [
      box(0.06, 0, context),
      Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.9,
          child: InkWell(
              onTap: () {
                provid.search(false);
              },
              child: provid.pos
                  ? Center(child: City(context))
                  : SearchBars(context)),
        ),
      ),
      box(0.00, 0, context),
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

      box(0.04, 0, context),
      tempratureContainer(context),
      // box(0.01, 0, context),

      box(0.09, 0, context),
      items(context),
      box(0.12, 0, context),
      naigationBar(context),
    ],
  );
}

Widget tempratureContainer(
  BuildContext context,
) {
  final provid = Provider.of<providers>(context);

  return Container(
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor, //color of shadow
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
              provid.datassss != null
                  ? Text.rich(TextSpan(children: [
                      TextSpan(
                        text: provid.datassss?.temp.toString(),
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
                    ]))
                  : CircularProgressIndicator(
                      color: Theme.of(context).progressIndicatorTheme.color,
                      strokeCap: StrokeCap.round,
                    ),
              // Image.asset(
              //   'Assets/cloud (1).png',
              //   height: 50,
              // )
              WeatherIcons(provid.datassss?.description)
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
                'Real feel: ${provid.datassss?.feelsLike.toString() ?? 0}°c',
                
                style: TextStyle(
                  color: Theme.of(context).textTheme.labelLarge!.color,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.50,
                child: Text(
                  provid.datassss?.description ?? 'loading...',
                  overflow: TextOverflow.ellipsis,
                
                  style: TextStyle(
                    color: Theme.of(context).textTheme.labelLarge!.color,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget items(
  BuildContext context,
) {
  final provid = Provider.of<providers>(context);

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
              itemsTextData('${provid.datassss?.visibility ?? 0}', context),
              box(0.01, 0, context),
              itemsTextData(
                  '${provid.datassss?.humidity.toString() ?? 0} %', context),
              box(0.01, 0, context),
              itemsTextData(
                  '${provid.datassss?.speed?.round() ?? 0} mph', context),
              box(0.01, 0, context),
              itemsTextData(
                  '${provid.datassss?.tempMin.toString() ?? 0} °c', context),
              box(0.01, 0, context),
              itemsTextData(
                  '${provid.datassss?.tempMax.toString() ?? 0} °c', context),
              box(0.01, 0, context),
              itemsTextData(
                  '${provid.datassss?.pressure.toString() ?? 0} pa', context),
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
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => foreCast(),
                ));
          },
          child: Image.asset(
            'Assets/cloud-drizzle (2).png',
            color: //Colors.white,
                Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            height: 30,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchHistory(),
                ));
          },
          child: Image.asset(
            'Assets/activity (2).png',
            color: //Colors.white,
                Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            height: 31,
          ),
        ),
        // Image.asset(
        //   'Assets/layout.png',
        //   color: // Colors.white,
        //       Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        //   height: 30,
        // ),
        InkWell(
          onTap: () {
            Provider.of<LocPermissionProvider>(context, listen: false)
                .getCurrentLocation()
                .then((value) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                    (route) => false));
            SearchHistories(History(
                place: provid.datassss!.name.toString(),
                temprature: provid.datassss!.temp ?? 0,
                description: provid.datassss?.description.toString(),
                Date: formattedDate,
                time: formattedTime));

            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Google Maps(),
            //     ));
            // provid.theme = false;
          },
          child: Image.asset(
            'Assets/map-pin (1).png',
            color:

                /// Colors.white,
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
          color:
              Theme.of(context).progressIndicatorTheme.refreshBackgroundColor,
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

Widget City(BuildContext context) {
  final provid = Provider.of<providers>(context);

  return Text(
    '${provid.datassss?.name ?? 'loading...'} | ${provid.datassss?.country ?? 'loading...'}',
    style: TextStyle(
      color: Theme.of(context).textTheme.labelLarge!.color,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
  );
}

TextEditingController loc = TextEditingController();
Widget SearchBars(BuildContext context) {
  final provid = Provider.of<providers>(context);

  final provids = Provider.of<LocPermissionProvider>(context);
  final prov = Provider.of<providers>(context);

  final pr = Provider.of<Locationss>(context);

  return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        enableSuggestions: true,
        controller: loc,
        onSubmitted: (value) {
          pr.fetchDatas(context);
          pr.forecast();
          SearchHistories(History(
              place: provid.datassss!.name.toString(),
              temprature: provid.datassss!.temp ?? 0,
              description: provid.datassss?.description.toString(),
              Date: formattedDate,
              time: formattedTime));

          provids
              .getadress(value, context)
              .then((value) => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                  (route) => false));

          print(
              "-------------------------------------------------------------------------------------------${provid.datassss?.name},${provid.datassss?.temp}");

          prov.search(true);
          // Notify listeners that data has changed
          // provid.notifyListeners();
          // prov.notifyListeners();
          // });
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
            suffixIcon: InkWell(
              onTap: () {
                location = loc.text;
                // provid.getadress(location, context);
                pr.fetchDatas(context);
                pr.forecast();

                prov.search(true);
                provids.getadress(location, context).then(
                      (value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          (route) => false),
                    );

                SearchHistories(History(
                    place: provid.datassss!.name.toString(),
                    temprature: provid.datassss!.temp!.toDouble(),
                    description: provid.datassss?.description.toString(),
                    Date: formattedDate,
                    time: formattedTime));
                print(
                    "-------------------------------------------------------------------------------------------${provid.datassss?.name},${provid.datassss?.temp}");
              },
              child: Icon(
                Icons.search_outlined,
                color: Colors.black,
              ),
            )),
      ));

  // );
}
