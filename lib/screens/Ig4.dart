import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'maindrawer.dart';
class Ig4 extends StatefulWidget {
  const Ig4({Key? key}) : super(key: key);

  @override
  State<Ig4> createState() => _Ig4State();
}

class _Ig4State extends State<Ig4> {
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
        initialUrl: "https://joinindianarmy.nic.in/default.aspx",
        onWebViewCreated: (controller){
          this.controller = controller;
        },
      ),

    );
  }
}