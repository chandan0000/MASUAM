import 'dart:convert';
//import 'dart:ffi';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
// import 'package:flutter_weather_icons/flutter_weather_icons.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var city_name = [
      "Mubbai",
      "Delhi",
      "Darbhanga",
      "chandigrah",
      "Indore",
      "Chennai",
      "Lendon",
      "Sri Nagar",
    ];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    //Map info = {};
    //   info = ModalRoute.of(context)!.settings.arguments as Map
    Map<dynamic, dynamic>? info =
        ModalRoute.of(context)!.settings.arguments as Map;
    String? temp = ((info['temp_value']).toString()).substring(0, 4);
    String? icon = info['icon_value'];
    //String? getCity = info['City_Value'];
    String? hum = info['hum_value'];
    String? air = ((info['air_speed_value']).toString()).substring(0, 4);
    String? dec = info['des_value'];
    String? getCity = info['city_value'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: AppBar(
      //     backgroundColor: Colors.yellow,
      //   ),
      // ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: NewGradientAppBar(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.blue.shade200,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          //color: Colors.red,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue.shade800,
                Colors.blue.shade300,
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                //search container

                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),

                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/loading", arguments: {
                        "searchText": searchController.text,
                      });
                    },
                    child: Container(
                      child: Icon(
                        CupertinoIcons.search,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                    ),
                  ),
                  //  Icon(Icons.search),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search  $city',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ]),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.network(
                              'http://openweathermap.org/img/wn/$icon@2x.png'),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                "$dec",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "In  $getCity",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(WeatherIcons.thermometer),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$temp",
                                style: TextStyle(
                                  fontSize: 90,
                                ),
                              ),
                              Text(
                                "°C",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      padding: EdgeInsets.all(26),
                      height: 200,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.wind),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "$air",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("km/hr")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      padding: EdgeInsets.all(26),
                      height: 200,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.humidity),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "$hum",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Percent")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Made by Chandan"),
                    Text("Data Provided by OpenWheathermap.org"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}














    // Map info = {};
    // info = ModalRoute.of(context)!.settings.arguments as Map;
    //Map<dynamic,dynamic>? info= ModalRoute.of(context)!.settings.arguments;


//  getData()  async {
//   await Future.delayed(Duration(seconds: 1), () {
//     username = "chandan";
//   });

//   //print("$username");
// }

// void showData() async {
//  await getData();
//   print("username: $username");
// }

//int counter = 1;
  // void timer() {
  //   Future.delayed(Duration(seconds: 2), () {
  //     print("Alram is ringing");
  //   });
  //   print("you can do other staff");
  // }












  //async -functions start but return some delay
  //future.delayed -Function start after some delayed time

  // var url = Uri.https('mytimeapi.herokuapp.com', '/time/asia/kolkata');
  // void getData() async {
  //   //get data
  //   // Response response = await get(Uri.parse('https://mytimeapi.herokuapp.com/time/asia/kolkata'));
  //   // Map data = jsonDecode(response.body);
  // }





  