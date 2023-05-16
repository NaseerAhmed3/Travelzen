import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  final tour;
  final area;
  int customer_count;
  final manager_name;
  final vehicle;
  final reg_num;
  final begin_date;
  final end_date;
  DataContainer({super.key, 
    required this.tour,
    required this.area,
    required this.customer_count,
    required this.manager_name,
    required this.vehicle,
    required this.reg_num,
    required this.begin_date,
    required this.end_date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          Row(
            children: [Text(tour), Text(customer_count.toString())],
          ),
          Row(
            children: [const Text('Location'), Text(area)],
          ),
          Row(
            children: [const Text('Tour Agent'), Text(manager_name)],
          ),
          Row(
            children: [const Text('Vehicle'), Text(vehicle.toString())],
          ),
          Row(
            children: [const Text('Reg Num'), Text(reg_num.toString())],
          ),
          Row(
            children: [const Text('Begin_Date'), Text(begin_date.toString())],
          ),
          Row(
            children: [const Text('End_Date'), Text(end_date.toString())],
          ),
        ],
      ),
    );
  }
}
