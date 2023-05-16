import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/adminpage/adminpage.dart';
import 'package:flutter_application_1/signin.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  bool value = false;
  @override
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
                  height: 325,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        height: 230,
                        width: 350,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/image2.jpg"),
                          ),
                        ),
                      ),
                      Text(
                        "Welcome",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Login Here!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  )),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                      width: 400,
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: const Text("First Name"),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
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
                            label: const Text("Second Name"),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
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
                        controller: email,
                        decoration: InputDecoration(
                          label: const Text("Email"),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
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
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      width: 400,
                      child: TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                            label: const Text("Password"),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            )),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Enter your password';
                          }
                          if (text.length < 8) {
                            return "Password must has 8 characters";
                          }
                          if (!text.contains(RegExp(r'[A-Z]'))) {
                            return "Password must has uppercase";
                          }
                          if (!text.contains(RegExp(r'[0-9]'))) {
                            return "Password must has digits";
                          }
                          if (!text.contains(RegExp(r'[a-z]'))) {
                            return "Password must has lowercase";
                          }
                          if (!text.contains(RegExp(r'[#?!@$%^&*-]'))) {
                            return "Password must has special characters";
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
                            child: const Text("Forgot your Password?"),
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
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email.text.trim(),
                                password: password.text.trim());

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Adminpage()),
                        );
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    backgroundColor: const Color.fromARGB(255, 53, 51, 182),
                  ),
                  child: const Text("SignUp")),
              const SizedBox(
                height: 30,
              ),
              const Text("OR"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.email),
                      label: const Text("Gmail"),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 50),
                          backgroundColor: Colors.black)),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.facebook),
                      label: const Text("Facebook"),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 50),
                          backgroundColor: Colors.black)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You  have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Signin()),
                        );
                      },
                      child: const Text("Signin Here!"))
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
