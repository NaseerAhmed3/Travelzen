import 'package:flutter/material.dart';
import 'package:flutter_application_1/adminpage/dashboard/hotels.dart';
// import 'package:flutter_application_1/adminpage/dashboard/map_routs.dart';
import 'package:flutter_application_1/adminpage/dashboard/active_tours.dart';
import 'package:flutter_application_1/adminpage/dashboard/resturants.dart';
// import 'package:flutter_application_1/adminpage/dashboard/timetable.dart';
// import 'package:flutter_application_1/adminpage/dashboard/touristpoint.dart';
import 'package:flutter_application_1/adminpage/listview.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "THE TOURS",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            // CircleAvatar(
            //   radius: 25,
            //   backgroundImage: NetworkImage(
            //       "https://images.pexels.com/photos/13720883/pexels-photo-13720883.jpeg"),
            // ),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  height: 50,
                  child: listview(),
                ),
              ),
              Container(
                  color: Colors.amber,
                  height: 500,
                  width: double.infinity,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 500,
                          color: Colors.amber[colorCodes[index]],
                          child: Center(child: Text('Entry ${entries[index]}')),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
