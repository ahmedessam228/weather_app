import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel {
  String  date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel({required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName});

  factory WeatherModel.fromjeson(dynamic data)
  {
    var jesonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: data['location']['localtime'],
        temp: jesonData['avgtemp_c'],
        maxTemp: jesonData['maxtemp_c'],
        minTemp: jesonData['mintemp_c'],
        weatherStateName: jesonData['condition']['text']);
  }

  @override
  String toString()
  {
    return 'temp =$temp  mintemp=$minTemp  date=$date';
  }

  String getImage(){
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ) {
     return 'assets/images/clear.png';
   } else if (

   weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
     return 'assets/images/snow.png';
   } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||    weatherStateName == 'Partly cloudy' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
     return 'assets/images/cloudy.png';
   } else if (weatherStateName == 'Patchy rain possible' ||
       weatherStateName == 'Heavy Rain' ||
       weatherStateName == 'Showers	') {
     return 'assets/images/rainy.png';
   } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
     return 'assets/images/thunderstorm.png';
   } else {
     return 'assets/images/clear.png';
   }

  }

  MaterialColor getThemeColor(){
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ) {
      return Colors.orange; ;
    } else if (

    weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||    weatherStateName == 'Partly cloudy' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }


  }
}
