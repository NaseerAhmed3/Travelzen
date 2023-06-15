import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_tours/pages/admin/add_expense.dart';
import '../../uicomponents/widgets.dart';
import '../userpages/expense_details.dart';

class TourDetail extends StatefulWidget {
  final Map<String, dynamic> detail;
  const TourDetail({
    super.key,
    required this.detail,
  });

  @override
  State<TourDetail> createState() => _AddtoursState();
}

class _AddtoursState extends State<TourDetail> {
  List<Map<String, dynamic>> expenseMap = [];
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('expenses')
        .where('tour_id', isEqualTo: widget.detail["id"])
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> newSnapshot) {
      if (newSnapshot.docs.isNotEmpty) {
        for (var docs in newSnapshot.docs) {
          expenseMap.add({
            ...docs.data(),
            "id": docs.id,
          });
        }
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // var Constants;
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.detail['destination']}" + "  Tour's Details"),
        titleTextStyle: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w500, color: mycolor),
        centerTitle: true,
        foregroundColor: mycolor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name: " + "${widget.detail['agent_name']}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${widget.detail["no_of_tourist"]} Persons",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        "Vehical Name :",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "${widget.detail['vehicle_num']}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: const Text(
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                        "Vehical Number:",
                      ),
                    ),
                    Text(
                      style: TextStyle(fontSize: 18),
                      "${widget.detail['vehicle_no']}",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: const Text(
                        " Begin Date:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      widget.detail["begin_date"] != null
                          ? "${widget.detail["begin_date"].toDate().day}/${widget.detail["begin_date"].toDate().month}/${widget.detail["begin_date"].toDate().year}"
                          : "",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: const Text(
                        " End Date:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      widget.detail["end_date"] != null
                          ? "${widget.detail["end_date"].toDate().day}/${widget.detail["end_date"].toDate().month}/${widget.detail["end_date"].toDate().year}"
                          : "",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  " Budget:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  " Profit/Loss:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          const Text(
            " Expense Cateogaries",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(220, 10, 10, 10),
            child: SizedBox(
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      foregroundColor: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddExpense(
                            detail: widget.detail, expenseList: expenseMap),
                      ),
                    );
                  },
                  child: const Text("More")),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Visibility(
              visible: expenseMap.isNotEmpty,
              child: Column(
                children: [
                  ...expenseMap.map((e) => expenseList(context, e)).toList()
                ],
              )),
        ],
      ),
    );
  }
}

Widget expenseList(context, Map<String, dynamic> detail) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ExpenseDetails(
                    detail: detail,
                  )),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: mycolor, borderRadius: BorderRadius.circular(18)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${detail["type"]} Expense",
              // style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.arrow_forward,
              // color: Colors.white,
            ),
          ],
        ),
      ),
    ),
  );
}
