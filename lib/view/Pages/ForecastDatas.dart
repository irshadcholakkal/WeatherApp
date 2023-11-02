import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Model/Providers.dart';
import 'package:weather/ViewModel/ListViewsOfForecast.dart';

class foreCast extends StatelessWidget {
  const foreCast({super.key});

  @override
  Widget build(BuildContext context) {
  final provid = Provider.of<providers>(context);

    return Scaffold(
      

      appBar: AppBar(
        titleSpacing: 70,
        title: Column(
          children: [
            Text(
              '${provid.datassss?.name ?? 'loading...'} | ${provid.datassss?.country ?? 'loading...'}',
              style: TextStyle(
                color: Theme.of(context).textTheme.labelLarge!.color,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text("Weather forecast",
            style: TextStyle(
              color: Theme.of(context).textTheme.labelLarge!.color,
              fontSize: 8
            ),)
          ],
        ),
      ),
      body:  const SafeArea(
        child:  ListViews(),
      ),
    );
  }
}