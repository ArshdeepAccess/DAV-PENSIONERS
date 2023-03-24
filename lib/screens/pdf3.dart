// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// import '../Models/disability_models/datadisability.dart';
//
// class pdf3 extends StatefulWidget {
//   var url = "";
//   pdf3(this.url);
//
//   @override
//   State<pdf3> createState() => PdfState();
// }
//
// class PdfState extends State<pdf3> {
//   String? localPath;
//   Future<Disability>? futureAlbum;
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
