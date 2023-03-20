import 'package:flutter/material.dart';

class Empolyees extends StatefulWidget {
  const Empolyees({super.key});

  @override
  State<Empolyees> createState() => _EmpolyeesState();
}

class _EmpolyeesState extends State<Empolyees> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Empolyees_list()),
          );
        },
        child: Container(
          width: 150.0,
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              "Empolyees",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}

class Empolyees_list extends StatelessWidget {
  const Empolyees_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: DataTable(columns: [
            DataColumn(
              label: Text('ID'),
            ),
            DataColumn(
              label: Text('Name'),
            ),
            DataColumn(
              label: Text('Code'),
            ),
            DataColumn(
              label: Text('Quantity'),
            ),
            DataColumn(
              label: Text('Amount'),
            ),
          ], rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Arshik')),
              DataCell(Text('5644645')),
              DataCell(Text('3')),
              DataCell(Text('265\$')),
            ])
          ]),
        ),
      ),
    );
  }
}
