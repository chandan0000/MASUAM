import 'dart:js';

import 'package:flutter/material.dart';
import 'package:mausam/Acitivity/loading.dart';
import 'package:mausam/Acitivity/location.dart';
import 'Acitivity/home.dart';
void main() {
  runApp(MaterialApp(
  
    debugShowCheckedModeBanner: false,
    
    routes: {
      "/":(context) => Loading(),
      "/home":(context)=>Home(),
      
    },
    
    ),
  );
}
