// import 'dart:convert';
// import 'package:dav2/Models/service_models/dataservice.dart';
// import 'package:dav2/screens/pdf1.dart';
// import 'package:dio/dio.dart';
// import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// Future<Service> fetchAlbum() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var cat = prefs.getString('Category') ?? "";
//
//   if (cat == "O") {
//     cat = "MNO";
//   } else {
//     cat = "MNA";
//   }
//   print(
//       "https://iafpensioners.gov.in/ords/dav_portal/NAC/SERVICEPENSION/${cat}");
//   final response = await http.get(Uri.parse(
//       'https://iafpensioners.gov.in/ords/dav_portal/NAC/SERVICEPENSION/${cat}'));
//   if (response.statusCode == 200) {
//     return Service.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
//
// class Service1 extends StatefulWidget {
//   const Service1({Key? key}) : super(key: key);
//
//   @override
//   State<Service1> createState() => _Service1State();
// }
//
// class _Service1State extends State<Service1> {
//   String? localPath;
//   Future<Service>? futureAlbum;
//
//   void initState() {
//     super.initState();
//     checkInternetConnection();
//     futureAlbum = fetchAlbum();
//   }
//   bool isLoading = true;
//   bool isInternetConnection = true;
//   void checkInternetConnection()async{
//     bool internetConnection = await InternetConnectionChecker().hasConnection;
//     if(internetConnection == true)
//     {
//       fetchAlbum();
//     }
//     else
//     {
//       setState(() {
//         isInternetConnection = false;
//       });
//       _showMyDialog("Please check your internet connectivity");
//     }
//   }
//   Future<void> _showMyDialog(message) async {
//     showDialog<String>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         title: const Text('No Connection'),
//         content: Text(message),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.pop(context, 'OK'),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
//   Future<void> saveFile(url) async {
//     var dir = await DownloadsPathProvider.downloadsDirectory;
//     if (dir != null) {
//       String saveName = url.split('/').last;
//       String savePath = "${dir.path}/$saveName";
//
//       Fluttertoast.showToast(
//           msg: "Downloading Start",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//
//       try {
//         await Dio().download(url, savePath,
//             onReceiveProgress: (received, total) {
//           if (total != -1) {
//             print("${(received / total * 100).toStringAsFixed(0)}%");
//           }
//         });
//         Fluttertoast.showToast(
//             msg: "File is saved to download folder.",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0);
//       } on DioError catch (e) {
//         Fluttertoast.showToast(
//             msg: e.message.toString(),
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0);
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final maxLines;
//
//     return Scaffold(
//         backgroundColor: Color(0xFFf2fcff),
//         appBar: AppBar(
//           backgroundColor: Color(0xFFd3eaf2),
//           title: Row(
//             children: [
//               Image(
//                 image: AssetImage(
//                   "assets/images/dav-new-logo.png",
//                 ),
//                 fit: BoxFit.contain,
//                 height: 60,
//               ),
//               Container(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text('VAYU-SAMPARC'))
//             ],
//           ),
//         ),
//         body: ListView(
//           children: [
//             Container(
//               alignment: Alignment.topLeft,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: MediaQuery.of(context).size.width / 20,
//                   vertical: MediaQuery.of(context).size.width / 20,
//                 ),
//
//                 child: Text(
//                   "Service Pension",
//                   style: TextStyle(
//                     color: Color(0xFF394361),
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             Center(
//                 child: FutureBuilder<Service>(
//               future: futureAlbum,
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: 5,
//                           right: 5,
//                         ),
//
//                         child: Container(
//                             color: Colors.white,
//                             // color: Color(0xFFe7f2f9),
//                             child: ListView.separated(
//                                 primary: false,
//                                 itemCount: snapshot.data!.items.length,
//                                 separatorBuilder: (context, position) =>
//                                     SizedBox(
//                                       height: 0,
//                                     ),
//                                 shrinkWrap: true,
//                                 itemBuilder: (context, position) {
//                                   return Table(
//                                     columnWidths: const {
//                                       0: FixedColumnWidth(50),
//                                       1: FlexColumnWidth(),
//                                       2: FixedColumnWidth(50),
//                                       3: FixedColumnWidth(50),
//                                     },
//                                     border: TableBorder.all(
//                                       color: Colors.grey,
//                                     ),
//                                     children: [
//                                       TableRow(
//                                         //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Padding(
//                                             padding: EdgeInsets.all(
//                                                 MediaQuery.of(context)
//                                                         .size
//                                                         .width /
//                                                     40),
//                                             // padding: const EdgeInsets.all(8.0),
//                                             child: Text(snapshot
//                                                 .data!.items[position].hsd_sr_no
//                                                 .toString()),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.all(
//                                                 MediaQuery.of(context)
//                                                         .size
//                                                         .width /
//                                                     70),
//                                             // padding: const EdgeInsets.all(8.0),
//                                             child: Text(snapshot.data!
//                                                 .items[position].hsd_detail
//                                                 .toString()),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.all(
//                                                 MediaQuery.of(context)
//                                                         .size
//                                                         .width /
//                                                     50),
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 Navigator.push(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             pdf1(snapshot
//                                                                 .data!
//                                                                 .items[position]
//                                                                 .hsd_pdf_link
//                                                                 .toString())));
//                                               },
//                                               child: Icon(
//                                                 Icons.picture_as_pdf,
//                                                 color: Colors.red,
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.all(
//                                                 MediaQuery.of(context)
//                                                         .size
//                                                         .width /
//                                                     50),
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 saveFile(snapshot
//                                                     .data!
//                                                     .items[position]
//                                                     .hsd_pdf_link
//                                                     .toString());
//                                               },
//                                               child: Icon(
//                                                 Icons.download,
//                                                 color: Colors.red,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   );
//                                 })),
//                       )
//                     ],
//                   );
//                 } else if (snapshot.hasError) {
//                   return Text('${snapshot.error}');
//                 }
//
//                 return CircularProgressIndicator();
//               },
//             )),
//           ],
//         ));
//   }
// }
import 'dart:convert';
import 'package:dav2/screens/pdf.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Models/Service_model.dart';

class Service1 extends StatefulWidget {
  const Service1({Key? key}) : super(key: key);

  @override
  State<Service1> createState() => _Service1State();
}

class _Service1State extends State<Service1> {
  List<ServiceModel> data = [];

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var cat = prefs.getString('Category') ?? "";

    if (cat == "O") {
      cat = "MNO";
    } else {
      cat = "MNA";
    }
    print(
        "https://iafpensioners.gov.in/ords/dav_portal/NAC/SERVICEPENSION/${cat}");
    final response = await http.get(Uri.parse(
        'https://iafpensioners.gov.in/ords/dav_portal/NAC/SERVICEPENSION/${cat}'));
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      data = (responseBody["items"] as List)
          .map((data) => ServiceModel.fromJson(data))
          .toList();
      setState(() {});
    } else {
      throw Exception('Failed to load album');
    }
  }

  bool isLoading = true;
  bool isInternetConnection = true;
  void checkInternetConnection() async {
    bool internetConnection = await InternetConnectionChecker().hasConnection;
    if (internetConnection == true) {
      getData();
    } else {
      setState(() {
        isInternetConnection = false;
      });
      _showMyDialog("Please check your internet connectivity");
    }
  }

  Future<void> _showMyDialog(message) async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('No Connection'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> saveFile(url) async {
    var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      String saveName = url.split('/').last;
      String savePath = "${dir.path}/$saveName";

      Fluttertoast.showToast(
          msg: "Downloading Start",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      try {
        await Dio().download(url, savePath,
            onReceiveProgress: (received, total) {
          if (total != -1) {
            print("${(received / total * 100).toStringAsFixed(0)}%");
          }
        });
        Fluttertoast.showToast(
            msg: "File is saved to download folder.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } on DioError catch (e) {
        Fluttertoast.showToast(
            msg: e.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFf2fcff),
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
                padding: const EdgeInsets.all(8.0), child: Text('VAYU-SAMPARC'))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20,
                  vertical: MediaQuery.of(context).size.width / 20,
                ),
                child: Text(
                  "Service Pension",
                  style: TextStyle(
                    color: Color(0xFF394361),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: Container(
                  color: Colors.white,
                  // color: Color(0xFFe7f2f9),
                  child: ListView.separated(
                      primary: false,
                      itemCount: data.length,
                      separatorBuilder: (context, position) => SizedBox(
                            height: 0,
                          ),
                      shrinkWrap: true,
                      itemBuilder: (context, position) {
                        return Container(
                          child: Table(
                            columnWidths: const {
                              0: FixedColumnWidth(50),
                              1: FlexColumnWidth(),
                              2: FixedColumnWidth(50),
                              3: FixedColumnWidth(50),
                            },
                            border: TableBorder.all(
                              color: Colors.grey,
                            ),
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width / 40),
                                    child: Text(data[position].sno.toString()),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width / 40),
                                    child: Text(
                                        data[position].hsd_detail.toString()),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width / 70),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => pdf(
                                                  data[position]
                                                      .hsd_pdf_link
                                                      .toString()),
                                            ));
                                      },
                                      child: Icon(
                                        Icons.picture_as_pdf,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width / 50),
                                    child: GestureDetector(
                                      onTap: () {
                                        saveFile(data[position]
                                            .hsd_pdf_link
                                            .toString());
                                      },
                                      child: Icon(
                                        Icons.download,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      })),
            )
          ],
        ),
      ),
    );
  }
}
