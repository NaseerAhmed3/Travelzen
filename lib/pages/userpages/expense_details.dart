import 'package:flutter/material.dart';
import 'package:the_tours/uicomponents/widgets.dart';

class ExpenseDetails extends StatefulWidget {
  final Map<String, dynamic> detail;
  const ExpenseDetails({super.key, required this.detail});

  @override
  State<ExpenseDetails> createState() => _ExpenseDetailsState();
}

class _ExpenseDetailsState extends State<ExpenseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.detail["type"]}"),
        titleTextStyle: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w500, color: mycolor),
        centerTitle: true,
        foregroundColor: mycolor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(children: [
        singleExpense("ExpenseName", "Ammount"),
        Divider(
          thickness: 2,
          endIndent: 18,
          indent: 18,
        ),
        singleExpense("${widget.detail["name"]}", "${widget.detail["amount"]}"),
      ]),
    );
  }
}

Widget singleExpense(String ExpenseName, String Ammount) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: mycolor,
    ),
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ExpenseName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(Ammount)
      ],
    ),
  );
}
