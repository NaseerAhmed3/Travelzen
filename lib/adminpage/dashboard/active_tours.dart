import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/data_container.dart';

class ActiveTours extends StatefulWidget {
  const ActiveTours({super.key});

  @override
  State<ActiveTours> createState() => _ActiveToursState();
}

class _ActiveToursState extends State<ActiveTours> {
  final List<String> entries = <String>['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber,
        height: 500,
        width: double.infinity,
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return DataContainer(
                  tour: 'Couple Tour',
                  area: 'Naran',
                  customer_count: 50,
                  manager_name: 'Naseer Ahmed',
                  vehicle: 'Coaster',
                  reg_num: 'LES-1055',
                  begin_date: '10-3-2023',
                  end_date: '20-3-2023');
            }));
  }
}
