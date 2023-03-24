// // import 'package:flutter/material.dart';
// //
// // class EchsMap extends StatefulWidget {
// //   const EchsMap({Key? key}) : super(key: key);
// //
// //   @override
// //   State<EchsMap> createState() => _EchsMapState();
// // }
// //
// // class _EchsMapState extends State<EchsMap> {
// //   @override
// //
// //   Widget build(BuildContext context) {
// //     Size size = MediaQuery.of(context).size;
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Color(0xFF394361),
// //         title: Text(
// //           "Serving those who served us",
// //           style: TextStyle(fontSize: 15),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             Container(
// //               // height: 40,
// //               height: size.height * 0.08,
// //               width: size.width * 2,
// //               // width: 400,
// //               // color: Colors.white,
// //               child: Padding(
// //                 padding: EdgeInsets.symmetric(
// //                   horizontal: MediaQuery.of(context).size.width / 20,
// //                   vertical: MediaQuery.of(context).size.width / 20,
// //                 ),
// //                 // padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
// //                 child: Text(
// //                   "ECHS",
// //                   style: TextStyle(
// //                     color: Color(0xFF394361),
// //                     fontSize: 20,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             Container(
// //               margin: EdgeInsets.all(20),
// //               child: Table(
// //
// //                 columnWidths: const {
// //                   0: FlexColumnWidth(),
// //                   1: FixedColumnWidth(50),
// //
// //                 },
// //                 border: TableBorder.all(
// //                     color: Colors.black, style: BorderStyle.solid, width: 2),
// //                 children: [
// //                   TableRow(
// //                     children: [
// //                       Column(
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.all(20.0),
// //                             child: Text("AYUSHMAN HOSPITAL AND HEALTH SERVICES, DELHI"),
// //                           ),
// //                         ],
// //                       ),
// //                       Column(
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Icon(Icons.location_pin,color: Colors.red,),
// //                           ),
// //
// //                         ],
// //                       ),
// //
// //                     ],
// //                   ),
// //                   TableRow(
// //                     children: [
// //                       Column(
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.all(20.0),
// //                             child: Text("C M PATEL HOSPITAL, DELHI"),
// //                           ),
// //                         ],
// //                       ),
// //                       Column(
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Icon(Icons.location_pin,color: Colors.red,),
// //                           ),
// //
// //                         ],
// //                       ),
// //
// //                     ],
// //                   ),
// //                   TableRow(
// //                     children: [
// //                       Column(
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.all(20.0),
// //                             child: Text("DEEPALI EYE CENTRE, DELHI"),
// //                           ),
// //                         ],
// //                       ),
// //                       Column(
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Icon(Icons.location_pin,color: Colors.red,),
// //                           ),
// //
// //                         ],
// //                       ),
// //
// //                     ],
// //                   ),
// //
// //                   TableRow(
// //                     children: [
// //                       Column(
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.all(20.0),
// //                             child: Text("EYE MANTRA HOSPITAL DELHI"),
// //                           ),
// //                         ],
// //                       ),
// //                       Column(
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Icon(Icons.location_pin,color: Colors.red,),
// //                           ),
// //
// //                         ],
// //                       ),
// //
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// // import 'dart:convert';
// //
// // import 'package:dropdown_button2/dropdown_button2.dart';
// // import 'package:flutter/material.dart';
// // import 'package:maps_launcher/maps_launcher.dart';
// // import 'package:http/http.dart' as http;
// // import '../Models/CountryModel.dart';
// // import '../Models/LocationModel.dart';
// // import 'constant.dart';
// //
// // class EchsMap extends StatefulWidget {
// //   const EchsMap({Key? key}) : super(key: key);
// //
// //   @override
// //   State<EchsMap> createState() => _EchsMapState();
// // }
// //
// // class _EchsMapState extends State<EchsMap> {
// //   List<CountryModel> data = [];
// //   List<CountryModel> stateData = [];
// //   List<LocationModel> locationData = [];
// //
// //   var type = ["URC", "ECHS"];
// //   var selectedValue = "";
// //   var selectedState = "";
// //   var selectedType = "URC";
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     getState();
// //   }
// //
// //   // Future<void> getCountries() async {
// //   //   final response = await http.get(Uri.parse("$baseURL/COUNTRY/COUNTRY"));
// //   //   if (response.statusCode == 200) {
// //   //     var responseBody = jsonDecode(response.body);
// //   //     data = (responseBody["items"] as List).map((data) => CountryModel.fromJson(data)).toList();
// //   //     selectedValue = data[0].r.toString();
// //   //     setState(() {});
// //   //   } else {
// //   //     throw Exception('Failed to load album');
// //   //   }
// //   // }
// //
// //   Future<void> getState() async {
// //     final response = await http.get(Uri.parse("$baseURL/CITYFORMAP/CITYFORMAP/$selectedValue"));
// //     if (response.statusCode == 200) {
// //       var responseBody = jsonDecode(response.body);
// //       stateData = (responseBody["items"] as List).map((data) => CountryModel.fromJson(data)).toList();
// //       selectedState = stateData[0].city_code.toString();
// //       getLatLon();
// //       setState(() {});
// //     } else {
// //       throw Exception('Failed to load album');
// //     }
// //   }
// //
// //   Future<void> getLatLon() async {
// //     var type = "U";
// //     if(selectedType == "ECHS"){
// //       type = "E";
// //     }
// //     print("$baseURL/MAP_URC_ECHS/MAP_URC_ECHS/$type/$selectedState");
// //     final response = await http.get(Uri.parse("$baseURL/MAP_URC_ECHS/MAP_URC_ECHS/$type/$selectedState"));
// //     var responseBody = jsonDecode(response.body);
// //     locationData = (responseBody["items"] as List).map((data) => LocationModel.fromJson(data)).toList();
// //     setState(() {
// //
// //     });
// //   }
// //
// //   void openMap(index){
// //     MapsLauncher.launchCoordinates(double.parse(locationData[index].latitude), double.parse(locationData[index].longitude));
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     Size size = MediaQuery.of(context).size;
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: const Color(0xFF394361),
// //         title: const Text("Serving those who served us", style: TextStyle(fontSize: 15),),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             SizedBox(
// //               // height: 40,
// //               height: size.height * 0.08,
// //               width: size.width * 2,
// //               // width: 400,
// //               // color: Colors.white,
// //               child: Padding(
// //                 padding: EdgeInsets.symmetric(
// //                   horizontal: MediaQuery.of(context).size.width / 20,
// //                   vertical: MediaQuery.of(context).size.width / 20,
// //                 ),
// //                 // padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
// //                 child: const Text(
// //                   "ECHS",
// //                   style: TextStyle(
// //                     color: Color(0xFF394361),
// //                     fontSize: 20,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             Container(
// //               margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
// //               child: Row(
// //                 children: [
// //
// //                     Expanded(
// //                       child: Container(
// //                         padding: const EdgeInsets.all(5),
// //                         decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
// //                         child: DropdownButtonHideUnderline(
// //                           child: DropdownButton2(
// //                             hint: Text(
// //                               'Select Item',
// //                               style: TextStyle(
// //                                 fontSize: 14,
// //                                 color: Theme.of(context).hintColor,
// //                               ),
// //                             ),
// //                             items: stateData.map((item) =>
// //                                 DropdownMenuItem<String>(
// //                                   value: item.city_code.toString(),
// //                                   child: SizedBox(
// //                                     width: 90,
// //                                     child: Text(item.city_name, style: const TextStyle(fontSize: 12), overflow:TextOverflow.clip),
// //                                   ),
// //                                 ))
// //                                 .toList(),
// //                             value: selectedState,
// //                             onChanged: (value) {
// //                               setState(() {
// //                                 selectedState = value as String;
// //                               });
// //                               getLatLon();
// //                             },
// //                             buttonHeight: 40,
// //                             itemHeight: 40,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(height: 15),
// //             Container(
// //               padding: const EdgeInsets.all(5),
// //               decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
// //               child: DropdownButtonHideUnderline(
// //                 child: DropdownButton2(
// //                   hint: Text('Select Type', style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor,),),
// //                   items: type.map((item) =>
// //                       DropdownMenuItem<String>(
// //                         value: item,
// //                         child: Text(item, style: const TextStyle(fontSize: 14)),
// //                       )).toList(),
// //                   value: selectedType,
// //                   onChanged: (value) {
// //                     setState(() {
// //                       selectedType = value as String;
// //                       getLatLon();
// //                     });
// //                   },
// //                   buttonHeight: 40,
// //                   itemHeight: 40,
// //                 ),
// //               ),
// //             ),
// //             Container(
// //               margin: const EdgeInsets.all(20),
// //               child: Table(
// //
// //                 columnWidths: const {
// //                   0: FlexColumnWidth(),
// //                   1: FixedColumnWidth(50),
// //
// //                 },
// //                 border: TableBorder.all(
// //                     color: Colors.black, style: BorderStyle.solid, width: 2),
// //                 children: [
// //                   for(int i = 0; i < locationData.length; i++)
// //                     TableRow(
// //                       children: [
// //                         Column(
// //                           children: [
// //                             Padding(
// //                               padding: EdgeInsets.all(20.0),
// //                               child: Text(locationData[i].locationDesc.toString()),
// //                             ),
// //                           ],
// //                         ),
// //                         InkWell(
// //                           onTap: () => {
// //                             openMap(i)
// //                           },
// //                           child: Padding(
// //                             padding: EdgeInsets.all(8.0),
// //                             child: Icon(Icons.location_pin,color: Colors.red,),
// //                           ),
// //                         ),
// //
// //                       ],
// //                     ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'dart:convert';
//
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:maps_launcher/maps_launcher.dart';
//
// import 'package:http/http.dart' as http;
//
//
// import '../Models/CityModel.dart';
// import '../Models/LocationModel.dart';
// import 'constant.dart';
//
// class EchsMap extends StatefulWidget {
//   const EchsMap({Key? key}) : super(key: key);
//
//   @override
//   State<EchsMap> createState() => _EchsMapState();
// }
//
// class _EchsMapState extends State<EchsMap> {
//
//   List<CountryModel> stateData = [];
//   List<LocationModel> locationData = [];
//
//   var type = ["URC", "ECHS"];
//   var selectedValue = "";
//   var selectedState = "";
//   var selectedType = "URC";
//
//   @override
//   void initState() {
//     super.initState();
//     getState();
//   }
//
//   Future<void> getState() async {
//     final response = await http.get(Uri.parse("$baseURL/CITYFORMAP/CITYFORMAP/"));
//     if (response.statusCode == 200) {
//       var responseBody = jsonDecode(response.body);
//       stateData = (responseBody["items"] as List).map((data) => CountryModel.fromJson(data)).toList();
//       selectedState = stateData[0].city_code;
//       ;
//       getLatLon();
//       setState(() {});
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//
//   Future<void> getLatLon() async {
//     var type = "U";
//     if(selectedType == "ECHS"){
//       type = "E";
//     }
//     print("$baseURL/MAP_URC_ECHS/MAP_URC_ECHS/$type/$selectedState");
//     final response = await http.get(Uri.parse("$baseURL/MAP_URC_ECHS/MAP_URC_ECHS/$type/$selectedState"));
//     var responseBody = jsonDecode(response.body);
//     locationData = (responseBody["items"] as List).map((data) => LocationModel.fromJson(data)).toList();
//     setState(() {
//
//     });
//   }
//
//   void openMap(index){
//     MapsLauncher.launchCoordinates(double.parse(locationData[index].latitude), double.parse(locationData[index].longitude));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF394361),
//         title: const Text("Serving those who served us", style: TextStyle(fontSize: 15),),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               // height: 40,
//               height: size.height * 0.08,
//               width: size.width * 2,
//               // width: 400,
//               // color: Colors.white,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: MediaQuery.of(context).size.width / 20,
//                   vertical: MediaQuery.of(context).size.width / 20,
//                 ),
//                 child: const Text(
//                   "ECHS/URC",
//                   style: TextStyle(
//                     color: Color(0xFF394361),
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//               child: Row(
//                 children: [
//
//                   Expanded(
//                     child: Container(
//                       padding: const EdgeInsets.all(5),
//                       decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
//                       child: DropdownButtonHideUnderline(
//                         child: DropdownButton2(
//                           hint: Text(
//                             'Select Item',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Theme.of(context).hintColor,
//                             ),
//                           ),
//                           items: stateData.map((item) =>
//                               DropdownMenuItem<String>(
//                                 value: item.city_code,
//                                 child: SizedBox(
//                                   width: 110,
//                                   child: Text(item.city_name, style: const TextStyle(fontSize: 12), overflow:TextOverflow.clip),
//                                 ),
//                               ))
//                               .toList(),
//                           value: selectedState,
//                           onChanged: (value) {
//                             setState(() {
//                               selectedState = value as String;
//                             });
//                             getLatLon();
//                           },
//                           buttonHeight: 40,
//                           itemHeight: 40,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 15),
//             Container(
//               padding: const EdgeInsets.all(5),
//               decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton2(
//                   hint: Text('Select Type', style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor,),),
//                   items: type.map((item) =>
//                       DropdownMenuItem<String>(
//                         value: item,
//                         child: Text(item, style: const TextStyle(fontSize: 14)),
//                       )).toList(),
//                   value: selectedType,
//                   onChanged: (value) {
//                     setState(() {
//                       selectedType = value as String;
//                       getLatLon();
//                     });
//                   },
//                   buttonHeight: 40,
//                   itemHeight: 40,
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.all(20),
//               child: Table(
//
//                 columnWidths: const {
//                   0: FlexColumnWidth(),
//                   1: FixedColumnWidth(50),
//
//                 },
//                 border: TableBorder.all(
//                     color: Colors.black, style: BorderStyle.solid, width: 2),
//                 children: [
//                   for(int i = 0; i < locationData.length; i++)
//                     TableRow(
//                       children: [
//                         Column(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.all(20.0),
//                               child: Text(locationData[i].locationDesc.toString()),
//                             ),
//                           ],
//                         ),
//                         InkWell(
//                           onTap: () => {
//                             openMap(i)
//                           },
//                           child: Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Icon(Icons.location_pin,color: Colors.red,),
//                           ),
//                         ),
//
//                       ],
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
