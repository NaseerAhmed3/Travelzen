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
    return Container(
      // color: Colors.amber,
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 50,
                child: listview(),
              ),
            ),
            Container(
              height: 650,
              width: double.infinity,
              child: GridView.count(
                padding: const EdgeInsets.all(8),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                childAspectRatio: 4,
                children: <Widget>[
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
    );
  }
}
