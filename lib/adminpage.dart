import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/signin.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.red,
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
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "Vehicals",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Signin()),
                            );
                          },
                          child: Container(
                            width: 150.0,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "Customer",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "Payment Info",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  height: 700,
                  width: double.infinity,
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[100],
                          child: const Text("He'd have you all unravel at the"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.teal[200],
                        child: const Text('Heed not the rabble'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.teal[300],
                        child: const Text('Sound of screams but the'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.teal[400],
                        child: const Text('Who scream'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.teal[500],
                        child: const Text('Revolution is coming...'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/maponly');
                        },
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          color: Color.fromARGB(255, 139, 185, 223),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
