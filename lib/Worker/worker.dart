
// // class -different,method
// //instance - different data;

import 'dart:convert';

import 'package:http/http.dart';

class worker {
  String? location;
  //constructor
  worker({this.location}) {
    location = this.location;
  }
  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;
  //method
  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=bf8270ef823a5ef8f148b497e30ff762#'));
      Map data = jsonDecode(response.body);
      //getting Temp,Humidiy
      //print(data);
      Map temp_data = data['main'];
      double getHumidity = temp_data['humidity'];
      double getTemp = temp_data['temp'] - 273.15;

      //getting speed of air
      Map wind = data['wind'];
      double getAir_speed = wind['speed'] / 0.27777777777778;

      //getting description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      // String getMain_des = weather_main_data['description'];
      String getDesc = weather_main_data['description'];
      //assigning values
      temp = getTemp.toString();
      humidity = getHumidity.toString();

      air_speed = getAir_speed.toString();
      description = getDesc;
      main = getMain_des;
      icon = weather_main_data['icon'].toString();
      
      
    } catch (e) {
      temp = "Can't Find Data";
      humidity = "Can't Find Data";
      air_speed = "Can't Find Data";
      description = "Can't Find Data";
      main = "Can't Find Data";
      icon = "03n";
    }
  }
}
