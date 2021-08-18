import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map info = {};
    info = ModalRoute.of(context)!.settings.arguments as Map; 
    //Map<dynamic,dynamic>? info= ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home acitivity'),
      ),
      body: Column(children: <Widget>[
        FloatingActionButton(
          onPressed: () {},
        ),
        Text(info["temp_value"])
      ]),
    );
  }
}
















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





  