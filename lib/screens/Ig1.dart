import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'maindrawer.dart';
class Ig1 extends StatefulWidget {
  const Ig1({Key? key}) : super(key: key);

  @override
  State<Ig1> createState() => _Ig1State();
}

class _Ig1State extends State<Ig1> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFd3eaf2),
        title: Row(
          children: [
            Image(
              image: AssetImage(
                "assets/images/dav-new-logo.png",
              ),
              fit: BoxFit.contain,
              height: 60,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('VAYU-SAMPARC'))
          ],
        ),
      ),
      // drawer: Maindrawer(),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "http://www.ksb.gov.in/",
        onWebViewCreated: (controller){
          this.controller = controller;
        },
      ),

    );
  }
}

