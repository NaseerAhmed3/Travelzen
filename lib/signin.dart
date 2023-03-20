import 'package:flutter/material.dart';
import 'package:flutter_application_1/appbar/appbar.dart';
import 'package:flutter_application_1/signup.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>(); //for storing form state.

//saving form after validation

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
                  height: 420,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        height: 300,
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
                            return '*';
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
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return '*';
                          }
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO submit
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Appbar()),
                      );
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
