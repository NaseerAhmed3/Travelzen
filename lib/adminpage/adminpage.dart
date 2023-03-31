import 'package:flutter/material.dart';
import 'package:flutter_application_1/adminpage/dashboard/hotels.dart';
import 'package:flutter_application_1/adminpage/dashboard/map_routs.dart';
import 'package:flutter_application_1/adminpage/dashboard/ongoing_trips.dart';
import 'package:flutter_application_1/adminpage/dashboard/resturants.dart';
import 'package:flutter_application_1/adminpage/dashboard/timetable.dart';
import 'package:flutter_application_1/adminpage/dashboard/touristpoint.dart';
import 'package:flutter_application_1/adminpage/listview.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                height: 900,
                // color: Colors.amber,
                width: double.infinity,
                child: GridView.count(
                  padding: const EdgeInsets.all(8),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 1,
                  childAspectRatio: 4,
                  children: const <Widget>[
                    // Hotels
                    Hotels(),
                    // Resturant
                    Restursnts(),
                    //  Tourist point
                    Toutist_point(),
                    // Map Routs
                    Map_routs(),
                    // Ongoing Trip
                    Ongoing_trips(),
                    // TimeTable
                    Timetable(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
