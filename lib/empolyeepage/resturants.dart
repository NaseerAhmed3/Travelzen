import 'package:flutter/material.dart';
import 'package:flutter_application_1/appbar/appbar.dart';

class Resturants extends StatefulWidget {
  const Resturants({super.key});

  @override
  State<Resturants> createState() => _ResturantsState();
}

class _ResturantsState extends State<Resturants> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text(" Resturant"),
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
        height: double.infinity,
        width: double.infinity,
        child: Center(
            child: ListView(
          padding: const EdgeInsets.all(15),
          children: <Widget>[
            Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                gradient: LinearGradient(
                    colors: [Colors.amber, Colors.red],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red,
                    offset: Offset(10, 20),
                    blurRadius: 30,
                  )
                ],
              ),
              child: const Center(child: Text('Entry A')),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                gradient: LinearGradient(
                    colors: [Colors.amber, Colors.red],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red,
                    offset: Offset(10, 20),
                    blurRadius: 30,
                  )
                ],
              ),
              child: const Center(child: Text('Entry B')),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                gradient: LinearGradient(
                    colors: [Colors.amber, Colors.red],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red,
                    offset: Offset(10, 20),
                    blurRadius: 30,
                  )
                ],
              ),
              child: const Center(child: Text('Entry C')),
            ),
          ],
        )),
      ),
    );
  }
}
