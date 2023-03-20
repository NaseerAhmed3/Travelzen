import 'package:flutter/material.dart';

class Vehicals extends StatefulWidget {
  const Vehicals({super.key});

  @override
  State<Vehicals> createState() => _VehicalsState();
}

class _VehicalsState extends State<Vehicals> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Vehicals_list()),
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
              "Vehicals",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}

class Vehicals_list extends StatelessWidget {
  const Vehicals_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
