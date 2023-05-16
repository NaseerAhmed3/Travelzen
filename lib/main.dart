import 'package:flutter/material.dart';
import 'package:flutter_application_1/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'adminpage/adminpage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
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
      theme: ThemeData(
        primaryColor: const Color.fromARGB(1, 159, 190, 238),
      ),
      // home: Appbar(),
      home: const Adminpage(),
      // home: Mainclass(),
      // home: Signup(),
      // home: cars(),
      // home: Resturants(),
    );
  }
}

class Mainclass extends StatelessWidget {
  const Mainclass({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return const Signin();
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return Center(
        //     child: CircularProgressIndicator(),
        //   );
        // } else if (snapshot.hasError) {
        //   return Center(
        //     child: Text("Something went wrong!"),
        //   );
        // } else if (snapshot.hasData) {
        //   print("its ok");
        //   return Appbar();
        // } else {
        //   print("its wrong");

        //   return Signin();
        // }
      },
    );
  }
}
