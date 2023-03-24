import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'Aadhaarcard.dart';
import 'mobile number.dart';
class E_mail extends StatefulWidget {
  const E_mail({Key? key}) : super(key: key);
  @override
  State<E_mail> createState() => _E_mailState();
}
class _E_mailState extends State<E_mail> {
  @override
  Widget build(BuildContext context) {
    final maxLines;
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        backgroundColor: Color(0xFFd3eaf2),
        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Mobile()),
          );
        },
          icon: Icon(Icons.arrow_back,
            color: Colors.black,
          ),),
        title: Text("Email Address",
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

          margin: EdgeInsets.fromLTRB(MediaQuery
              .of(context)
              .size
              .width / 20, 0, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                    height: size.height * 0.35,
                    // width: size.width*,
                    image: AssetImage(
                        "assets/images/email.png")),
                SizedBox(
                  // height: 20,
                  height: size.height * 0.02,
                ),



                AutoSizeText(
                  "Enter your email address to receive a verification code",
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
                  height: size.height * 0.02,

                ),
                AutoSizeText(
                  "Email Address",
                  style: TextStyle(
                    fontSize: 25,

                  ),
                  minFontSize: 22,
                  maxFontSize: 25,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.02,
                  // height: 20,
                ),

                TextFormField(
                  // onChanged: (value){
                  //   email = value;
                  // },
                  // controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(

                    ),
                  ),

                ),
                SizedBox(
                  height: size.height * 0.02,
                  // height: 20,
                ),
                TextFormField(

                  // onChanged: (value){
                  //   email = value;
                  // },
                  // controller: _emailController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(

                    ),
                  ),


                ),
                SizedBox(
                  // height: 45,
                  height: size.height * 0.03,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Aadhaar()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFa8d5e5),
                      // primary: Color(0xFF394361),
                    ),

                    child: Text(
                      "Verify",
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


