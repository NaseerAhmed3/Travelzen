import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../uicomponents/widgets.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController emailaddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cnic = TextEditingController();

  String? gender;

  _addEmployee() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailaddress.text, password: password.text)
        .then((value) => {
              postDetailsToFirestore(value, emailaddress.text, "employee"),
            });
  }

  postDetailsToFirestore(UserCredential user, String email, String role) async {
    if (user.user != null) {
      CollectionReference ref =
          FirebaseFirestore.instance.collection('employee_info');
      ref.doc(user.user?.uid).set({
        'name': name.text,
        'email': emailaddress.text,
        'age': age.text,
        'address': address.text,
        'gender': gender,
        'cnic': cnic.text,
        'createdBy': FirebaseAuth.instance.currentUser?.uid ?? ""
      }).then((value) {
        FirebaseFirestore.instance
            .collection('user_roles')
            .doc(user.user!.uid)
            .set({'email': emailaddress.text, 'role': role}).then(
          (value) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Employee Added successfully"),
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Employee"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextFormField(
                controller: name,
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
                  labelText: "Full Name",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextFormField(
                controller: cnic,
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
                  labelText: "CNIC",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextFormField(
                controller: age,
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
                  labelText: "Age",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextFormField(
                controller: address,
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
                  labelText: "Adress",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextFormField(
                controller: emailaddress,
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
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextFormField(
                controller: password,
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
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 260, 0),
              child: Text(
                "Gender",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RadioListTile(
              title: const Text("Male"),
              value: "male",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Female"),
              value: "female",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: mycolor),
                  onPressed: () {
                    _addEmployee();
                  },
                  child: const Text("Procced")),
            )
          ],
        ),
      ),
    );
  }
}
