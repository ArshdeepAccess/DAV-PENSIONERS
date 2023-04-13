import 'dart:ui';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dav2/screens/Contacts.dart';
import 'package:dav2/screens/Coursemateshome.dart';
import 'package:dav2/screens/disabilityhome.dart';
import 'package:dav2/screens/echshome.dart';
import 'package:dav2/screens/echsmap.dart';
import 'package:dav2/screens/eppo.dart';
import 'package:dav2/screens/familyhome.dart';
import 'package:dav2/screens/form16.dart';
import 'package:dav2/screens/informationvideo.dart';
import 'package:dav2/screens/maindrawer.dart';
import 'package:dav2/screens/noticeboard.dart';
import 'package:dav2/screens/otherlinks.dart';
import 'package:dav2/screens/por.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Iafba.dart';
import 'Ig6.dart';
import 'Resettlement.dart';
import 'Servicehome.dart';
import 'Updateshome.dart';
import 'faqhome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String _lastVisitTimeText = '';

  // late String _lastVisitTimeText;
  final DateFormat _dateFormat = DateFormat.yMd().add_jm();
  @override
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = "Press the button and start speaking";

  @override

  void initState() {
    super.initState();
    getPermission();
    _lastVisitTimeText = '';
    _getLastVisitTime();
    _speech = stt.SpeechToText();
  }

  Future<void> _getLastVisitTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? lastVisitTimeString = prefs.getString('lastVisitTime');
    if (lastVisitTimeString != null) {
      final DateTime lastVisitTime = DateTime.parse(lastVisitTimeString);
      setState(() {
        _lastVisitTimeText = _dateFormat.format(lastVisitTime);
      });
    } else {
      setState(() {
        _lastVisitTimeText = 'This is your first visit!';
      });
    }
    prefs.setString('lastVisitTime', DateTime.now().toString());
  }
  // Future<String> getLastLoginTime() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String lastLoginTime = prefs.getString('lastLoginTime') ?? 'N/A';
  //   return lastLoginTime;
  // }

  Future<void> getPermission() async {
    await [
      Permission.location,
      Permission.manageExternalStorage,
      Permission.storage,
      Permission.phone
    ].request();

    // Map<Permission, PermissionStatus> statuses = await [Permission.location].request();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF394361),
        title: Text(
          "VAYU-SAMPARC",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          // IconButton(
          //     onPressed: _listen,
          //     // toggleRecording,
          //     icon: Icon(_isListening ? Icons.mic : Icons.mic_none)),

          Image(
              image: AssetImage(
            "assets/images/newlogo.png",
          )),
        ],
      ),
      drawer: Maindrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                child: Container(
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
              height: size.height * 0.28,
              width: size.width * 1.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/B2.jpg",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Card(
              color: Color(0xFFf2fcff),
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width / 40,
                horizontal: MediaQuery.of(context).size.width / 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 30),
                        child: Text(
                          "Services",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF474b50),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 10,),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Eppo()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image:
                                          AssetImage("assets/images/eppo.png"),
                                      // AssetImage("assets/images/eppo-1.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "EPPO",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: 30,),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Form16()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image: AssetImage(
                                          // "assets/images/form16-1.png"),
                                       "assets/images/form16.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "Form 16",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: 30,),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Por()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image:
                                          // AssetImage("assets/images/por-1.png"),
                                      AssetImage("assets/images/por.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "POR",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: 30,),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                    ],
                  ),
                  // SizedBox(height: 10,),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Iafba()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/iafba-logo.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "IAFBA",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: 30,),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Ig6()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/afgis_logo.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "AFGIS",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: 30,),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EchsMap()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image:
                                          // AssetImage("assets/images/echs-1.png"),
                                      AssetImage("assets/images/echs.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "ECHS/URC",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Coursemates()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image: AssetImage(
                                          // "assets/images/coursemates1.png"),
                                         "assets/images/coursemates.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "Course Mates",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: 30,),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Resettlement1()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image: AssetImage(
                                          // "assets/images/iafpc.png"),
                                             "assets/images/resettlement.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "IAFPC",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: Column(
                          children: [],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                ],
              ),
            ),
            Card(
              color: Color(0xFFf2fcff),
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width / 150,
                horizontal: MediaQuery.of(context).size.width / 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 30),
                        child: Text(
                          "Information",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF474b50),
                          ),
                        ),
                      )
                    ],
                  ),
                  // SizedBox(height: 10,),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Update1()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image: AssetImage(
                                          // "assets/images/update1.png"),
                                      "assets/images/update.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "Updates",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: 30,),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NoticeBoard()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image: AssetImage(
                                          // "assets/images/notice.png"),
                                             "assets/images/noticeboard.png"),
    height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "Notice Board",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InformationVideo()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image:
                                          AssetImage("assets/images/video.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "Information Video",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: 30,),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Service1()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/servicep.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "Service Pension",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Disability1()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/disabilityp.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "Disability Pension",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: 30,),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Family1()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/familyp.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "Family Pension",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: 30,),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Faq1()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image:
                                          AssetImage("assets/images/faq.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "FAQs",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: 30,),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Contacts()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/contacts.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "Contact Us",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: 30,),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Echs1()),
                            );
                          },
                          child: Card(
                            color: Color(0xFFd3eaf2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/welfare.png"),
                                      height: size.height * 0.02,
                                      width: size.width * 0.15),
                                ),
                                Container(
                                    height: 20,
                                    child: Text(
                                      "ECHS & Welfare",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                ],
              ),
            ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => OtherLinks()),
            //     );
            //   },
            //   child: Align(
            //     alignment: Alignment.bottomRight,
            //     child: const AutoSizeText(
            //       "External Links....",
            //       style: TextStyle(
            //         fontSize: 15,
            //       ),
            //       minFontSize: 3,
            //       maxFontSize: 18,
            //       maxLines: 2,
            //     ),
            //   ),
            // ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last visit: $_lastVisitTimeText',),
                // Text('Last Login: ${_getLastLoginTime()}'),

              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 2.0),
              //     child: Column(
              //       children: [
              //       FutureBuilder<String>(
              //         future: getLastLoginTime(),
              //         builder: (context, snapshot) {
              //           if (snapshot.connectionState == ConnectionState.waiting) {
              //             return CircularProgressIndicator();
              //           } else if (snapshot.hasError) {
              //             return Text('Last Visit: Never');
              //           } else {
              //             return Text('Last Visit: ${snapshot.data}');
              //           }
              //         },
              //       ),
              //
              //     ],),
              //   ),
              // ),
              Expanded(
                child:   Column(
                children: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              child: AlertDialog(
                                title: Text(
                                    "You are going out of Vayu-Samparc. If you are okay with it, you can proceed."),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => OtherLinks()),
                                        );
                                      },
                                      child: Text("Yes")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("No")),
                                ],
                              ),
                            );
                          });
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: const AutoSizeText(
                        "External Links....",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        minFontSize: 3,
                        maxFontSize: 18,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],),),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     FutureBuilder<String>(
            //       future: getLastLoginTime(),
            //       builder: (context, snapshot) {
            //         if (snapshot.connectionState == ConnectionState.waiting) {
            //           return CircularProgressIndicator();
            //         } else if (snapshot.hasError) {
            //           return Text('Error: ${snapshot.error}');
            //         } else {
            //           return Text('Last Login: ${snapshot.data}');
            //         }
            //       },
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
          }),
        );
      } else {
        setState(() => _isListening = false);
        _speech.stop();
      }
    }
  }
  // void toggleRecording() {
  //
  //   SpeechApi.toggleRecording(
  //     onResult: (String text) => setState(() => this.text=text),
  //
  //   );
  // }
}
