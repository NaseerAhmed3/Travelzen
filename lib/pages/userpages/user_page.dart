import 'package:flutter/material.dart';
// import 'package:the_tours/pages/admin/admin_employee.dart';
// import 'package:the_tours/pages/admin/admin_home.dart';
import 'package:the_tours/pages/admin/paymentsinfo.dart';
import 'package:the_tours/pages/admin/profile.dart';
import 'package:the_tours/pages/userpages/userhomepage.dart';

import '../../uicomponents/widgets.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int pageIndex = 0;

  final pages = [
    const UserHome(),
    const Paymentsinfo(),
    // const AdminEmployee(),
    const MyProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Tours"),
        titleTextStyle: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w500, color: mycolor),
        centerTitle: true,
        foregroundColor: mycolor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                      Icons.home_filled,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                      Icons.assured_workload,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.assured_workload_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                      Icons.account_box,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.account_box_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
            ),
            // IconButton(
            //   enableFeedback: false,
            //   onPressed: () {
            //     setState(() {
            //       pageIndex = 3;
            //     });
            //   },
            //   icon: pageIndex == 3
            //       ? const Icon(
            //           Icons.person,
            //           color: Colors.white,
            //           size: 35,
            //         )
            //       : const Icon(
            //           Icons.person_outline,
            //           color: Colors.white,
            //           size: 35,
            //         ),
            // ),
          ],
        ),
      ),
      body: pages[pageIndex],
    );
  }
}
