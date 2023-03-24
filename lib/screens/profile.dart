import 'dart:async';
import 'dart:convert';
import 'package:dav2/Models/pfofilenameModel.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'constant.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  late bool private_status;

  List<ProfilenameModel> data = [];

  var nameController = TextEditingController();
  var panController = TextEditingController();
  var aadharController = TextEditingController();
  var suffixController = TextEditingController();
  var dobController = TextEditingController();
  var docController = TextEditingController();
  var dodController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var categoryController = TextEditingController();
  var serviceNumberController = TextEditingController();

  var serviceNumber = "";
  var category = "";
  var name = "";
  var pan = "";
  var aadhar = "";
  var suffix = "";
  var dob = "";
  var doc = "";
  var dod = "";
  var email = "";
  var mobile = "";

  @override
  void initState() {
    super.initState();
    getData();
    checkInternetConnection();
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var serviceNumber = prefs.getString('ServiceNumber') ?? "";
    var cat = prefs.getString('Category') ?? "";
    final response = await http.get(Uri.parse(
        "${baseURL}/PROFILEDETAIL/PROFILEDETAIL/${serviceNumber}/${cat}"));
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('Name', nameController.text);
      var responseBody = jsonDecode(response.body);
      print(responseBody);
      data = (responseBody["items"] as List)
          .map((data) => ProfilenameModel.fromJson(data))
          .toList();
      print(data[0].av_name);
      prefs.setString("name", data[0].av_name);

      if(data[0].private_status == "true") {
        private_status = true;
      }else{
        private_status = false;
      }

      setState(() {
        nameController.text = data[0].av_name;
        serviceNumberController.text = data[0].user_service_no;
        panController.text = data[0].user_pan_no;
        aadharController.text = data[0].user_aadhar_no.toString();
        suffixController.text = data[0].user_chk_suffix;
        dobController.text = data[0].user_dob;
        docController.text = data[0].user_doc;
        dodController.text = data[0].user_dod;
        emailController.text = data[0].user_email_id;
        mobileController.text = data[0].user_mob_no.toString();
      });
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<void> doFlag(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var serviceNumberController = prefs.getString('ServiceNumber') ?? "";
    var cat = prefs.getString('Category') ?? "";

    print(
        "${baseURL}/UPDATE/PRIVACY_FLAG?SERVICE_NO=${serviceNumberController}&CATEGORY=${cat}&FLAG_YN=${value.toString()}");

    final response = await http.put(
        Uri.parse(
            "${baseURL}/UPDATE/PRIVACY_FLAG?SERVICE_NO=${serviceNumberController}&CATEGORY=${cat}&FLAG_YN=${value.toString()}"),
        body: {
          "SERVICE_NO": serviceNumberController,
          "CATEGORY": cat,
          "FLAG_YN": value.toString(),
        });
    print(response.body);
    if (response.statusCode == 200) {
      print("ok");
    }
    // else {
    //   _showMyDialog(response.body);
    // }
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text('VAYU-SAMPARC'))
            ],
          ),
          // backgroundColor: Color(0xFF394361),
          // title: Text(
          //   "Profile",
          //   style: TextStyle(fontSize: 15),
          // ),
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
                    "Profile",
                    style: TextStyle(
                      color: Color(0xFF394361),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListView.separated(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: data.length,
                  separatorBuilder: (context, position) => const SizedBox(
                        height: 10,
                      ),
                  itemBuilder: (context, position) {
                    return Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/profile.jpeg",
                          ),
                          radius: 80,
                        ),

                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Color(0xFF0b0c5b),
                                  // color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Name:",
                                  style: TextStyle(
                                      color: Color(0xFF0b0c5b),
                                      fontWeight: FontWeight.w500
                                      // color: Colors.grey,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Column(
                              children: [
                                Text(data[position].av_name),
                              ],
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 18.0),
                        //   child: Row(
                        //     children: [
                        //   Text(data[position].av_name),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Color(0xFF0b0c5b),

                                  // color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Check Suffix:",
                                  style: TextStyle(
                                      color: Color(0xFF0b0c5b),
                                      fontWeight: FontWeight.w500

                                      // color: Colors.grey,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Column(
                              children: [
                                Text(data[position].user_chk_suffix),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),

                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.call_to_action_outlined,
                                  color: Color(0xFF0b0c5b),

                                  // color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Column(
                              children: [
                                Text(
                                  "PAN No:",
                                  style: TextStyle(
                                      color: Color(0xFF0b0c5b),
                                      fontWeight: FontWeight.w500

                                      // color: Colors.grey,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Column(
                              children: [
                                Text(data[position].user_pan_no),
                              ],
                            ),
                          ],
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20.0),
                        //   child: Row(
                        //     children: [
                        //       Text(data[position].user_pan_no),
                        //     ],
                        //   ),
                        // ),

                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.call_to_action_outlined,
                                  color: Color(0xFF0b0c5b),

                                  // color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Aadhar No:",
                                  style: TextStyle(
                                      color: Color(0xFF0b0c5b),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Column(
                              children: [
                                Text(data[position].user_aadhar_no.toString()),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: Color(0xFF0b0c5b),

                                  // color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Column(
                              children: [
                                Text(
                                  "DOB:",
                                  style: TextStyle(
                                      color: Color(0xFF0b0c5b),
                                      fontWeight: FontWeight.w500

                                      // color: Colors.grey,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Column(
                              children: [
                                Text(data[position].user_dob.toString()),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: Color(0xFF0b0c5b),
                                  // color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Column(
                              children: [
                                Text(
                                  "DOC:",
                                  style: TextStyle(
                                      color: Color(0xFF0b0c5b),
                                      fontWeight: FontWeight.w500
                                      // color: Colors.grey,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Column(
                              children: [
                                Text(data[position].user_doc.toString()),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: Color(0xFF0b0c5b),
                                )
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Column(
                              children: [
                                Text(
                                  "DOD:",
                                  style: TextStyle(
                                      color: Color(0xFF0b0c5b),
                                      fontWeight: FontWeight.w500

                                      // color: Colors.grey,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Column(
                              children: [
                                Text(data[position].user_dod.toString()),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //         child: Text(
                        //       "Allow to hide your mobile no. & email from your coursemates",
                        //       style: TextStyle(
                        //           color: Color(0xFF0b0c5b),
                        //           fontWeight: FontWeight.bold),
                        //     )),
                        //     Column(
                        //       children: [
                        //         Switch(
                        //           value: switchStatus,
                        //           activeColor: Colors.blue,
                        //           inactiveTrackColor: Colors.grey.shade400,
                        //           onChanged: (value) {
                        //             print(doFlag(value));
                        //             doFlag(value);
                        //             setState(() {
                        //               switchStatus = value;
                        //             });
                        //           },
                        //         )
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Allow to hide your mobile no. & email from your coursemates",
                              style: TextStyle(
                                  color: Color(0xFF0b0c5b),
                                  fontWeight: FontWeight.bold),
                            )),
                            Column(
                              children: [
                                Switch(
                                  value: private_status,
                                  activeColor: Colors.blue,
                                  inactiveTrackColor: Colors.grey.shade400,
                                  onChanged: (value) {
                                    print(doFlag(value));
                                    doFlag(value);
                                    setState(() {
                                      private_status = value;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        ),

                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Color(0xFF0b0c5b),

                                  // color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Email:",
                                  style: TextStyle(
                                      color: Color(0xFF0b0c5b),
                                      fontWeight: FontWeight.w500
                                      // color: Colors.grey,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Column(
                              children: [
                                Text(data[position].user_email_id.toString()),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),

                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.call,
                                  color: Color(0xFF0b0c5b),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Mobile No:",
                                  style: TextStyle(
                                      color: Color(0xFF0b0c5b),
                                      fontWeight: FontWeight.w500
                                      // color: Colors.grey,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Column(
                              children: [
                                Text(data[position].user_mob_no.toString()),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ));
  }
}
