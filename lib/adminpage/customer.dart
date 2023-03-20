import 'package:flutter/material.dart';

class Customer extends StatefulWidget {
  const Customer({super.key});

  @override
  State<Customer> createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Customer_list()),
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
              "Customer",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}

class Customer_list extends StatelessWidget {
  const Customer_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
