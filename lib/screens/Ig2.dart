import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'maindrawer.dart';
class Ig2 extends StatefulWidget {
  const Ig2({Key? key}) : super(key: key);

  @override
  State<Ig2> createState() => _Ig2State();
}

class _Ig2State extends State<Ig2> {
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
        actions: [
          IconButton(onPressed: (){},
              // toggleRecording,
              icon: Icon(Icons.mic)),
          Image(image: AssetImage("assets/images/newlogo.png"))],
      ),
      drawer: Maindrawer(),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://www.india.gov.in/",
        onWebViewCreated: (controller){
          this.controller = controller;
        },
      ),

    );
  }
}


