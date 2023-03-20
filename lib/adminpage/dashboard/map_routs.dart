import 'package:flutter/material.dart';

class Map_routs extends StatefulWidget {
  const Map_routs({super.key});

  @override
  State<Map_routs> createState() => _Map_routsState();
}

class _Map_routsState extends State<Map_routs> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Map_list()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[100],
        child: const Text("Routs map"),
      ),
    );
  }
}

class Map_list extends StatelessWidget {
  const Map_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
