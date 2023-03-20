import 'package:flutter/material.dart';

class Restursnts extends StatefulWidget {
  const Restursnts({super.key});

  @override
  State<Restursnts> createState() => _RestursntsState();
}

class _RestursntsState extends State<Restursnts> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Resturant_list()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[100],
        child: const Text("Resturants"),
      ),
    );
  }
}

class Resturant_list extends StatelessWidget {
  const Resturant_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
