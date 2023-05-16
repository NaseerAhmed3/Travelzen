import 'package:flutter/material.dart';

class DataContainer extends StatefulWidget {
  final tour;
  final area;
  final customer_count;
  final manager_name;
  final vehicle;
  final reg_num;
  final begin_date;
  final end_date;
  const DataContainer({
    super.key,
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
  State<DataContainer> createState() => _DataContainerState();
}

class _DataContainerState extends State<DataContainer> {
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
            children: [
              Text(widget.tour),
              Text(widget.customer_count.toString())
            ],
          ),
          Row(
            children: [const Text('Location'), Text(widget.area)],
          ),
          Row(
            children: [const Text('Tour Agent'), Text(widget.manager_name)],
          ),
          Row(
            children: [const Text('Vehicle'), Text(widget.vehicle.toString())],
          ),
          Row(
            children: [const Text('Reg Num'), Text(widget.reg_num.toString())],
          ),
          Row(
            children: [
              const Text('Begin_Date'),
              Text(widget.begin_date.toString())
            ],
          ),
          Row(
            children: [
              const Text('End_Date'),
              Text(widget.end_date.toString())
            ],
          ),
        ],
      ),
    );
  }
}
