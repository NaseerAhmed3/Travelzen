import 'package:flutter/material.dart';

class Toutist_point extends StatefulWidget {
  const Toutist_point({super.key});

  @override
  State<Toutist_point> createState() => _Toutist_pointState();
}

class _Toutist_pointState extends State<Toutist_point> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Points_list()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[100],
        child: const Text("Tourist point"),
      ),
    );
  }
}

class Points_list extends StatelessWidget {
  const Points_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
