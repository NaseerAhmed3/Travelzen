import 'package:flutter/material.dart';

class Payment_info extends StatefulWidget {
  const Payment_info({super.key});

  @override
  State<Payment_info> createState() => _Payment_infoState();
}

class _Payment_infoState extends State<Payment_info> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Payment_list()),
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
              "Payment Info",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}

class Payment_list extends StatelessWidget {
  const Payment_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
