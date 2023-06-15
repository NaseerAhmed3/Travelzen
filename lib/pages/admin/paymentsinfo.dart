import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Paymentsinfo extends StatefulWidget {
  const Paymentsinfo({super.key});

  @override
  State<Paymentsinfo> createState() => _PaymentsinfoState();
}

class _PaymentsinfoState extends State<Paymentsinfo> {
  List<Map<String, dynamic>> finalExpenseList = [];
  List<Map<String, dynamic>> expenseList = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection('expenses')
          .where('createdBy', isEqualTo: user.uid)
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> newSnapshot) {
        if (newSnapshot.docs.isNotEmpty) {
          for (var docs in newSnapshot.docs) {
            expenseList.add(docs.data());
            // tours.add({
            //   ...docs.data(),
            //   "id": docs.id,
            // });
            setState(() {});
          }
        }
        finalExpenseList = expenseList;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  "Expense Name",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 70,
                child: Text(
                  "Amount",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 2,
          ),
          Visibility(
            visible: !isLoading && finalExpenseList.isNotEmpty,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: finalExpenseList
                    .map((e) => Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 18, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e["name"],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(e["amount"]),
                          ],
                        )))
                    .toList(),
              ),
            ),
          ),
        ],

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SizedBox(
        //       width: 100,
        //       child: Text(
        //         "$expenseList[name]",
        //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        //       ),
        //     ),
        //     Row(
        //       children: [
        //         Container(
        //           width: 70,
        //           decoration: BoxDecoration(
        //               border: Border(right: BorderSide(), left: BorderSide())),
        //           child: Center(child: Text("Expenses")),
        //         ),
        //         Container(
        //           width: 50,
        //           decoration:
        //               BoxDecoration(border: Border(right: BorderSide())),
        //           child: Center(child: Text("Income")),
        //         ),
        //         Container(
        //           decoration:
        //               BoxDecoration(border: Border(right: BorderSide())),
        //           width: 50,
        //           child: Center(child: Text("Profit")),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        // TourPayments(),
      ),
    ));
  }
}

Widget TourPayments() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: 100,
        child: Text(
          "Naran",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
                border: Border(right: BorderSide(), left: BorderSide())),
            child: Center(child: Text("1000")),
          ),
          Container(
            width: 50,
            decoration: BoxDecoration(border: Border(right: BorderSide())),
            child: Center(child: Text("200000")),
          ),
          Container(
            decoration: BoxDecoration(border: Border(right: BorderSide())),
            width: 50,
            child: Center(child: Text("-100")),
          ),
        ],
      ),
    ],
  );
}
