import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'maindrawer.dart';
class SparshWebview extends StatefulWidget {
  const SparshWebview({Key? key}) : super(key: key);

  @override
  State<SparshWebview> createState() => _SparshWebviewState();
}

class _SparshWebviewState extends State<SparshWebview> {
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
        //   Image(image: AssetImage("assets/images/sparsh-logo.png"))],
      ),
      drawer: Maindrawer(),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://sparsh.defencepension.gov.in/",
        onWebViewCreated: (controller){
          this.controller = controller;
        },
      ),

    );
  }
}
