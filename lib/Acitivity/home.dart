import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 1;
  void timer() {
    Future.delayed(Duration(seconds: 2), () {
      print("Alram is ringing");
    });
    print("you can do other staff");
  }

  @override
  void initState() {
    super.initState();
    timer();
    print("this is init state");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home acitivity'),
      ),
      body: Column(children: <Widget>[
        FloatingActionButton(
          onPressed: () => setState(() {
            counter += 1;
          }),
        ),
        Text("$counter")
      ]),
    );
  }
}
