// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import 'maindrawer.dart';
// class Placement extends StatefulWidget {
//   const Placement({Key? key}) : super(key: key);
//
//   @override
//   State<Placement> createState() => _PlacementState();
// }
//
// class _PlacementState extends State<Placement> {
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
//       body:  WebView(
//         javascriptMode: JavascriptMode.unrestricted,
//         initialUrl: "https://www.iafpc.co.in/",
//         onWebViewCreated: (controller){
//           this.controller = controller;
//         },
//       ),
//     );
//   }
// }
