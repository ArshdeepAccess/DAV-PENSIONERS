import 'package:flutter/material.dart';

import 'Registration.dart';
import 'mobile number.dart';
class RegisterYourself extends StatefulWidget {
  const RegisterYourself({Key? key}) : super(key: key);

  @override
  State<RegisterYourself> createState() => _RegisterYourselfState();
}

class _RegisterYourselfState extends State<RegisterYourself> {
  @override
  List<String> items = <String>[
    '-Select-',
    'Officer',
    'Airmen/NCs(E)'
  ];
  String dropdownvalue = '-Select-';
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF394361),
        // backgroundColor: Color(0xFF394361),

        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Registration()),
          );
        },
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),),
        title: Text("Register Yourself",
          style: TextStyle(
            color: Colors.white,
          ),
        ),

      ),
      body: Container(
        // color: Color(0xFFf2fcff),

        color: Color(0xFFa8d5e5),
        // height: 700,
        // height: size.height*0.9,
        width: size.width*40,
        // width: 400,
        child: SingleChildScrollView(
          child: Column(

            children: [
              Container(
                alignment: Alignment.topLeft,
                height: size.height*1.67,
                width: size.width*35,
                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width /18,0,20,0),
                // margin: EdgeInsets.only(left: 25, right: 25),
                color: Color(0xFFf2fcff),
                // color: Color(0xFFd3eaf2),

                child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                              MediaQuery.of(context).size.width /
                                  30,
                              vertical:
                              MediaQuery.of(context).size.width /
                                  90,
                            ),
                            child: Text("Aadhar No.",

                              style:
                              TextStyle(
                                color: Color(0xFF0b0c5b),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,

                              ),

                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                            MediaQuery.of(context).size.width /
                                30,
                            vertical:
                            MediaQuery.of(context).size.width /
                                50,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(

                              border: OutlineInputBorder(),
                              hintText: "PLEASE ENTER A 12-DIGIT  VALID AADHAR NO,",
                              hintStyle: TextStyle(fontSize: 12,color: Colors.white),

                              filled: true,
                              fillColor: Color(0xFF8994a8),
                            ),
                          ),

                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width /
                                      30,
                                  vertical:
                                  MediaQuery.of(context).size.width /
                                      150,
                                ),
                                child: Text("Mobile No.",

                                  style:
                                  TextStyle(
                                    color: Color(0xFF0b0c5b),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,

                                  ),

                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width /
                                    30,
                                vertical:
                                MediaQuery.of(context).size.width /
                                    150,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  hintText: "PLEASE ENTER A 10-DIGIT VALID MOBILE NO,",
                                  hintStyle: TextStyle(fontSize: 12,color: Colors.white),

                                  filled: true,
                                  fillColor: Color(0xFF8994a8),

                                ),
                              ),

                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width /
                                      30,
                                  vertical:
                                  MediaQuery.of(context).size.width /
                                      150,
                                ),
                                child: Text("Category",

                                  style:
                                  TextStyle(
                                    color: Color(0xFF0b0c5b),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,

                                  ),

                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width /
                                    30,
                                vertical:
                                MediaQuery.of(context).size.width /
                                    150,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  hintText: "Select",
                                  hintStyle: TextStyle(fontSize: 12,color: Colors.white),

                                  filled: true,
                                  fillColor: Color(0xFF8994a8),
                                  suffixIcon: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      onChanged: (String? newValue){
                                        setState(() {
                                          dropdownvalue = newValue!;
                                        });
                                      },
                                      value: dropdownvalue,
                                      dropdownColor: Colors.grey,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      isExpanded: true,
                                      borderRadius: BorderRadius.circular(30),
                                      items: items.map<DropdownMenuItem<String>>(
                                            (String value){
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text(value),
                                            ),

                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                ),
                              ),

                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width /
                                      30,
                                  vertical:
                                  MediaQuery.of(context).size.width /
                                      150,
                                ),
                                child: Text("Service No.",

                                  style:
                                  TextStyle(
                                    color: Color(0xFF0b0c5b),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,

                                  ),

                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width /
                                    30,
                                vertical:
                                MediaQuery.of(context).size.width /
                                    150,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  // hintText: "PLEASE ENTER A 10-DIGIT VALID MOBILE NO,",
                                  // hintStyle: TextStyle(fontSize: 12,color: Colors.white),

                                  filled: true,
                                  fillColor: Color(0xFF8994a8),

                                ),
                              ),

                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width /
                                      30,
                                  vertical:
                                  MediaQuery.of(context).size.width /
                                      150,
                                ),
                                child: Text("DOB",

                                  style:
                                  TextStyle(
                                    color: Color(0xFF0b0c5b),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,

                                  ),

                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width /
                                    30,
                                vertical:
                                MediaQuery.of(context).size.width /
                                    150,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  hintText: "DD-MM-YYYY",
                                  hintStyle: TextStyle(fontSize: 12,color: Colors.white),

                                  filled: true,
                                  fillColor: Color(0xFF8994a8),

                                ),
                              ),

                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width /
                                      30,
                                  vertical:
                                  MediaQuery.of(context).size.width /
                                      150,
                                ),
                                child: Text("Date of Commission",

                                  style:
                                  TextStyle(
                                    color: Color(0xFF0b0c5b),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,

                                  ),

                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width /
                                    30,
                                vertical:
                                MediaQuery.of(context).size.width /
                                    150,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  hintText: "DD-MM-YYYY",
                                  hintStyle: TextStyle(fontSize: 12,color: Colors.white),

                                  filled: true,
                                  fillColor: Color(0xFF8994a8),

                                ),
                              ),

                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width /
                                      30,
                                  vertical:
                                  MediaQuery.of(context).size.width /
                                      150,
                                ),
                                child: Text("Date of Retirement",

                                  style:
                                  TextStyle(
                                    color: Color(0xFF0b0c5b),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,

                                  ),

                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width /
                                    30,
                                vertical:
                                MediaQuery.of(context).size.width /
                                    150,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  hintText: "DD-MM-YYYY",
                                  hintStyle: TextStyle(fontSize: 12,color: Colors.white),

                                  filled: true,
                                  fillColor: Color(0xFF8994a8),

                                ),
                              ),

                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width /
                                      30,
                                  vertical:
                                  MediaQuery.of(context).size.width /
                                      150,
                                ),
                                child: Text("PAN",

                                  style:
                                  TextStyle(
                                    color: Color(0xFF0b0c5b),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,

                                  ),

                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width /
                                    30,
                                vertical:
                                MediaQuery.of(context).size.width /
                                    150,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  hintText: "PLEASE ENTER A 10 CHARACTER VALID PAN",
                                  hintStyle: TextStyle(fontSize: 12,color: Colors.white),

                                  filled: true,
                                  fillColor: Color(0xFF8994a8),

                                ),
                              ),

                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width /
                                      30,
                                  vertical:
                                  MediaQuery.of(context).size.width /
                                      150,
                                ),
                                child: Text("EMAIL ID",

                                  style:
                                  TextStyle(
                                    color: Color(0xFF0b0c5b),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,

                                  ),

                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width /
                                    30,
                                vertical:
                                MediaQuery.of(context).size.width /
                                    150,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  hintText: "EXAMPLE@GMAIL.COM",
                                  hintStyle: TextStyle(fontSize: 12,color: Colors.white),

                                  filled: true,
                                  fillColor: Color(0xFF8994a8),

                                ),
                              ),

                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width /
                                      30,
                                  vertical:
                                  MediaQuery.of(context).size.width /
                                      150,
                                ),
                                child: Text("Password",

                                  style:
                                  TextStyle(
                                    color: Color(0xFF0b0c5b),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,

                                  ),

                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width /
                                    30,
                                vertical:
                                MediaQuery.of(context).size.width /
                                    150,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  // hintText: "PLEASE ENTER A 10-DIGIT VALID MOBILE NO,",
                                  // hintStyle: TextStyle(fontSize: 12,color: Colors.white),

                                  filled: true,
                                  fillColor: Color(0xFF8994a8),

                                ),
                              ),

                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width /
                                      30,
                                  vertical:
                                  MediaQuery.of(context).size.width /
                                      150,
                                ),
                                child: Text("Confirm Password",

                                  style:
                                  TextStyle(
                                    color: Color(0xFF0b0c5b),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,

                                  ),

                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width /
                                    30,
                                vertical:
                                MediaQuery.of(context).size.width /
                                    150,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  // hintText: "PLEASE ENTER A 10-DIGIT VALID MOBILE NO,",
                                  // hintStyle: TextStyle(fontSize: 12,color: Colors.white),

                                  filled: true,
                                  fillColor: Color(0xFF8994a8),

                                ),
                              ),

                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width /
                                      30,
                                  vertical:
                                  MediaQuery.of(context).size.width /
                                      150,
                                ),
                                child: Text("Pin Generate",

                                  style:
                                  TextStyle(
                                    color: Color(0xFF0b0c5b),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,

                                  ),

                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width /
                                    30,
                                vertical:
                                MediaQuery.of(context).size.width /
                                    150,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  // hintText: "PLEASE ENTER A 10-DIGIT VALID MOBILE NO,",
                                  // hintStyle: TextStyle(fontSize: 12,color: Colors.white),

                                  filled: true,
                                  fillColor: Color(0xFF8994a8),

                                ),
                              ),

                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width /
                                      30,
                                  vertical:
                                  MediaQuery.of(context).size.width /
                                      150,
                                ),
                                child: Text("Face ID",

                                  style:
                                  TextStyle(
                                    color: Color(0xFF0b0c5b),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,

                                  ),

                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width /
                                    30,
                                vertical:
                                MediaQuery.of(context).size.width /
                                    150,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  // hintText: "PLEASE ENTER A 10-DIGIT VALID MOBILE NO,",
                                  // hintStyle: TextStyle(fontSize: 12,color: Colors.white),

                                  filled: true,
                                  fillColor: Color(0xFF8994a8),

                                ),
                              ),

                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width /
                                      30,
                                  vertical:
                                  MediaQuery.of(context).size.width /
                                      150,
                                ),
                                child: Text("Finger Scanner",

                                  style:
                                  TextStyle(
                                    color: Color(0xFF0b0c5b),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,

                                  ),

                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width /
                                    30,
                                vertical:
                                MediaQuery.of(context).size.width /
                                    150,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  // hintText: "PLEASE ENTER A 10-DIGIT VALID MOBILE NO,",
                                  // hintStyle: TextStyle(fontSize: 12,color: Colors.white),

                                  filled: true,
                                  fillColor: Color(0xFF8994a8),

                                ),
                              ),

                            ),

                          ],
                        ),
                        SizedBox(
                          height: size.height*0.03,

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
                                        builder: (context) => Mobile()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF394361),

                                  // 0xFF394361
                                ),
                                child: Text(
                                  "Next",
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
