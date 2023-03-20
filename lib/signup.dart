import 'package:flutter/material.dart';

import 'appbar/appbar.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
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
              Container(
                  height: 325,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        height: 230,
                        width: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/travling.png"),
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
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                      width: 400,
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: Text("First Name"),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            )),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'First is empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      width: 400,
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: Text("Second Name"),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            )),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Second is empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      width: 400,
                      child: TextFormField(
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
                            return 'Enter a valid email address!';
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
                        decoration: InputDecoration(
                            label: Text("Password"),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            )),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Enter your empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(children: [
                      SizedBox(
                        width: 200,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text("Forgot your Password?"))
                    ]),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO submit
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Appbar()),
                      );
                    }
                  },
                  child: Text("SignUp"),
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
                      label: Text("Gail"),
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
                  Text("You  have an account?"),
                  TextButton(onPressed: () {}, child: Text("Signin Here!"))
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
