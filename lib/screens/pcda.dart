import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'maindrawer.dart';
class Pcda extends StatefulWidget {
  const Pcda({Key? key}) : super(key: key);

  @override
  State<Pcda> createState() => _PcdaState();
}

class _PcdaState extends State<Pcda> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF394361),
        title: Text(
          "VAYU-SAMPARC",
          style: TextStyle(fontSize: 20),
        ),
        // actions: [
        //   IconButton(onPressed: (){},
        //       // toggleRecording,
        //       icon: Icon(Icons.mic)),
        //   Image(image: AssetImage("assets/images/newlogo.png"))],
      ),
      drawer: Maindrawer(),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://pcdaopune.gov.in/web/index",
        onWebViewCreated: (controller){
          this.controller = controller;
        },
      ),

    );
  }
}
