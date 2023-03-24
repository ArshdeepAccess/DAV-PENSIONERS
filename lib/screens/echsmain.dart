// import 'dart:convert';
//
// import 'package:dav2/Models/echsmain_models/dataechsmain.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
//
//
// Future<Echsmain> fetchAlbum() async {
//   final response = await http.get(Uri.parse(
//       'https://iafpensioners.gov.in/ords/dav_portal/NAC/SERVICEPENSION'));
//
//   if (response.statusCode == 200) {
//     return Echsmain.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
//
// class Echsmain1 extends StatefulWidget {
//   const Echsmain1({Key? key}) : super(key: key);
//
//   @override
//   State<Echsmain1> createState() => _Echsmain1State();
// }
//
// class _Echsmain1State extends State<Echsmain1> {
//   String? localPath;
//   Future<Echsmain>? futureAlbum;
//
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     futureAlbum = fetchAlbum();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final maxLines;
//
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xFF394361),
//           title: Text(
//             "SERVING THOSE WHO SERVED US",
//             style: TextStyle(fontSize: 15),
//           ),
//         ),
//         body: SingleChildScrollView(
//             child: Center(
//                 child: FutureBuilder<Echsmain>(
//                   future: futureAlbum,
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return Column(
//                         // crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//
//                           Container(
//                             // height: 40,
//                             height: size.height * 0.08,
//                             width: size.width * 2,
//                             // width: 400,
//                             color: Colors.white,
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: MediaQuery.of(context).size.width / 20,
//                                 vertical: MediaQuery.of(context).size.width / 20,
//                               ),
//                               // padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
//                               child: Text(
//                                 "ECHS",
//                                 style: TextStyle(
//                                   color: Color(0xFF394361),
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(
//                               left: 5,
//                               right: 5,
//                             ),
//                             // padding: EdgeInsets.fromLTRB(
//                             //     MediaQuery.of(context).size.width / 0.001, 0, 0.001, 0),
//                             child: Container(
//                                 color: Colors.white,
//                                 // color: Color(0xFFe7f2f9),
//                                 child: ListView.separated(
//                                     primary: false,
//                                     itemCount: snapshot.data!.items.length,
//                                     separatorBuilder: (context, position) => SizedBox(
//                                       height: 0,
//                                     ),
//                                     shrinkWrap: true,
//                                     itemBuilder: (context, position) {
//                                    return Container(
//
//                                    );
//                                     })),
//                           )
//                         ],
//                       );
//                     } else if (snapshot.hasError) {
//                       return Text('${snapshot.error}');
//                     }
//
//                     return CircularProgressIndicator();
//                   },
//                 ))));
//   }
// }
