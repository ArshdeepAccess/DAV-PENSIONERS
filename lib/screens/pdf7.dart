// import 'package:dav2/Models/faq_models/datafaqofficer.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// import '../Models/faq_models/datafaqairmen.dart';
//
// class pdf7 extends StatefulWidget {
//   var url = "";
//   pdf7(this.url);
//
//   @override
//   State<pdf7> createState() => PdfState();
// }
//
// class PdfState extends State<pdf7> {
//   String? localPath;
//   Future<Faqairmen>? futureAlbum;
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
