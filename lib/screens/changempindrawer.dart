// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'constant.dart';
// import 'hmscreen1.dart';
//
// class ChangeM extends StatefulWidget {
//   const ChangeM({Key? key}) : super(key: key);
//   @override
//   State<ChangeM> createState() => _ChangeMState();
// }
// class _ChangeMState extends State<ChangeM> {
//   var mpinController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//
//   }
//
//   Future<void> getData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var serviceNumber = prefs.getString('ServiceNumber') ?? "";
//     var cat = prefs.getString('Category') ?? "";
//
//     final response = await http.put(Uri.parse("${baseURL}/UPDATEMPIN/UPDATEMPIN"),
//         body: {
//           "SERVICE_NO" : serviceNumber,
//           "CATEGORY" : cat,
//           "MPIN" : mpinController.text.toString(),
//         }
//     );
//     var responseBody = jsonDecode(response.body);
//
//     if (responseBody["items"][0]["result"] == "ERROR") {
//       _showMyDialog("Enter 4 digit MPIN");
//
//     } else {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setString('MPIN', mpinController.text.toString());
//       Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (BuildContext context) {
//           return const HomeScreen();
//         }),
//             (_) => false,
//       );
//     }
//   }
//
//   Future<void> _showMyDialog(message) async {
//     showDialog<String>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         title: const Text('Error'),
//         content: Text(message),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.pop(context, 'OK'),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFFd3eaf2),
//         title: Row(
//           children: [
//             Image(image: AssetImage("assets/images/dav-new-logo.png",
//             ),
//               fit: BoxFit.contain,
//               height: 60,),
//             Container(
//                 padding: const EdgeInsets.all(8.0), child: Text('VAYU-SAMPARC'))
//           ],
//         ),
//       ),
//       body: ListView(children: [
//         SizedBox(height: 20,),
//         Container(
//           alignment: Alignment.center,
//           child: Text("Change Mpin",style: TextStyle(fontWeight: FontWeight.bold,
//             fontSize: 18,
//             color: Color(0xFF0b0c5b),
//           ),),),
//
//         // Container(
//         //   alignment: Alignment.topLeft,
//         //   child: const Padding(
//         //     padding: EdgeInsets.fromLTRB(10.0, 8.0, 150.0, 0.0),
//         //     child: Text(
//         //       "Old MPIN",
//         //       style: TextStyle(
//         //         // color: Color(0xFF0b0c5b),
//         //         fontWeight: FontWeight.bold,
//         //         fontSize: 15,
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         // Padding(
//         //   padding: EdgeInsets.symmetric(
//         //     horizontal:
//         //     MediaQuery.of(context).size.width /
//         //         40,
//         //     vertical:
//         //     MediaQuery.of(context).size.width /
//         //         120,
//         //   ),
//         //   child: Pinput(
//         //     // controller: newmpinController,
//         //     length: 4,
//         //     obscureText: true,
//         //     obscuringCharacter: '●',
//         //     showCursor: true,
//         //   ),
//         // ),
//
//         Container(
//           alignment: Alignment.topLeft,
//           child: const Padding(
//             padding: EdgeInsets.fromLTRB(10.0, 8.0, 150.0, 0.0),
//             child: Text(
//               "New MPIN",
//               style: TextStyle(
//                 // color: Color(0xFF0b0c5b),
//                 fontWeight: FontWeight.bold,
//                 fontSize: 15,
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal:
//             MediaQuery.of(context).size.width /
//                 40,
//             vertical:
//             MediaQuery.of(context).size.width /
//                 120,
//           ),
//           child: Pinput(
//             controller: mpinController,
//             length: 4,
//             obscureText: true,
//             obscuringCharacter: '●',
//             showCursor: true,
//           ),
//         ),
//         SizedBox(height: 30,),
//         Container(
//           height: size.height * 0.06,
//           // height: 50,
//           width: double.infinity,
//           margin: const EdgeInsets.all(10),
//           child: ElevatedButton(
//             onPressed: ()  {
//               getData();
//               // doMpin();
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //       builder: (context) => Store1()),
//               // );
//             },
//             style: ElevatedButton.styleFrom(
//               // primary: const Color(0xFF0b0c5b),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(28))),
//             child: Text(
//               "Confirm",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }
