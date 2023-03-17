import 'package:flutter/material.dart';
import 'package:flutter_application_1/adminpage.dart';
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
      home: Adminpage(),
      // home: Signin(),
      // home: Signup(),
    );
  }
}
