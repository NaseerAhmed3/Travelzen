import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_tours/pages/admin/admin.dart';

import '../../uicomponents/widgets.dart';

class Addtours extends StatefulWidget {
  const Addtours({super.key});

  @override
  State<Addtours> createState() => _AddtoursState();
}

class _AddtoursState extends State<Addtours> {
  TextEditingController tourType = TextEditingController();
  TextEditingController destination = TextEditingController();
  TextEditingController agentName = TextEditingController();
  TextEditingController beginFrom = TextEditingController();
  TextEditingController numberOfTourist = TextEditingController();
  TextEditingController vehicleNumber = TextEditingController();
  TextEditingController vehiclenum = TextEditingController();
  TextEditingController beginDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  _addTour() {
    FirebaseFirestore.instance.collection('tour').doc().set({
      'tour_type': tourType.text,
      'destination': destination.text,
      'begin_from': beginFrom.text,
      'agent_name': agentName.text,
      'no_of_tourist': numberOfTourist.text,
      'vehicle_no': vehicleNumber.text,
      'vehicle_num': vehiclenum.text,
      'is_active': 1,
      'begin_date': beginDate.text.isNotEmpty
          ? DateTime.parse(beginDate.text)
          : DateTime.now(),
      'end_date': endDate.text.isNotEmpty
          ? DateTime.parse(endDate.text)
          : DateTime.now(),
      'createdBy': FirebaseAuth.instance.currentUser?.uid ?? "",
    }).then((value) => {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Tour added successfully"),
            ),
          ),
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Admin(),
            ),
          )
        });
  }

  _beginDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2901),
    );
    if (context.mounted) {}
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedDate != null) {
      if (pickedTime != null) {
        pickedDate = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      }
    }

    beginDate.text = pickedDate.toString();
    setState(() {});
  }

  _endDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2901),
    );
    if (context.mounted) {}
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedDate != null) {
      if (pickedTime != null) {
        pickedDate = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      }
    }

    endDate.text = pickedDate.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Tours"),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: TextFormField(
                controller: tourType,
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
                  labelText: "Tour Type",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: TextFormField(
                controller: destination,
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
                  labelText: "Destination",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),

            // For example tourist start journy from karachi or Islamabad etc
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: TextFormField(
                controller: beginFrom,
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
                  labelText: 'Begin From',
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: TextFormField(
                controller: agentName,
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
                  labelText: "Agent Name",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: TextFormField(
                controller: numberOfTourist,
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
                  labelText: "Number of Tourist",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: TextFormField(
                controller: vehiclenum,
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
                  labelText: "Vehical Name",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: TextFormField(
                controller: vehicleNumber,
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
                  labelText: "Vehicals Number",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: TextFormField(
                  controller: beginDate,
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
                    labelText: "Date of Begin",
                    prefixIcon: Icon(Icons.calendar_today),
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: const Color.fromARGB(255, 221, 221, 221),
                    filled: true,
                  ),
                  onTap: () {
                    _beginDate();
                  }),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: TextFormField(
                  controller: endDate,
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
                    labelText: "Date of End",
                    prefixIcon: Icon(Icons.calendar_today),
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: const Color.fromARGB(255, 221, 221, 221),
                    filled: true,
                  ),
                  onTap: () {
                    _endDate();
                  }),
            ),
            SizedBox(
              height: 20,
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
                  _addTour();
                },
                child: const Text("Add Tours"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
