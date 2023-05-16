import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/data_container.dart';

class PreviousTours extends StatefulWidget {
  const PreviousTours({super.key});

  @override
  State<PreviousTours> createState() => _PreviousToursState();
}

final List<String> entries = <String>['A', 'B', 'C'];

class _PreviousToursState extends State<PreviousTours> {
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
              return const DataContainer(
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
