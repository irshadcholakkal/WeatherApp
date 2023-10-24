// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget WeatherIcons(data) {
  switch (data) {
    case 'scattered clouds':
      return Lottie.asset("Assets/ScatteredCloud.json", height: 110);

    case 'clear sky':
      return Lottie.asset("Assets/ClearSky.json", height: 110);
    case 'few clouds':
      return Lottie.asset("Assets/Fewclouds.json", height: 110);
    case 'broken clouds':
      return Lottie.asset("Assets/ScatteredCloud.json", height: 110);

    case 'shower rain':
      return Lottie.asset("Assets/ShowerRain.json", height: 110);
    case 'rain':
      return Lottie.asset("Assets/Rain.json", height: 110);
    case 'thunderstorm':
      return Lottie.asset("Assets/ThunderStrom.json", height: 110);
    case 'snow':
      return Lottie.asset("Assets/3VCbaUGa4s.json", height: 110);
    case 'mist':
      return Lottie.asset("Assets/AbYcFy3KgC.json", height: 110);

    case 'thunderstorm with light rain':
      return Lottie.asset("Assets/ThunderStrom.json", height: 110);
    case 'thunderstorm with rain':
      return Lottie.asset("Assets/ThunderStrom.json", height: 110);
    case 'thunderstorm with heavy rain':
      return Lottie.asset("Assets/ThunderStrom.json", height: 110);
    case 'light thunderstorm':
      return Lottie.asset("Assets/ThunderStrom.json", height: 110);
    case 'heavy thunderstorm':
      return Lottie.asset("Assets/ThunderStrom.json", height: 110);
    case 'ragged thunderstorm':
      return Lottie.asset("Assets/ThunderStrom.json", height: 110);
    case 'thunderstorm with light drizzle':
      return Lottie.asset("Assets/ThunderStrom.json", height: 110);
    case 'thunderstorm with heavy drizzle	':
      return Lottie.asset("Assets/ThunderStrom.json", height: 110);

    case 'light intensity drizzle':
      return Lottie.asset("Assets/ShowerRain.json", height: 110);
    case 'drizzle':
      return Lottie.asset("Assets/ShowerRain.json", height: 110);
    case 'heavy intensity drizzle':
      return Lottie.asset("Assets/ShowerRain.json", height: 110);
    case 'light intensity drizzle rain':
      return Lottie.asset("Assets/ShowerRain.json", height: 110);
    case 'drizzle rain':
      return Lottie.asset("Assets/ShowerRain.json", height: 110);
    case 'heavy intensity drizzle rain':
      return Lottie.asset("Assets/ShowerRain.json", height: 110);
    case 'shower rain and drizzle':
      return Lottie.asset("Assets/ShowerRain.json", height: 110);
    case 'heavy shower rain and drizzle':
      return Lottie.asset("Assets/ShowerRain.json", height: 110);
    case 'shower drizzle':
      return Lottie.asset("Assets/ShowerRain.json", height: 110);

    case 'light rain':
      return Lottie.asset("Assets/Rain.json", height: 110);
    case 'moderate rain':
      return Lottie.asset("Assets/Rain.json", height: 110);
    case 'heavy intensity rain':
      return Lottie.asset("Assets/Rain.json", height: 110);
    case 'very heavy rain':
      return Lottie.asset("Assets/Rain.json", height: 110);
    case 'extreme rain':
      return Lottie.asset("Assets/Rain.json", height: 110);
    case 'freezing rain':
      return Lottie.asset("Assets/3VCbaUGa4s.json", height: 110);
    case 'light intensity shower rain':
      return Lottie.asset("Assets/ShowerRain.json", height: 110);
    case 'heavy intensity shower rain':
      return Lottie.asset("Assets/ShowerRain.json", height: 110);
    case 'ragged shower rain':
      return Lottie.asset("Assets/ShowerRain.json", height: 110);

    case 'light snow':
      return Lottie.asset("Assets/3VCbaUGa4s.json", height: 110);
    case 'heavy snow':
      return Lottie.asset("Assets/3VCbaUGa4s.json", height: 110);
    case 'sleet':
      return Lottie.asset("Assets/3VCbaUGa4s.json", height: 110);
    case 'light shower sleet':
      return Lottie.asset("Assets/3VCbaUGa4s.json", height: 110);
    case 'shower sleet':
      return Lottie.asset("Assets/3VCbaUGa4s.json", height: 110);
    case 'light rain and snow':
      return Lottie.asset("Assets/3VCbaUGa4s.json", height: 110);
    case 'rain and snow':
      return Lottie.asset("Assets/3VCbaUGa4s.json", height: 110);
    case 'light shower snow':
      return Lottie.asset("Assets/3VCbaUGa4s.json", height: 110);
    case 'shower snow':
      return Lottie.asset("Assets/3VCbaUGa4s.json", height: 110);
    case 'heavy shower snow':
      return Lottie.asset("Assets/3VCbaUGa4s.json", height: 110);

    case 'smoke':
      return Lottie.asset("Assets/AbYcFy3KgC.json", height: 110);

    case 'haze':
      return Lottie.asset("Assets/AbYcFy3KgC.json", height: 110);

    case '':
      return Lottie.asset("Assets/AbYcFy3KgC.json", height: 110);

    case 'sand/dust whirls':
      return Lottie.asset("Assets/AbYcFy3KgC.json", height: 110);

    case 'fog':
      return Lottie.asset("Assets/AbYcFy3KgC.json", height: 110);

    case 'sand':
      return Lottie.asset("Assets/AbYcFy3KgC.json", height: 110);

    case 'dust':
      return Lottie.asset("Assets/AbYcFy3KgC.json", height: 110);

    case 'volcanic ash':
      return Lottie.asset("Assets/AbYcFy3KgC.json", height: 110);

    case 'squalls':
      return Lottie.asset("Assets/AbYcFy3KgC.json", height: 110);

    case 'tornado':
      return Lottie.asset("Assets/AbYcFy3KgC.json", height: 110);

    case 'few clouds: 11-25%':
      return Lottie.asset("Assets/ScatteredCloud.json", height: 110);
    case 'scattered clouds: 25-50%	':
      return Lottie.asset("Assets/ScatteredCloud.json", height: 110);

    case 'broken clouds: 51-84%':
      return Lottie.asset("Assets/ScatteredCloud.json", height: 110);

    case 'overcast clouds: 85-100%':
      return Lottie.asset("Assets/ScatteredCloud.json", height: 110);

    case 'overcast clouds':
      return Lottie.asset("Assets/ScatteredCloud.json", height: 110);
  }

  return const Text("loading...");
}
