import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_tours/pages/admin/tour_detail.dart';
import 'package:the_tours/uicomponents/widgets.dart';
import 'add_tour.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List<Map<String, dynamic>> filteredActiveTours = [];
  List<Map<String, dynamic>> filteredHistoryTours = [];
  List<Map<String, dynamic>> activeTours = [];
  List<Map<String, dynamic>> historyTours = [];
  List<Map<String, dynamic>> tours = [];
  TextEditingController searchText = TextEditingController();
  bool isLoading = false;
  bool isActive = true;
  _filter(value) {
    if (isActive) {
      if (value.isEmpty) {
        filteredActiveTours = activeTours;
      } else {
        filteredActiveTours = activeTours
            .where((element) {
              if (element["agent_name"] != null &&
                      (element["agent_name"] as String)
                          .contains(searchText.text) ||
                  element["destination"] != null &&
                      (element["destination"] as String)
                          .contains(searchText.text) ||
                  element["tour_type"] != null &&
                      (element["tour_type"] as String)
                          .contains(searchText.text) ||
                  element["begin_from"] != null &&
                      (element["begin_from"] as String)
                          .contains(searchText.text) ||
                  element["vehicle_no"] != null &&
                      (element["vehicle_no"] as String)
                          .contains(searchText.text) ||
                  element['no_of_tourist'] != null &&
                      element['no_of_tourist'].toString() == searchText.text ||
                  element['end_date'] != null &&
                      element['end_date'].toString() == searchText.text ||
                  element['begin_date'] != null &&
                      element['begin_date'].toString() == searchText.text) {
                return true;
              } else {
                return false;
              }
            })
            .map((e) => e)
            .toList();
      }
    } else {
      if (value.isEmpty) {
        filteredHistoryTours = historyTours;
      } else {
        filteredHistoryTours = historyTours
            .where((element) {
              if (element["agent_name"] != null &&
                      (element["agent_name"] as String)
                          .contains(searchText.text) ||
                  element["destination"] != null &&
                      (element["destination"] as String)
                          .contains(searchText.text) ||
                  element["tour_type"] != null &&
                      (element["tour_type"] as String)
                          .contains(searchText.text) ||
                  element["begin_from"] != null &&
                      (element["begin_from"] as String)
                          .contains(searchText.text) ||
                  element["vehicle_no"] != null &&
                      (element["vehicle_no"] as String)
                          .contains(searchText.text) ||
                  element['no_of_tourist'] != null &&
                      element['no_of_tourist'].toString() == searchText.text ||
                  element['end_date'] != null &&
                      element['end_date'].toString() == searchText.text ||
                  element['begin_date'] != null &&
                      element['begin_date'].toString() == searchText.text) {
                return true;
              } else {
                return false;
              }
            })
            .map((e) => e)
            .toList();
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection('tour')
          .where('createdBy', isEqualTo: user.uid)
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> newSnapshot) {
        if (newSnapshot.docs.isNotEmpty) {
          for (var docs in newSnapshot.docs) {
            tours.add({
              ...docs.data(),
              "id": docs.id,
            });
          }
          if (tours.isNotEmpty) {
            for (var tour in tours) {
              if (tour["is_active"] == 0) {
                historyTours.add(tour);
                print(tours);
              } else {
                activeTours.add(tour);
                print(tours);
              }
            }
            filteredHistoryTours = historyTours;
            filteredActiveTours = activeTours;
          }
        }
        isLoading = false;
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add tours",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: mycolor.shade50,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: mycolor,
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Addtours(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Material(
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(color: mycolor),
                      height: 30,
                      width: 400,
                      child: Row(
                        // scrollDirection: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () {
                                isActive = true;
                                setState(() {});
                              },
                              child: Text(
                                "Active Tours",
                                style: TextStyle(
                                  color: isActive ? Colors.white : Colors.grey,
                                ),
                              )),
                          TextButton(
                              onPressed: () {
                                isActive = false;
                                setState(() {});
                              },
                              child: Text(
                                "Previous Tours",
                                style: TextStyle(
                                  color: isActive ? Colors.grey : Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      controller: searchText,
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
                        labelText: "Search",
                        suffixIcon: Icon(Icons.search),
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: const Color.fromARGB(255, 221, 221, 221),
                        filled: true,
                      ),
                      onChanged: (value) => {_filter(value)},
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Visibility(
                          visible: isActive && filteredActiveTours.isNotEmpty,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: filteredActiveTours
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 18,
                                          right: 18),
                                      child: Stack(children: [
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          elevation: 15,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      e["destination"] ?? "",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      "${e["no_of_tourist"]} Persons",
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(
                                                  thickness: 2,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      // width: 150,
                                                      height: 110,
                                                      child: Row(
                                                        children: [
                                                          const Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  "Manger name"),
                                                              Text(
                                                                  "Begin from"),
                                                              Text(
                                                                  "Vehical number"),
                                                              Text(
                                                                  "Vehical Name"),
                                                              Text(
                                                                  "Begin Date "),
                                                              Text("End Date "),
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  e["agent_name"] ??
                                                                      ""),
                                                              Text(
                                                                  e["begin_from"] ??
                                                                      ""),
                                                              Text(
                                                                  e["vehicle_no"] ??
                                                                      ""),
                                                              Text(
                                                                e["vehicle_num"] ??
                                                                    "",
                                                                // style: TextStyle(
                                                                //   fontSize: 16,
                                                                // ),
                                                              ),
                                                              Text(
                                                                e["begin_date"] !=
                                                                        null
                                                                    ? "${e["begin_date"].toDate().day}/${e["begin_date"].toDate().month}/${e["begin_date"].toDate().year}"
                                                                    : "",
                                                              ),
                                                              Text(
                                                                e["end_date"] !=
                                                                        null
                                                                    ? "${e["end_date"].toDate().day}/${e["end_date"].toDate().month}/${e["end_date"].toDate().year}"
                                                                    : "",
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 200,
                                          top: 110,
                                          child: SizedBox(
                                            height: 40,
                                            width: 100,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        TourDetail(detail: e),
                                                  ),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                ),
                                              ),
                                              child: const Text("Details"),
                                            ),
                                          ),
                                        )
                                      ]),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Visibility(
                          visible: !isActive && filteredHistoryTours.isNotEmpty,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: filteredHistoryTours
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15,
                                          bottom: 15,
                                          left: 18,
                                          right: 18),
                                      child: Stack(children: [
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          elevation: 15,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      e["destination"] ?? "",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      "${e["no_of_tourist"]} Persons",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(
                                                  thickness: 2,
                                                ),
                                                SizedBox(
                                                  height: 150,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 130,
                                                            child: Text(
                                                              "Manger name",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                          Text(
                                                            e["agent_name"] ??
                                                                "",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 130,
                                                            child: Text(
                                                              "Begin from",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                          Text(
                                                            e["begin_from"] ??
                                                                "",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 130,
                                                            child: Text(
                                                              "Vehical Name",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                          Text(
                                                            e["vehicle_num"] ??
                                                                "",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 130,
                                                            child: Text(
                                                              "Vehical number",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                          Text(
                                                            e["vehicle_no"] ??
                                                                "",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 130,
                                                            child: Text(
                                                              "Begin Date ",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                          Text(
                                                            e["begin_date"] !=
                                                                    null
                                                                ? "${e["begin_date"].toDate().day}/${e["begin_date"].toDate().month}/${e["begin_date"].toDate().year}"
                                                                : "",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 130,
                                                            child: Text(
                                                              "End Date ",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                          Text(
                                                            e["end_date"] !=
                                                                    null
                                                                ? "${e["end_date"].toDate().day}/${e["end_date"].toDate().month}/${e["end_date"].toDate().year}"
                                                                : "",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 215,
                                          top: 155,
                                          child: SizedBox(
                                            height: 40,
                                            width: 100,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        TourDetail(detail: e),
                                                  ),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                // backgroundColor: kcolor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                ),
                                              ),
                                              child: const Text(
                                                "Details",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : const CircularProgressIndicator();
  }
}
