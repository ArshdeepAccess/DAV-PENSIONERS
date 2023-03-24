// import 'dart:convert';
// import 'package:dav2/Models/CourseMatesModel.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'constant.dart';
// class Coursemates extends StatefulWidget {
//   const Coursemates({Key? key}) : super(key: key);
//
//   @override
//   State<Coursemates> createState() => _CoursematesState();
// }
//
// class _CoursematesState extends State<Coursemates> {
//   List<CourseMatesModel> data = [];
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   Future<void> getData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var serviceNumber = prefs.getString('ServiceNumber') ?? "";
//     final response = await http.get(Uri.parse("${baseURL}/DAVPORTAL//COURSEMATE/${serviceNumber}"));
//     if (response.statusCode == 200) {
//       var responseBody = jsonDecode(response.body);
//       data = (responseBody["items"] as List).map((data) => CourseMatesModel.fromJson(data)).toList();
//       setState(() {});
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xFFd3eaf2),
//           title: Row(
//             children: [
//               Image(image: AssetImage("assets/images/dav-new-logo.png",
//               ),
//                 fit: BoxFit.contain,
//                 height: 60,),
//               Container(
//                   padding: const EdgeInsets.all(8.0), child: Text('VAYU-SAMPARC'))
//             ],
//           ),
//           // backgroundColor: Color(0xFF394361),
//           // title: Text(
//           //     "VAYU-SAMPARC"
//           //   // "SERVING THOSE WHO SERVED US",
//           //   // style: TextStyle(fontSize: 15),
//           // ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 alignment: Alignment.topLeft,
//                 // height: 40,
//                 // height: size.height * 0.08,
//                 // width: size.width * 2,
//                 // width: 400,
//                 // color: Colors.white,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: MediaQuery.of(context).size.width / 20,
//                     vertical: MediaQuery.of(context).size.width / 20,
//                   ),
//                   // padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
//                   child: Text(
//                     "CourseMates",
//                     style: TextStyle(
//                       color: Color(0xFF394361),
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//
//               ListView.separated(
//                   padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
//                   shrinkWrap: true,
//                   primary: false,
//                   itemCount: data.length,
//                   separatorBuilder: (context, position) => const SizedBox(
//                     height: 10,
//                   ),
//                   itemBuilder: (context, position) {
//                     return
//                       Column(
//                         children: [
//                               Row(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       CircleAvatar(
//
//                                         backgroundImage:
//                                         AssetImage(
//                                           "assets/images/User1.png",
//                                         ),
//                                         backgroundColor: Colors.transparent,
//                                         radius: 20,
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Column(
//                                     children: [
//                                       Text(data[position].avName,
//                                         style:TextStyle( fontWeight: FontWeight.bold,),
//                                       ),
//                                     ],
//                                   ),
// //                                   SizedBox(
// //                                     width: 5,
// //                                   ),
// //                                   Column(
// // mainAxisAlignment: MainAxisAlignment.end,
// //                                     children: [
// //                                       Text(data[position].penServiceNo.toString(),
// //                                       style:TextStyle( fontWeight: FontWeight.bold,),
// //                                       ),
// //                                     ],
// //                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 1,
//                               ),
//                               Row(
//                                 children: [
//
//                                   Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(left: 45.0),
//                                         child: Text(data[position].penServiceNo.toString(),
//                                           style:TextStyle( fontWeight: FontWeight.bold,),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 45.0),
//                             child: Row(
//                               children: [
//
//                                 Text(data[position].penEmailId),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 45.0),
//                          child: Row(
//                             children: [
//
//                               Text(data[position].penMobNo),
//                             ],
//                           ),
//                             ),
//                           SizedBox(
//                             height: 5,
//                           ),
//
//                               Divider(
//                                 height: 4,
//                                 thickness: 0.1,
//                                 color: Colors.grey,
//                               ),
//
//                           // Row(
//                           //   // mainAxisAlignment:
//                           //   // MainAxisAlignment.spaceBetween,
//                           //   children: [
//                           //     Expanded(
//                           //       child: Column(
//                           //         crossAxisAlignment: CrossAxisAlignment.start,
//                           //         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           //         children: [
//                           //           // const Text("Service  No.", style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold)),
//                           //           Text(data[position].penServiceNo.toString()),
//                           //         ],
//                           //       ),
//                           //     ),
//                           //     Column(
//                           //       crossAxisAlignment: CrossAxisAlignment.start,
//                           //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           //       children: [
//                           //         // const Text("Officer Name",
//                           //         //     style: TextStyle(
//                           //         //       fontSize: 15,
//                           //         //       color: Colors.black,
//                           //         //       fontWeight:
//                           //         //       FontWeight.bold,
//                           //         //     )),
//                           //         Text(data[position].avName),
//                           //       ],
//                           //     ),
//                           //   ],
//                           // ),
//                           // SizedBox(),
//                           // Row(
//                           //
//                           //   children: [
//                           //     Expanded(child:
//                           //     Column(
//                           //       crossAxisAlignment: CrossAxisAlignment.start,
//                           //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           //       children: [
//                           //         // const Text("Email Id",
//                           //         //     style: TextStyle(
//                           //         //       fontSize: 15,
//                           //         //       color: Colors.black,
//                           //         //       fontWeight:
//                           //         //       FontWeight.bold,
//                           //         //     )),
//                           //         Text(data[position].penMobNo),
//                           //       ],
//                           //     ),
//                           //     ),
//                           //     Column(
//                           //       crossAxisAlignment: CrossAxisAlignment.start,
//                           //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           //       children: [
//                           //         // const Text("Mobile Number",
//                           //         //     style: TextStyle(
//                           //         //       fontSize: 15,
//                           //         //       color: Colors.black,
//                           //         //       fontWeight:
//                           //         //       FontWeight.bold,
//                           //         //     )),
//                           //         Text(data[position].penEmailId),
//                           //       ],
//                           //     ),
//                           //   ],
//                           // ),
//                         ],
//                       );
//                   }),
//             ],
//           ),
//         )
//     );
//   }
// }
import 'dart:convert';
import 'package:dav2/Models/CourseMatesModel.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'constant.dart';
class Coursemates extends StatefulWidget {
  const Coursemates({Key? key}) : super(key: key);

  @override
  State<Coursemates> createState() => _CoursematesState();
}

class _CoursematesState extends State<Coursemates> {
  List<CourseMatesModel> data = [];

  @override
  void initState() {
    super.initState();
    getData();
    checkInternetConnection();
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var serviceNumber = prefs.getString('ServiceNumber') ?? "";
    final response = await http.get(Uri.parse("${baseURL}/DAVPORTAL//COURSEMATE/${serviceNumber}"));
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      data = (responseBody["items"] as List).map((data) => CourseMatesModel.fromJson(data)).toList();
      setState(() {});
    } else {
      throw Exception('Failed to load album');
    }
  }
  bool isLoading = true;
  bool isInternetConnection = true;
  void checkInternetConnection()async{
    bool internetConnection = await InternetConnectionChecker().hasConnection;
    if(internetConnection == true)
    {
      getData();
    }
    else
    {
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFd3eaf2),
          title: Row(
            children: [
              Image(image: AssetImage("assets/images/dav-new-logo.png",
              ),
                fit: BoxFit.contain,
                height: 60,),
              Container(
                  padding: const EdgeInsets.all(8.0), child: Text('VAYU-SAMPARC'))
            ],
          ),
        ),
        body: SingleChildScrollView(
         child: Container(
           color: Color(0xFFf2fcff),
           child: Column(
             children: [
               Container(
                 alignment: Alignment.topLeft,
                 child: Padding(
                   padding: EdgeInsets.symmetric(
                     horizontal: MediaQuery.of(context).size.width / 20,
                     vertical: MediaQuery.of(context).size.width / 20,
                   ),
                   // padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                   child: Text(
                     "Course Mates",
                     style: TextStyle(
                       color: Color(0xFF394361),
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
               ),

               ListView.separated(
                   padding: EdgeInsets.all(MediaQuery.of(context).size.width / 120),
                   shrinkWrap: true,
                   primary: false,
                   itemCount: data.length,
                   separatorBuilder: (context, position) => const SizedBox(
                     height: 10,
                   ),
                   itemBuilder: (context, position) {
                     return Card(
                       child: ListTile(
                         leading: CircleAvatar(
                           radius: 20,
                           backgroundImage: AssetImage("assets/images/User1.png",),
                           backgroundColor: Colors.transparent,
                         ),
                         title: Row(
                           children: [
                             Expanded(
                               flex: 7,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(top: 8.0),
                                     child: Text(data[position].avName,
                                       style: TextStyle(fontWeight: FontWeight.w500),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                             Expanded(flex: 3,
                               child: Column(
                                 children: [
                                   Text(data[position].penServiceNo.toString(),
                                     style: TextStyle(fontWeight: FontWeight.w500),
                                   ),
                                 ],
                               ),
                             ),
                           ],
                         ),

                         subtitle: Column(
                           children: [
                             Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(top: 8.0),
                                   child: Text(data[position].penMobNo,
                                     style: TextStyle(
                                       color: Colors.black,
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                             Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(top: 8.0),
                                   child: Text(data[position].penEmailId,
                                     style: TextStyle(
                                       color: Colors.black,
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(
                               height: 5,
                             ),
                             // Divider(
                             //   height: 10,
                             //   thickness: 0.2,
                             //
                             //   color: Colors.grey,
                             // ),
                           ],
                         ),
                       ),
                     );
                   }),
             ],
           ),
         ),
        )
    );
  }
}
