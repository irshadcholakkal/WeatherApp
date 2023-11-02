// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Model/Providers.dart';
import 'package:weather/view/Properties/Containers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var pr = Provider.of<Locationss>(context,listen: false);

    return FutureBuilder(
        future:  Provider.of<providers>(context,listen: false).datas(context),
        builder: (context, snapshot) {
          return Scaffold(
            
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).colorScheme.background,
                      
            body: place(context),
            
          );
          //  }
        });
  }
}


