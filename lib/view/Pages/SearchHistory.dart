import 'package:flutter/material.dart';
import 'package:weather/Model/HiveHistory.dart';
import 'package:weather/ViewModel/ListViewsOfSearchHistory.dart';
import 'package:weather/view/Pages/Home_Page.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 80,
          title: const Text("History"),
          actions: [
            IconButton(
                onPressed: () {
                  DataClearedNotifier()
                      .clearAllData()
                      .then((value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                          (route) => false));
                },
                icon: Icon(
                  Icons.clear_rounded,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ))
          ],
        ),
        body: SafeArea(
          child: 
          
          ListViewsOfSearchHistory(),
        ));
  }
}
