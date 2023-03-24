import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'Registeryourself.dart';
class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF394361),
        // backgroundColor: Color(0xFF394361),
        elevation: 0,
        title: Text("Registration",
          style: TextStyle(
          color: Colors.white,
        ),
        ),

      ),
      body: Container(
        // color: Color(0xFFf2fcff),
        color: Color(0xFFa8d5e5),
           // color: Color(0xFFf2fcff),
        // height: 700,
        height: size.height*0.9,
        width: size.width*40,
        // width: 400,
        child: SingleChildScrollView(
          child: Column(

            children: [
              Container(
                alignment: Alignment.topLeft,
                height: size.height*0.88,
                width: size.width*35,
                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width /18,0,20,0),
                // margin: EdgeInsets.only(left: 25, right: 25),
                // color: Color(0xFFd3eaf2),
                // color: Color(0xFFa8d5e5),
                color: Color(0xFFf2fcff),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                        MediaQuery.of(context).size.width /
                            30,
                        vertical:
                        MediaQuery.of(context).size.width /
                            50,
                      ),
                      child: AutoSizeText("Dear pensioner.",
                        style: TextStyle(

                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5760c8)
                        ),
                        minFontSize: 12,
                        maxFontSize: 15,
                        maxLines: 1,
                      ),

                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                            MediaQuery.of(context).size.width /
                                40,
                            vertical:
                            MediaQuery.of(context).size.width /
                                50,
                          ),
                          child: AutoSizeText("Linking of Aadhar to your account is OPTIONAL as of now.However, it is "
                              "recommended that you link your Aadhar number with your account for availing seamless and faster access and"
                              "to avail other features  Aadhar linking as incorporated from time to time.",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5760c8)
                            ),
                            minFontSize: 12,
                            maxFontSize: 15,
                            maxLines: 7,
                          ),

                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                            MediaQuery.of(context).size.width /
                                40,
                            vertical:
                            MediaQuery.of(context).size.width /
                                50,
                          ),
                          child: AutoSizeText("If yes then only obtain the Aadhar number  and registered mobile number.",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                            ),
                            minFontSize: 12,
                            maxFontSize: 15,
                            maxLines: 2,
                          ),

                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                            MediaQuery.of(context).size.width /
                                40,
                            vertical:
                            MediaQuery.of(context).size.width /
                                50,
                          ),
                          child: AutoSizeText("You can verify Mobile no., Aadhaar no., Email ID after Registration.",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                                color: Color(0xFF5760c8)

                            ),
                            minFontSize: 12,
                            maxFontSize: 15,
                            maxLines: 2,
                          ),

                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height*0.45,
                    ),
                    Column(
                     children: [
                     SizedBox(
                       height: size.height*0.06,
                       width: double.infinity,
                       child: ElevatedButton(

                           onPressed: ()  {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => RegisterYourself()),
                             );
                           },
                           style: ElevatedButton.styleFrom(
                             primary: Color(0xFF394361),

                             // 0xFF394361
                           ),
                           child: Text(
                             "Go To Registration",
                           ),

                         ),
                     ),
                     ],
                    ),
                  ],

                ),

              ),


            ],
          ),
        ),
      ),

    );
  }
}
