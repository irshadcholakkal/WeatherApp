import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Model/Providers.dart';
import 'package:weather/Model/SizedBoxes.dart';
import 'package:weather/Model/Variables.dart';
import 'package:weather/ViewModel/WeatherIcons.dart';


class ListViews extends StatelessWidget {
  const ListViews({super.key});

  @override
  Widget build(BuildContext context) {
      final provid = Provider.of<providers>(context);

    
    return ListView.builder(
      itemCount: forecastdata?.list.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(9.0),
          child: Container(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: Column(
                    
                    children: [
                      itemsTextData(forecastdata?.list[index].dayOfWeek ?? 0, context),
                      itemsTextData(
                      forecastdata?.list[index].formattedDtTxt ?? 0, context),
                    ],
                  ),
                ),
                
                Column(
                  children: [
                     Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              provid.datassss!=null?
              Text.rich(TextSpan(children: [
                TextSpan(
                  text:  forecastdata?.list[index].main.temp.toString(),
                  style: TextStyle(
                    color: Theme.of(context).textTheme.labelLarge!.color,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: "°c",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    fontSize: 15,
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
            ],
          ),
                  
                         Container(
                           alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.45,
                           child: itemsTextData(
                                                 forecastdata?.list[index].weather[0].description.toString()??0,
                                                 context),
                         ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.1,
                  width:MediaQuery.of(context).size.width*0.2,
                  child: WeatherIcons(forecastdata?.list[index].weather[0].description??"Loading")),
               
              ],
            ),
          ),
        );
      },
    );
  }
}
