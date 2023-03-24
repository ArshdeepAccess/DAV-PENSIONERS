// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import 'maindrawer.dart';
// class Disabilitypension extends StatefulWidget {
//   const Disabilitypension({Key? key}) : super(key: key);
//
//   @override
//   State<Disabilitypension> createState() => _DisabilitypensionState();
// }
//
// class _DisabilitypensionState extends State<Disabilitypension> {
//   late WebViewController controller;
//   @override
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF394361),
//         title: Text(
//           "VAYU-SAMPARC",
//           style: TextStyle(fontSize: 20),
//         ),
//         actions: [
//           IconButton(onPressed: (){},
//               // toggleRecording,
//               icon: Icon(Icons.mic)),
//           Image(image: AssetImage("assets/images/newlogo.png"))],
//       ),
//       drawer: Maindrawer(),
//       body: WebView(
//         javascriptMode: JavascriptMode.unrestricted,
//         initialUrl: "https://iafpensioners.gov.in/ords/dav_portal/r/dte_av/pensionregulations?p0_title=Notifications%20%26%20Circulars&P0_ISMOBILE=1&p0_hsd_type=NAC&p0_hsd_sub_type=DSP&p0_heading=Disability%20Pension",
//         onWebViewCreated: (controller){
//           this.controller = controller;
//         },
//       ),
//
//     );
//   }
// }
// import 'dart:convert';
// import 'package:dav2/screens/pdf3.dart';
// import 'package:dio/dio.dart';
// import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Models/disability_models/datadisability.dart';
//
// Future<Disability> fetchAlbum() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var cat = prefs.getString('Category') ?? "";
//
//   if (cat == "O") {
//     cat = "MNO";
//   } else {
//     cat = "MNA";
//   }
//   final response = await http.get(Uri.parse(
//       'https://iafpensioners.gov.in/ords/dav_portal/DISABILITYPENSION/DISABILITYPENSION/${cat}'));
//
//   if (response.statusCode == 200) {
//     return Disability.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
//
// class Disability1 extends StatefulWidget {
//   const Disability1({Key? key}) : super(key: key);
//
//   @override
//   State<Disability1> createState() => _Disability1State();
// }
//
// class _Disability1State extends State<Disability1> {
//   String? localPath;
//   Future<Disability>? futureAlbum;
//
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }
//   Future<void> saveFile(url) async {
//     var dir = await DownloadsPathProvider.downloadsDirectory;
//     if (dir != null) {
//       String saveName = url.split('/').last;
//       String savePath = "${dir.path}/$saveName";
//
//       Fluttertoast.showToast(
//           msg: "Downloading Start",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//
//       try {
//         await Dio().download(url, savePath,
//             onReceiveProgress: (received, total) {
//               if (total != -1) {
//                 print("${(received / total * 100).toStringAsFixed(0)}%");
//               }
//             });
//         Fluttertoast.showToast(
//             msg: "File is saved to download folder.",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0);
//       } on DioError catch (e) {
//         Fluttertoast.showToast(
//             msg: e.message.toString(),
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0);
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final maxLines;
//
//     return Scaffold(
//         backgroundColor: Color(0xFFf2fcff),
//         appBar: AppBar(
//           backgroundColor: Color(0xFFd3eaf2),
//           title: Row(
//             children: [
//               Image(image: AssetImage("assets/images/dav-new-logo.png",
//               ),
//                 fit: BoxFit.contain,
//                 height: 60,),
//               Container(
//                   padding: const EdgeInsets.all(8.0), child: Text('VAYU-SAMPARC'))
//             ],
//           ),
//         ),
//         body: SingleChildScrollView(
//             child: Center(
//                 child: FutureBuilder<Disability>(
//                   future: futureAlbum,
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return Column(
//                         // crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             alignment: Alignment.topLeft,
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: MediaQuery.of(context).size.width / 20,
//                                 vertical: MediaQuery.of(context).size.width / 20,
//                               ),
//                               // padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
//                               child: Text(
//                                 "Disability Pension",
//                                 style: TextStyle(
//                                   color: Color(0xFF394361),
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//
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
//                                       return Container(
//                                         child: Table(
//                                           columnWidths: const {
//                                             0: FixedColumnWidth(50),
//                                             1: FlexColumnWidth(),
//                                             2: FixedColumnWidth(50),
//                                             3: FixedColumnWidth(50),
//                                           },
//                                           border: TableBorder.all(
//                                             color: Colors.grey,
//                                           ),
//                                           children: [
//                                             TableRow(
//                                               //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 Padding(
//                                                   padding: EdgeInsets.all(
//                                                       MediaQuery.of(context)
//                                                           .size
//                                                           .width /
//                                                           40),
//                                                   // padding: const EdgeInsets.all(8.0),
//                                                   child: Text(snapshot
//                                                       .data!.items[position].hsd_sr_no
//                                                       .toString()),
//                                                 ),
//
//                                                 Padding(
//                                                   padding: EdgeInsets.all(
//                                                       MediaQuery.of(context)
//                                                           .size
//                                                           .width /
//                                                           70),
//                                                   // padding: const EdgeInsets.all(8.0),
//                                                   child: Text(snapshot
//                                                       .data!.items[position].hsd_detail
//                                                       .toString()),
//                                                 ),
//                                                 Padding(
//                                                   padding: EdgeInsets.all(
//                                                       MediaQuery.of(context)
//                                                           .size
//                                                           .width /
//                                                           50),
//
//                                                   child: GestureDetector(
//                                                     onTap: () {
//                                                       Navigator.push(
//                                                           context,
//                                                           MaterialPageRoute(
//                                                               builder: (context) => pdf3(snapshot.data!.items[position].hsd_pdf_link.toString())
//
//                                                           ));
//                                                     },
//                                                     child: Icon(
//                                                       Icons.picture_as_pdf,color: Colors.red,),
//
//                                                   ),
//
//                                                 ),
//                                                 Padding(
//                                                   padding: EdgeInsets.all(
//                                                       MediaQuery.of(context)
//                                                           .size
//                                                           .width /
//                                                           50),
//                                                   child: GestureDetector(
//                                                     onTap: () {
//                                                       saveFile(snapshot
//                                                           .data!
//                                                           .items[position]
//                                                           .hsd_pdf_link
//                                                           .toString());
//                                                     },
//                                                     child: Icon(
//                                                       Icons.download,
//                                                       color: Colors.red,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       );
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