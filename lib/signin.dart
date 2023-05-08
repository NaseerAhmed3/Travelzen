import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/adminpage/adminpage.dart';

import 'package:flutter_application_1/signup.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

final emailcontroller = TextEditingController();
final passwordcontroller = TextEditingController();

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>(); //for storing form state.

//saving form after validation
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  bool value = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                  height: 380,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        height: 290,
                        width: 350,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            // image: NetworkImage(
                            //     "https://images.pexels.com/photos/6307706/pexels-photo-6307706.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                            image: AssetImage("assets/images/image2.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        "Welcome",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Login Here!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  )),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                      width: 400,
                      child: TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          label: Text("Email"),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        validator: (text) {
                          if (!(text!.contains('@')) || text.isEmpty) {
                            return 'Enter Valid Email';
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      width: 400,
                      child: TextFormField(
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          label: Text("Password"),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Enter your password';
                          }
                          // if (text.length < 8) {
                          //   return "Password must has 8 characters";
                          // }
                          // if (!text.contains(RegExp(r'[A-Z]'))) {
                          //   return "Password must has uppercase";
                          // }
                          // if (!text.contains(RegExp(r'[0-9]'))) {
                          //   return "Password must has digits";
                          // }
                          // if (!text.contains(RegExp(r'[a-z]'))) {
                          //   return "Password must has lowercase";
                          // }
                          // if (!text.contains(RegExp(r'[#?!@$%^&*-]'))) {
                          //   return "Password must has special characters";
                          // }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      width: 400,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text("Forgot your Password?"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // TODO submit
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailcontroller.text.trim(),
                            password: passwordcontroller.text.trim());

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Adminpage()),
                        );
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  child: Text("Sign in"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 50),
                    backgroundColor: Color.fromARGB(255, 53, 51, 182),
                  )),
              SizedBox(
                height: 30,
              ),
              Text("OR"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.email),
                      label: Text("Gmail"),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 50),
                          backgroundColor: Colors.black)),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.facebook),
                      label: Text("Facebook"),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 50),
                          backgroundColor: Colors.black)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: Text("Signup Here!"))
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
