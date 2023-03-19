import 'package:flutter/material.dart';

import 'package:flutter_application_1/adminpage/adminpage.dart';

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/13720883/pexels-photo-13720883.jpeg"),
          ),
        ],
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
      body: Adminpage(),
    );
  }
}
