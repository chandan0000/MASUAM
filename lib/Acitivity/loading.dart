import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: <Widget>[
        FlatButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, "/home");
            },
            icon: Icon(Icons.add_to_home_screen),
            label: Text("Goto Home")),
      ]),
    );
  }
}
