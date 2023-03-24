import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'Aadharotp.dart';
import 'New email.dart';
import 'hmscreen1.dart';

class Aadhaar extends StatefulWidget {
  const Aadhaar({Key? key}) : super(key: key);

  @override
  State<Aadhaar> createState() => _AadhaarState();
}

class _AadhaarState extends State<Aadhaar> {
  @override
  Widget build(BuildContext context) {
    final maxLines;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        backgroundColor: Color(0xFFd3eaf2),
        // 0xFFd3eaf2
        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => E_mail()),
          );
        },
          icon: Icon(Icons.arrow_back,
            color: Colors.black,
          ),),
        title: Text("Verify with Aadhaar Card",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(

        color: Color(0xFFd3eaf2),
        // color: Color(0xFFd3eaf2),
        child: Container(

          alignment: Alignment.center,
          // margin: EdgeInsets.only(left: 25, right: 25),
          // margin: EdgeInsets.only(
          //     top: MediaQuery.of(context).size.width / 20),
          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 20,0,20,0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                    height: size.height*0.45,
                    // width: size.width*,
                    image: AssetImage(
                        "assets/images/Aadhaarcard.png")),
                // SizedBox(
                //   // height: 20,
                //   height: size.height*0.02,
                // ),
                // AutoSizeText(
                //   "Sign Up to Vayu-Samparc",
                //   style: TextStyle(
                //     fontSize: 25,
                //     fontWeight: FontWeight.bold,
                //   ),
                //   minFontSize: 20,
                //   maxFontSize: 25,
                //   maxLines: 1,
                // ),


                AutoSizeText(
                  "Enter your Aadhaar card number to receive a verification code",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  minFontSize: 12,
                  maxFontSize: 15,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  // height: 20,
                  height: size.height*0.02,

                ),
                AutoSizeText(

                  "Aadhar Number",
                  style: TextStyle(
                    fontSize: 25,

                  ),
                  minFontSize: 22,
                  maxFontSize: 25,
                  maxLines: 2,

                  // textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height*0.02,
                  // height: 20,
                ),

              TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    decoration: InputDecoration(

                      border: OutlineInputBorder(),
                      hintText: "Please enter Aadhaar number",

                      filled: true,
                      fillColor: Colors.white,

                    ),
                    validator: (value){
                      if(value! .isEmpty ||!RegExp(r'(^[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}$)' ).hasMatch(value)){
                        return"Enter Aadhar number";
                      }else{
                        return null;
                      }
                    }

                ),
                SizedBox(
                  height: size.height*0.02,
                  // height: 20,
                ),
                SizedBox(
                  // height: 45,
                  height: size.height*0.06,
                  width: double.infinity,
                  child: ElevatedButton(

                    onPressed: ()  {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Aadhaarotp()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFa8d5e5),
                      // primary: Color(0xFF394361),
                      //   0xFFa8d5e5

                    ),
                    child: Text(
                      "Submit",
                    ),

                  ),
                ),
                SizedBox(
                  height: size.height*0.02,
                  // height: 20,
                ),
                SizedBox(
                  // height: 45,
                  height: size.height*0.06,
                  width: double.infinity,
                  child: ElevatedButton(

                    onPressed: ()  {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFa8d5e5),
                      // primary: Color(0xFF394361),


                    ),
                    child: Text(
                      "Skip for now",
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
