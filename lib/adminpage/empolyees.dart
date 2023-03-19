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
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => const Signup()),
          // );
        },
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
    );
  }
}
