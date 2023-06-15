import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_tours/sign_in_page.dart';

import 'uicomponents/widgets.dart';

class SignUpPage extends StatefulWidget {
  final String role;
  const SignUpPage({super.key, required this.role});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('asset/singin.jpg'),
                      fit: BoxFit.cover)),
            ),
            Text(
              "Sign Up Here",
              style: TextStyle(color: Color(0xff47B5FF), fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                  labelText: "Your Name",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email cannot be empty";
                  }
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return ("Please enter a valid email");
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                  labelText: "Your Email",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email cannot be empty";
                  }
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return ("Please enter a valid email");
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                  labelText: "Your Password",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextFormField(
                controller: confirmpassController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                  labelText: "Confirm your Password",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: mycolor),
                onPressed: () {
                  signUp(emailController.text, passwordController.text,
                      widget.role);
                },
                child: const Text("SignUp"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("If You have an account"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInPage(
                          role: widget.role,
                        ),
                      ),
                    );
                  },
                  child: const Text("SignIn"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void signUp(String email, String password, String role) async {
    const CircularProgressIndicator();
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore(email, role)});
  }

  postDetailsToFirestore(String email, String role) async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      if (role == 'user') {
        CollectionReference ref =
            FirebaseFirestore.instance.collection('user_info');
        ref.doc(user.uid).set({
          'name': nameController.text,
          'email': emailController.text,
        });
      } else if (role == "admin") {
        CollectionReference ref =
            FirebaseFirestore.instance.collection('admin_info');
        ref
            .doc(user.uid)
            .set({'name': nameController.text, 'email': emailController.text});
      }
      CollectionReference ref =
          FirebaseFirestore.instance.collection('user_roles');
      ref.doc(user.uid).set({'email': emailController.text, 'role': role});

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignInPage(
            role: role,
          ),
        ),
      );
    }
  }
}
