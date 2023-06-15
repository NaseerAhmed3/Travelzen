import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_tours/pages/admin/tour_detail.dart';
import 'package:the_tours/uicomponents/widgets.dart';

const List<String> expenseType = <String>['Fuel', 'Food', 'Hotel', 'Others'];

class AddExpense extends StatefulWidget {
  final Map<String, dynamic> detail;
  final List<Map<String, dynamic>> expenseList;

  const AddExpense(
      {super.key, required this.detail, required this.expenseList});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();
  String expenseValue = expenseType.first;

  _addExpense() {
    if (widget.expenseList.isNotEmpty) {
      if (widget.expenseList
          .every((element) => element["type"] != expenseValue)) {
        _add();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Expense already added "),
          ),
        );
      }
    } else {
      _add();
    }
  }

  _add() {
    FirebaseFirestore.instance.collection('expenses').doc().set({
      'tour_id': widget.detail["id"],
      'name': name.text,
      'type': expenseValue,
      'amount': amount.text,
      'createdBy': FirebaseAuth.instance.currentUser?.uid ?? "",
    }).then((value) => {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Expense added successfully"),
            ),
          ),
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TourDetail(detail: widget.detail),
            ),
          )
        });
  }

  _endtour() {
    FirebaseFirestore.instance
        .collection('tour')
        .doc(widget.detail['id'])
        .update({
      'is_active': 0,
    }).then((value) => {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Tour Ended successfully"),
                ),
              ),
              Navigator.pop(context),
              Navigator.pop(context)
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Expense"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                  labelText: "Add Expense Name",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextFormField(
                controller: amount,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  labelText: "Add Expense Mount",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: const Color.fromARGB(255, 221, 221, 221),
                  filled: true,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 60,
              width: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 221, 221, 221),
              ),
              child: DropdownButton<String>(
                value: expenseValue,
                borderRadius: BorderRadius.circular(18),
                dropdownColor: mycolor,

                icon: const Icon(Icons.arrow_drop_down_sharp),
                elevation: 16,
                style: const TextStyle(color: Colors.white),
                // underline: Container(
                //   height: 2,
                //   color: Colors.deepPurpleAccent,
                // ),

                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    expenseValue = value!;
                  });
                },
                items:
                    expenseType.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black),
                      selectionColor: Colors.black,
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(230, 6, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: mycolor),
                onPressed: () {
                  _addExpense();
                },
                child: const Text("Add Expense"),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(230, 0, 6, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: mycolor),
                onPressed: () {
                  _endtour();
                },
                child: const Text("End Tour !"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
