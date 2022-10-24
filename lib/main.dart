//import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mausam/Acitivity/loading.dart';
import 'package:mausam/Acitivity/location.dart';
import 'Acitivity/home.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: "MASUAM",
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => Loading(),
          "/home": (context) => Home(),
          "/loading": (context) => Loading(),
        },
      ),
    ),
  );
}
