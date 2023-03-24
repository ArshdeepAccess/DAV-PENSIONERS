// import 'package:dav2/Models/resettlement_models/dataresettlement.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// class pdf5 extends StatefulWidget {
//   var url = "";
//   pdf5(this.url);
//
//   @override
//   State<pdf5> createState() => PdfState();
// }
//
// class PdfState extends State<pdf5> {
//   String? localPath;
//   Future<Resettlement>? futureAlbum;
//
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xFFd3eaf2),
//           title: Row(
//
//             children: [
//
//               Image(image: AssetImage("assets/images/dav-new-logo.png",
//
//               ),
//                 fit: BoxFit.contain,
//                 height: 60,),
//               Container(
//                   padding: const EdgeInsets.all(8.0), child: Text('VAYU-SAMPARC'))
//             ],
//
//           ),
//           // backgroundColor: Color(0xFF394361),
//           // title: Text(
//           //   "SERVING THOSE WHO SERVED US",
//           //   style: TextStyle(fontSize: 15),
//           // ),
//         ),
//         body: SfPdfViewer.network(widget.url));
//   }
// }
