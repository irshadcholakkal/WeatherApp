// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Model/FetchdataFromNet.dart';
import 'package:weather/Model/ModelClassOfWeather.dart';
import 'package:weather/Model/forecastModelClass.dart';
import 'package:weather/view/Properties/Containers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var pr = Provider.of<Locationss>(context,listen: false);

    //   if(location!=null){
    // Provider.of<LocPermissionProvider>(context,listen: false).getadress(location, context);}

   
    return
     FutureBuilder(
        future: datas(),
        builder: (context, snapshot) {
         // if (snapshot.connectionState == ConnectionState.waiting) {

            // return LoadingScreen(context);
         // } else {
          

             return Scaffold(
              resizeToAvoidBottomInset: false,
             backgroundColor: Theme.of(context).colorScheme.background,
              body: place(context),
            
              
            );
        //  }
        });
 
  }
  Future<void>datas()async{
      datassss=await Locationss().fetchDatas();
      forecastdata=await Locationss().forecast();

  // await Locationss(). forecast();
  // await Locationss(). fetchDatas();
}
}
Datas? datassss;
forecastDatas? forecastdata;