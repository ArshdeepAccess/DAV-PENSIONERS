import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'Aadhaarcard.dart';
import 'hmscreen1.dart';
class Aadhaarotp extends StatefulWidget {
  const Aadhaarotp({Key? key}) : super(key: key);

  @override
  State<Aadhaarotp> createState() => _AadhaarotpState();
}

class _AadhaarotpState extends State<Aadhaarotp> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        // border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      // border: Border.all(color: Colors.white),

      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
        // color: Colors.white
      ),
    );
    var code="";
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        backgroundColor: Color(0xFFd3eaf2),

        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Aadhaar()),
          );
        },
          icon: Icon(Icons.arrow_back,
            color: Colors.black,
          ),),
        title: Text("Verification",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(

        color: Color(0xFFd3eaf2),
        child: Container(

          // color: Color(0xFF8893a7),
          alignment: Alignment.center,
          // margin: EdgeInsets.only(left: 25, right: 25),
          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 20,0,20,0),

          child: SingleChildScrollView(
            child: Column(
              children: [
                AutoSizeText(
                  "Verify your Aadhaar Number",
                  style: TextStyle(
                      fontSize: 25,

                      fontWeight: FontWeight.bold

                  ),
                  minFontSize: 22,
                  maxFontSize: 25,
                  maxLines: 1,
                ),
                // AutoSizeText(
                //   "Input the verification code that already sent to your email.",
                //   style: TextStyle(
                //     fontSize: 15,
                //
                //     color: Colors.grey,
                //
                //   ),
                //   minFontSize: 12,
                //   maxFontSize: 15,
                //   maxLines: 2,
                // ),

                SizedBox(
                  // height: 10,
                  height: size.height*0.02,
                ),
                Pinput(
                  length: 6,
                  onChanged: (value){
                    code = value;
                  },

                  // defaultPinTheme: defaultPinTheme,
                  // focusedPinTheme: focusedPinTheme,
                  // submittedPinTheme: submittedPinTheme,
                  // // validator: (s) {
                  // //   return s == '2222' ? null : 'Pin is incorrect';
                  // // },
                  // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  // onCompleted: (pin) => print(pin),
                ),
                SizedBox(
                  // height: 10,
                  height: size.height*0.02,

                ),
                AutoSizeText(
                  "Enter your OTP code here",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  minFontSize: 12,
                  maxFontSize: 15,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  // height: 20,
                  height: size.height*0.02,

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
                      // primary: Color(0xFFa8d5e5),
                    ),
                    child: Text(
                      "Verify Aadhaar card number",
                    ),

                  ),
                ),

                SizedBox(
                  // height: 20,
                  height: size.height*0.02,

                ),
                AutoSizeText("Didn't  received any verification code?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  minFontSize: 12,
                  maxFontSize: 15,
                  maxLines: 1,
                ),
                TextButton(onPressed: (){}, child: Text("RESEND NEW CODE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
