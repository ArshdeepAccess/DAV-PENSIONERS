// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import 'maindrawer.dart';
// class Familypension extends StatefulWidget {
//   const Familypension({Key? key}) : super(key: key);
//
//   @override
//   State<Familypension> createState() => _FamilypensionState();
// }
//
// class _FamilypensionState extends State<Familypension> {
//   late WebViewController controller;
//   @override
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
//         initialUrl: "https://iafpensioners.gov.in/ords/dav_portal/r/dte_av/pensionregulations?p0_title=Notifications%20%26%20Circulars&P0_ISMOBILE=1&p0_hsd_type=NAC&p0_hsd_sub_type=FMP&p0_heading=Family%20Pension",
//         onWebViewCreated: (controller){
//           this.controller = controller;
//         },
//       ),
//
//     );
//   }
// }
