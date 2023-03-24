import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'maindrawer.dart';
class NokLogin extends StatefulWidget {
  const NokLogin({Key? key}) : super(key: key);

  @override
  State<NokLogin> createState() => _NokLoginState();
}

class _NokLoginState extends State<NokLogin> {
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
      body:  WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://iafpensioners.gov.in/ords/dav_portal/r/dte_av/nok-login?P0_ISMOBILE=1",
        onWebViewCreated: (controller){
          this.controller = controller;
        },
      ),

    );
  }
}

