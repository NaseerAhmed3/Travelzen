import 'package:flutter/material.dart';
import 'package:flutter_application_1/adminpage/customer.dart';
import 'package:flutter_application_1/adminpage/empolyees.dart';
import 'package:flutter_application_1/adminpage/paymentinfo.dart';
import 'package:flutter_application_1/adminpage/vehicals.dart';

class listview extends StatefulWidget {
  const listview({super.key});

  @override
  State<listview> createState() => _listviewState();
}

class _listviewState extends State<listview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          // Empolyees
          Empolyees(),
          //  vehicals
          Vehicals(),
          // Customer
          Customer(),
          //  payment info
          Payment_info(),
        ],
      ),
    );
  }
}
