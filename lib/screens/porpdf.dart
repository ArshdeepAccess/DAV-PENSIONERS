// // import 'package:flutter/material.dart';
// // class PorPdf extends StatefulWidget {
// //   const PorPdf({Key? key}) : super(key: key);
// //
// //   @override
// //   State<PorPdf> createState() => _PorPdfState();
// // }
// //
// // class _PorPdfState extends State<PorPdf> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //           body: SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 Row(
// //                   children: [
// //                     Column(
// //                       children: [
// //                         Container(
// //                           height: 100,
// //                           width: 100,
// //                           child: Image.asset(
// //                             "assets/images/newlogo.png",
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                     Column(
// //                       children: [
// //                         Container(
// //                           child: Text("Personal Occurance Report",
// //                           style: TextStyle(
// //                             color: Color(0xFF394361),
// //                             fontWeight: FontWeight.bold,
// //
// //                           ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //     );
// //   }
// // }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import '../Models/PorModel.dart';
// import 'constant.dart';
// class PorPdf extends StatefulWidget {
//   const PorPdf({Key? key}) : super(key: key);
//
//   @override
//   State<PorPdf> createState() => _PorPdfState();
// }
//
// class _PorPdfState extends State<PorPdf> {
//   List<PorModel> data = [];
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   Future<void> getData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var serviceNumber = prefs.getString('ServiceNumber') ?? "";
//     var cat = prefs.getString('Category') ?? "";
//
//     final response = await http.get(Uri.parse("${baseURL}/VIEWPOR//VIEWPOR/${serviceNumber}/${cat}"));
//     if (response.statusCode == 200) {
//       var responseBody = jsonDecode(response.body);
//       data = (responseBody["items"] as List).map((data) => PorModel.fromJson(data)).toList();
//       setState(() {});
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xFF394361),
//           title: Text(
//             "SERVING THOSE WHO SERVED US",
//             style: TextStyle(fontSize: 15),
//           ),
//         ),
//         body: ListView.separated(
//             padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
//             shrinkWrap: true,
//             primary: false,
//             itemCount: data.length,
//             separatorBuilder: (context, position) => const SizedBox(
//               height: 10,
//             ),
//             itemBuilder: (context, position) {
//               return Column(
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//
//                   Row(
//                     children: [
//                       Column(
//                         children: [
//                           Container(
//                             height: 100,
//                             width: 100,
//                             child: Image.asset(
//                               "assets/images/newlogo.png",
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Container(
//                             child: Text("Personal Occurance Report",
//                               style: TextStyle(
//                                 color: Color(0xFF394361),
//                                 fontWeight: FontWeight.bold,
//
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                   Column(
//                     children: [
//                       Row(
//                         children: [
//                           Text("POR No."),
//                           Text(data[position].por_no.toString()),
//                         ],
//                       ),
//                     ],
//                   ),
//
//
//                 ],
//               );
//             })
//     );
//   }
// }
//
