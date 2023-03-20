import 'package:flutter/material.dart';

class Ongoing_trips extends StatefulWidget {
  const Ongoing_trips({super.key});

  @override
  State<Ongoing_trips> createState() => _Ongoing_tripsState();
}

class _Ongoing_tripsState extends State<Ongoing_trips> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Trip_list()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[100],
        child: const Text("Ongoing Trips"),
      ),
    );
  }
}

class Trip_list extends StatelessWidget {
  const Trip_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
