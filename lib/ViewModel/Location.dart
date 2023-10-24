import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather/Model/FetchdataFromNet.dart';
import 'package:weather/Model/Variables.dart';
import 'package:weather/ViewModel/Errormessages.dart';

class LocPermissionProvider extends ChangeNotifier {
  Position? latLonposition;
  Placemark? decodeData;
  Location? locatonss;

  Future<void> getCurrentLocation() async {
    latLonposition = await _getCurrentLatLonPosition();

     Locationss()
        .setLocation(latLonposition!.latitude, latLonposition!.longitude);

    // await _getAddressFromLatLon(latLonposition!);
    notifyListeners();
  }

  Future<Position> _getCurrentLatLonPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  // Future<void> _getAddressFromLatLon(Position position) async {
  //   await placemarkFromCoordinates(position.latitude, position.longitude)
  //       .then((placemarks) {
  //     decodeData = placemarks[0];
  //     if (decodeData?.locality != null) {
  //       locality = decodeData?.locality;
  //        print('Localitys: $locality');
  //            Locationss().setLocation(locality);

  //      } else {
  //       print('Locality not available');
  //     }

  //   }).catchError((e) {
  //     debugPrint(e);
  //   });
  //   notifyListeners();
  // }

  Future<void> getadress(place, BuildContext context) async {
    final pr = Provider.of<Locationss>(context, listen: false);

    await locationFromAddress(place).then((locations) {
      if (locations.isNotEmpty) {
        locatonss = locations[0];
        laat = locatonss!.latitude;
        loon = locatonss!.longitude;
        pr.setLocation(laat, loon);
        print(locations);
      } else {
       print("Failed to get geo");
        
      }
    }).catchError((e) {
      debugPrint(e);
    });
    notifyListeners();
  }

 
}
