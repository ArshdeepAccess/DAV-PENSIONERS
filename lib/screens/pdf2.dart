// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// import '../Models/family_models/datafamily.dart';
//
// class pdf2 extends StatefulWidget {
//   var url = "";
//   pdf2(this.url);
//
//   @override
//   State<pdf2> createState() => PdfState();
// }
//
// class PdfState extends State<pdf2> {
//   String? localPath;
//   Future<Family>? futureAlbum;
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
