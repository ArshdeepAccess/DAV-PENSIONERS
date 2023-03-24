import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

import 'hmscreen1.dart';
class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
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
            MaterialPageRoute(builder: (context) =>HomeScreen()),
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
                          "assets/images/password.png")),
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
                  "Your new password must be different from previously used password.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "New Password",
                      style: TextStyle(
                        fontSize: 15,

                      ),
                      minFontSize: 12,
                      maxFontSize: 15,
                      maxLines: 1,

                    ),
                  ],
                ),
                SizedBox(
                  height: size.height*0.01,
                  // height: 20,
                ),

                TextFormField(

                  decoration: InputDecoration(

                    border: OutlineInputBorder(

                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*0.01,
                  // height: 20,
                ),
                AutoSizeText(
                  "Confirm password",
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

                    border: OutlineInputBorder(

                    ),
                  ),
                ),

                SizedBox(
                  height: size.height*0.02,
                  // height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 4),
                  child: TextButton(onPressed: (){}, child: Text("RESEND NEW CODE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
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
                      "Save",
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
