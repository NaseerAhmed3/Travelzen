import 'package:flutter/material.dart';
import 'package:flutter_application_1/empolyeepage/cars.dart';
import 'package:flutter_application_1/empolyeepage/resturants.dart';
import 'package:flutter_application_1/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
// Ideal time to initialize
// await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//...
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
