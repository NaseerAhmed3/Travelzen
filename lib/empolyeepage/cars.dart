import 'package:flutter/material.dart';

class cars extends StatefulWidget {
  const cars({super.key});

  @override
  State<cars> createState() => _carsState();
}

class _carsState extends State<cars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Cars"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Title(
                color: Colors.black,
                child: Text(
                  "Header",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Text1",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                "Text2",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                "Text3",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
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
          ])),
    );
  }
}
