import 'dart:convert';
import 'package:dav2/Models/pfofilenameModel.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'constant.dart';
import 'hmscreen1.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late bool private_status;
  List<ProfilenameModel> data = [];
  bool _isEditable = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
      if (data[0].private_status == "true") {
        private_status = true;
      } else {
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
        "${baseURL}/UPDATE/PRIVACY_FLAG?SERVICE_NO=${serviceNumberController}&CATEGORY=${cat}&FLAG_YN=${value.toString()}"
        "&EMAIL=${emailController.text}&MOBILE=${mobileController.text.toString()}");

    final response = await http.put(
        Uri.parse(
            "${baseURL}/UPDATE/PRIVACY_FLAG?SERVICE_NO=${serviceNumberController}&CATEGORY=${cat}&FLAG_YN=${value.toString()}"
            "&EMAIL=${emailController.text}&MOBILE=${mobileController.text.toString()}"),
        body: {
          "SERVICE_NO": serviceNumberController,
          "CATEGORY": cat,
          "FLAG_YN": value.toString(),
          "EMAIL": emailController.text.toString(),
          "MOBILE": mobileController.text.toString(),
        });
    print(response.body);
    if (response.statusCode == 200) {
      print("ok");
    }
    _showMyDialog1("Record Updated Successfully");
  }

  Future<void> _showMyDialog1(message) async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        // title: const Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            // onPressed: () => Navigator.pop(context, 'OK'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
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
                padding: const EdgeInsets.all(8.0), child: Text('VAYU-SAMPARC'))
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView.separated(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
            shrinkWrap: true,
            primary: false,
            itemCount: data.length,
            separatorBuilder: (context, position) => const SizedBox(
                  height: 10,
                ),
            itemBuilder: (context, position) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/profile.jpeg",
                      ),
                      radius: 80,
                    ),
                  ),
                  SizedBox(
                    // height: 15,
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                    child: TextFormField(
                      readOnly: true,
                      controller: nameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusColor: Colors.transparent,
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    // height: 15,
                    height: size.height * 0.01,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                    child: TextFormField(
                      readOnly: true,
                      controller: suffixController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusColor: Colors.transparent,
                        labelText: 'Check Suffix',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      ),
                    ),
                  ),

                  SizedBox(
                    // height: 15,
                    height: size.height * 0.01,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                    child: TextFormField(
                      readOnly: true,
                      controller: panController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusColor: Colors.transparent,
                        labelText: 'Pan',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.01,
                    // height: 15,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                    child: TextFormField(
                      readOnly: true,
                      controller: aadharController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusColor: Colors.transparent,
                        labelText: 'Aadhar',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                    // height: 15,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                    child: TextFormField(
                      readOnly: true,
                      controller: dobController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusColor: Colors.transparent,
                        labelText: 'DOB',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                    // height: 15,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                    child: TextFormField(
                      readOnly: true,
                      controller: docController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusColor: Colors.transparent,
                        labelText: 'DOC',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                    // height: 15,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                    child: TextFormField(
                      readOnly: true,
                      controller: dodController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusColor: Colors.transparent,
                        labelText: 'DOD',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   // height: 40,
                  //   height: size.height * 0.05,
                  //   child: TextFormField(
                  //     readOnly: true,
                  //     controller: dodController,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: 'DOD',
                  //       // filled: true,
                  //       // fillColor: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
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
                    height: size.height * 0.01,
                    // height: 15,
                  ),
                  SizedBox(
                    // height: 40,
                    height: size.height * 0.06,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 8,
                          // child: TextFormField(
                          //   readOnly: false,
                          //   controller: emailController,
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter your email';
                          //     } else if (!RegExp(
                          //             r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                          //         .hasMatch(value)) {
                          //       return 'Please enter a valid email';
                          //     }
                          //     return null;
                          //   },
                          //   enabled: _isEditable,
                          //   decoration: const InputDecoration(
                          //     border: OutlineInputBorder(),
                          //     labelText: 'Email Id',
                          //   ),
                          // ),
                          child: TextFormField(
                            readOnly: false,
                            controller: emailController,
    validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!RegExp(
                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
            .hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      enabled: _isEditable,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              focusColor: Colors.transparent,
                              labelText: 'Email Id',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              emailController.text = "";
                              _isEditable = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                    // height: 15,
                  ),
                  SizedBox(
                    // height: 40,
                    height: size.height * 0.06,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: TextFormField(
                            readOnly: false,
                            controller: mobileController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              final phoneRegExp = RegExp(r'^\d{10}$');
                              if (!phoneRegExp.hasMatch(value)) {
                                return 'Please enter a valid 10-digit phone number';
                              }
                              return null;
                            },
                            enabled: _isEditable,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              focusColor: Colors.transparent,
                              labelText: 'Mobile Number',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              mobileController.text = "";
                              _isEditable = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        doFlag(isLoading);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF394361),
                    ),
                    child: const Text('Submit'),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
