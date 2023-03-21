import 'package:flutter/material.dart';
import 'package:flutter_application_1/empolyeepage/cars.dart';
import 'package:flutter_application_1/empolyeepage/resturants.dart';
import 'package:flutter_application_1/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Appbar(),
      // home: Adminpage(),
      home: Signin(),
      // home: Signup(),
      // home: cars(),
      // home: Resturants(),
    );
  }
}
