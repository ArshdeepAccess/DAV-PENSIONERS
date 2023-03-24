import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'Forgetotp.dart';
import 'hmscreen1.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({Key? key}) : super(key: key);
  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  @override
  Widget build(BuildContext context) {
    final maxLines;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        backgroundColor: Color(0xFFd3eaf2),
        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
          icon: Icon(Icons.arrow_back,
            color: Colors.black,
          ),),
        title: Text("Forget Password",
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
crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 20),
                  child: Image(
                      height: size.height*0.35,
                      // width: size.width*,
                      image: AssetImage(
                          "assets/images/forgetpassword.png")),
                ),
                SizedBox(
                  // height: 20,
                  height: size.height*0.02,
                ),
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
                  "Please enter your email address to get a verification code.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
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
                  "Email Address",
                  style: TextStyle(
                    fontSize: 15,

                  ),
                  minFontSize: 12,
                  maxFontSize: 15,
                  maxLines: 1,

                ),
                SizedBox(
                  height: size.height*0.01,
                  // height: 20,
                ),

                TextFormField(

                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(

                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*0.01,
                  // height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 4),
                  child: AutoSizeText(
                    "Try another way",
                    style: TextStyle(
                      fontSize: 15,
color: Colors.red,
                    ),
                    minFontSize: 12,
                    maxFontSize: 15,
                    maxLines: 1,

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
                            builder: (context) => ForgetOtp()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFa8d5e5),
                      // primary: Color(0xFF394361),


                    ),
                    child: Text(
                      "Send",
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
