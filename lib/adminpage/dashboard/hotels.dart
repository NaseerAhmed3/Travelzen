// ignore_for_file: camel_case_types, dead_code

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Hotels extends StatefulWidget {
  const Hotels({super.key});

  @override
  State<Hotels> createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Hotels_list()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[100],
        child: const Text("Hotels"),
      ),
    );
  }
}

// output data class
class Hotels_list extends StatefulWidget {
  const Hotels_list({super.key});

  @override
  State<Hotels_list> createState() => _Hotels_listState();
}

String data = '';
String id = '';
final hotel_name = TextEditingController();
final address = TextEditingController();
final r_contact = TextEditingController();
final rooms = TextEditingController();

class _Hotels_listState extends State<Hotels_list> {
  Future<String> getData() async {
    await FirebaseFirestore.instance
        .collection('travelzen')
        .doc('Hotels1')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        data = documentSnapshot.data().toString();
      } else {
        print('Document does not exist on the database');
      }
    });
    return data;
  }

  Future createUser(
      {required String hotel_name, address, r_contact, rooms}) async {
    final docs = await FirebaseFirestore.instance.collection('travelzen').doc();
    final json = {
      'id': docs.id,
      'Hotel Name': hotel_name,
      'Address': address,
      'r_contact': r_contact,
      'rooms': rooms,
    };
    await docs.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Container(
          color: Colors.amberAccent,
          height: 500,
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Hotel Name"),
                controller: hotel_name,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Hotel Address"),
                controller: address,
              ),
              TextField(
                controller: r_contact,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Reception Contact"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: rooms,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "No of Rooms"),
                keyboardType: TextInputType.number,
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  final Hotel_Name = hotel_name.text;
                  final Address = address.text;
                  final Reception_contact = r_contact.text;
                  final Rooms = rooms.text;
                  createUser(
                    hotel_name: Hotel_Name,
                    address: Address,
                    r_contact: Reception_contact,
                    rooms: Rooms,
                  );
                },
              ),
              FutureBuilder<String>(
                future: getData(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data.toString());
                    } else {
                      return Text('No data available');
                    }
                  } else {
                    return Center(child: Text(data));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
