import 'package:flutter/material.dart';
// import 'package:flutter_application_1/adminpage/dashboard/map_routs.dart';
import 'package:flutter_application_1/components/Categorries.dart';
import 'package:flutter_application_1/components/textfeild.dart';
import 'package:flutter_application_1/components/tourslist.dart';

import '../components/constant.dart';
// import 'package:flutter_application_1/adminpage/dashboard/timetable.dart';
// import 'package:flutter_application_1/adminpage/dashboard/touristpoint.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

TextEditingController _textEditingController = TextEditingController();

class _AdminpageState extends State<Adminpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "THE TOURS",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            // CircleAvatar(
            //   radius: 25,
            //   backgroundImage: NetworkImage(
            //       "https://images.pexels.com/photos/13720883/pexels-photo-13720883.jpeg"),
            // ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: double.maxFinite,
            width: double.infinity,
            color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Add Tour",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add))
                      ],
                    ),
                  ),
                ),
                const RoundedInputField(hintText: "Search", picons: Icons.search),
                const Categories(),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                    child: ListView.builder(
                        // itemCount: products.length,

                        itemBuilder: (context, index) => const ToursList(
                            // press: () => Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => DetailsScreen(
                            //         // product: products[index],
                            //       ),
                            //     )),
                            )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
