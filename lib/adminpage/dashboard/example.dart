// Future<String> getData() async {
//   String data = '';
//   await FirebaseFirestore.instance
//       .collection('myCollection')
//       .doc('myDocId')
//       .get()
//       .then((DocumentSnapshot documentSnapshot) {
//     if (documentSnapshot.exists) {
//       data = documentSnapshot.data()['myField'];
//     } else {
//       data = 'Document does not exist on the database';
//     }
//   });
//   return data;
// }

// Widget build(BuildContext context) {
//   return FutureBuilder<String>(
//     future: getData(),
//     builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//       if (snapshot.connectionState == ConnectionState.done) {
//         if (snapshot.hasData) {
//           return Text(snapshot.data);
//         } else {
//           return Text('No data available');
//         }
//       } else {
//         return CircularProgressIndicator();
//       }
//     },
//   );
// }

// maping




// class Record {
//   final String Hotel_Name= snapshot.data().toString();
//   final String Address= snapshot.data().toString();
// final int Recep_Cont= snapshot.data();
// final int Rooms_count= snapshot.data();

// Record.fromMap(Map<String, dynamic> map, {required this.reference})
//     : assert(map['Hotel Name']),
//       assert(map['Address']),
//       assert(map['Reception Number']),
//       assert(map['Rooms count']),
//       Hotel_Name = map['Hotel Name'],
//       Address = map['Address'],
//       Rooms_count = map['Rooms count'],
//       Recep_Cont = map['Reception Number'];

// Record.fromSnapshot(DocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data as Map<String, dynamic>,
//           reference: snapshot.reference);

// @override
// String toString() => "Record<$Hotel_Name:$Recep_Cont:$Address:$Rooms_count>";
// }



        // Center(
        //   child: Container(
        //       margin: const EdgeInsets.all(20),
        //       child: DataTable(columns: const [
        //         DataColumn(
        //           label: Text('NO'),
        //         ),
        //         DataColumn(
        //           label: Text('Hotel_Name'),
        //         ),
        //         DataColumn(
        //           label: Text('Address'),
        //         ),
        //         DataColumn(
        //           label: Text('Recep_Cont'),
        //         ),
        //         DataColumn(
        //           label: Text('Rooms_count'),
        //         ),
        //       ], rows: const [
        //         DataRow(cells: [
        //           DataCell(Text('1')),
        //           DataCell(Text('')),
        //           DataCell(Text('5644645')),
        //           DataCell(Text('3')),
        //           DataCell(Text('265\$')),
        //         ])
        //       ])),
        // ),