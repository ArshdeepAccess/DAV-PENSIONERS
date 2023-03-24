import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
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
                // padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                child: Text(
                  "Contact Us",
                  style: TextStyle(
                    color: Color(0xFF394361),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                // child: Table(
                //   border: TableBorder.all(
                //       color: Colors.black,
                //       style: BorderStyle.solid,
                //       width: 2
                //   ),
                //   children: [
                //     TableRow(
                //       children: [
                //         Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.all(20.0),
                //               child: Text("AVAILABILITY"),
                //             ),
                //
                //           ],
                //         ),
                //         Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(" DTE OF AIR VETERANS"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(" VETERAN INFORMATION CENTRE(VIC)"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(" INFORMATION AND QUERY CELL"),
                //             ),
                //
                //
                //           ],
                //         ),
                //         Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("MONDAY TO FRIDAY 0900H-1730H"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("MONDAY TO SATURDAY 0900H-1700H"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("MONDAY TO SATURDAY 0900H-1700H"),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //
                //     TableRow(
                //         children: [
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("POSTAL ADDRESS"),
                //               ),
                //             ],
                //           ),
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("DTE OF AIR VETERANS"),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(" AIR HQ (SP)"),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(" FIRST FLOOR, SMC BUILDING"),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(" SUBROTO PARK"),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("NEW DELHI – 110 010"),
                //               ),
                //             ],
                //           ),
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(""),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(""),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(""),
                //               ),
                //             ],
                //           ),
                //         ]
                //     ),
                //
                //     TableRow(
                //         children: [
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("CONTACT US "),
                //               ),
                //
                //             ],
                //           ),
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("QUERY CELL (OFFICERS)"),
                //               ),
                //
                //             ],
                //           ),
                //
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("011-25683170, 011-25683627"),
                //               ),
                //
                //             ],
                //           ),
                //         ]
                //     ),
                //
                //     TableRow(
                //         children: [
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("CONTACT US "),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(""),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(""),
                //               ),
                //             ],
                //           ),
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("QUERY CELL AIRMEN/NCs(E)"),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(""),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(""),
                //               ),
                //             ],
                //           ),
                //
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("Description ---	Contact/Email/Address",
                //                   style: TextStyle(
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("PostalAddress --- "
                //                     "Director, DAV-Ill, AFRO Building, 3rd Floor, Subroto Park,"
                //                     "New Delhi-110010"),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("Telephone --- "
                //                     "011 25687415,"
                //                     " Extn: 7355 & 7336 ( LUNCH- 13:00H-13:30H )"
                //                     "Through WAC Exchange No. 011-25687194, 95, 96 & 97"),
                //               ),
                //
                //             ],
                //           ),
                //         ]
                //     ),
                //     TableRow(
                //         children: [
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("CONTACT US "),
                //               ),
                //
                //             ],
                //           ),
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("IAFPC"),
                //               ),
                //
                //             ],
                //           ),
                //
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(" 011-25696013, 011-25690233"),
                //               ),
                //
                //             ],
                //           ),
                //         ]
                //     ),
                //     TableRow(
                //       children: [
                //         Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.all(20.0),
                //               child: Text("  FAX NO."),
                //             ),
                //
                //           ],
                //         ),
                //         Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("AIR CMDE AV SECTT"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("IAFPC"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(" DIR-III/QUERY CELL"),
                //             ),
                //
                //
                //           ],
                //         ),
                //         Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("011-25683190"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("011-25690233"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(" 011-25696359"),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //
                //     TableRow(
                //       children: [
                //         Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.all(20.0),
                //               child: Text("MOBILE NO."),
                //             ),
                //
                //           ],
                //         ),
                //         Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(" AIR CMDE AV"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("GP CAPT AV (OFFICERS)"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(" GP CAPT AV (AIRMEN)"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(" WG CDR BIPLAB BHATTARAI(Nodal Officer-Fatal Case Document)"),
                //             ),
                //
                //           ],
                //         ),
                //         Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(" 7428926803 [Whatsapp Only]"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("7428926801"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("  7428926802"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("9654728893"),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //     TableRow(
                //       children: [
                //         Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.all(20.0),
                //               child: Text("MOBILE NO."),
                //             ),
                //
                //           ],
                //         ),
                //         Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(" OFFICERS' SERVICE PENSION"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(" OFFICERS' FAMILY PENSION"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("  OFFICERS' DISABLITY PENSION"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(" AIRMEN"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("  NCs(E)"),
                //             ),
                //           ],
                //         ),
                //         Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("dav.officers@gov.in"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("dav.fp.officers@gov.in"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("  dav.dp.officers@gov.in"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(" dav.airmen@gov.in"),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text("dirav.nce@gov.in"),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //     TableRow(
                //         children:[
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(" WAC Exchange No."),
                //               ),
                //             ],
                //           ),
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(""),
                //               ),
                //             ],
                //           ),Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(" 011-25687194"),
                //               ),
                //             ],
                //           ),
                //         ]
                //     ),
                //
                //     TableRow(
                //         children:[
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("Toll Free No."),
                //               ),
                //             ],
                //           ),
                //           Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(""),
                //               ),
                //             ],
                //           ),Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("  1800-11-5800"),
                //               ),
                //             ],
                //           ),
                //         ]
                //     ),
                //   ],
                //
                // ),
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text("AVAILABILITY",
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.w500,
                  //         color: Color(0xFF0b0c5b),
                  //         fontSize: 20,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: size.height*0.02,
                  // ),
                  Row(
                    children: [
                      // Expanded(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //     Text("DTE OF AIR VETERANS"),
                      //
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(width: size.width*0.01,),

                      Expanded(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("MONDAY TO FRIDAY 0900H-1730H"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      // Expanded(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       Text("VETERAN INFORMATION CENTRE(VIC)"),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(width: size.width*0.01,),

                      Expanded(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,

                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("MONDAY TO SATURDAY 0900 - 1700H"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      // Expanded(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       Text("INFORMATION AND QUERY CELL"),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(width: size.width*0.01,),
                      Expanded(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("MONDAY TO SATURDAY 0900 - 1700H"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "POSTAL ADDRESS",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0b0c5b),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("DTE OF AIR VETERANS"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("AIR HQ (SP)"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("FIRST FLOOR, SMC BUILDING"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("SUBROTO PARK"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("NEW DELHI – 110 010"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "CONTACT NO.",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0b0c5b),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text("QUERY CELL (OFFICERS)"),
                            Text("VETERAN INFORMATION"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text("011-25683170, 011-25683627"),
                            GestureDetector(
                                onTap: () async {
                                  Uri phoneno = Uri.parse('tel:011-25683170');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                child: Text(
                                  "011-25683170",
                                  style: TextStyle(color: Colors.blue),
                                )),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            GestureDetector(
                                onTap: () async {
                                  Uri phoneno = Uri.parse('tel:011-25683627');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                child: Text(
                                  "011-25683627",
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("QUERY CELL AIRMEN/NCs(E)"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text("QUERY CELL AIRMEN/NCs(E)",
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: size.height*0.01,
                  // ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         children: [
                  //           Text("Description",
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold
                  //           ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     SizedBox(width: size.width*0.01,),
                  //
                  //     Expanded(
                  //       child: Column(
                  //         children: [
                  //           Text("Contact/Email/Address",
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.bold
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("PostalAddress"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                "Director, DAV-Ill, AFRO Building, 3rd Floor, Subroto Park,New Delhi-110010"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Telephone"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text("011 25687415,"),
                            GestureDetector(
                                onTap: () async {
                                  Uri phoneno = Uri.parse('tel:011 25687415');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                child: Text(
                                  "011 25687415",
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(""),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Extn: 7355 & 7336 ( LUNCH- 13:00H-13:30H )"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(""),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Through WAC Exchange No. "),
                            // "011-25687194, "
                            GestureDetector(
                                onTap: () async {
                                  Uri phoneno = Uri.parse('tel:011-25687194');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                child: Text(
                                  "011-25687194",
                                  style: TextStyle(color: Colors.blue),
                                )),

                            Text("95, 96 & 97"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("IAFPC"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text("011-25696013, 011-25690233"),
                            GestureDetector(
                                onTap: () async {
                                  Uri phoneno = Uri.parse('tel:011-25696013');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                child: Text(
                                  "011-25696013",
                                  style: TextStyle(color: Colors.blue),
                                )),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            GestureDetector(
                                onTap: () async {
                                  Uri phoneno = Uri.parse('tel:011-25690233');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                child: Text(
                                  "011-25690233",
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "FAX NO.",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0b0c5b),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("AIR CMDE AV SECTT"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text("011-25683190"),
                            GestureDetector(
                                onTap: () async {
                                  Uri phoneno = Uri.parse('tel:011-25683190');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                child: Text(
                                  "011-25683190",
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("IAFPC"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text("011-25690233"),
                            GestureDetector(
                                onTap: () async {
                                  Uri phoneno = Uri.parse('tel:011-25690233');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                child: Text(
                                  "011-25690233",
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("DIR-III/QUERY CELL"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text("011-25696359"),
                            GestureDetector(
                                onTap: () async {
                                  Uri phoneno = Uri.parse('tel:011-25696359');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                child: Text(
                                  "011-25696359",
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "MOBILE NO.",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xFF0b0c5b),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("AIR CMDE AV"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text("7428926803 "),
                            GestureDetector(
                                onTap: () async {
                                  Uri phoneno = Uri.parse('tel:7428926803');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                child: Text(
                                  "7428926803",
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(""),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("[Whatsapp Only]"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("GP CAPT AV (OFFICERS)"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text("7428926801"),
                            GestureDetector(
                                onTap: () async {
                                  Uri phoneno = Uri.parse('tel:7428926801');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                child: Text(
                                  "7428926801",
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("GP CAPT AV (AIRMEN)"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text("7428926802"),
                            GestureDetector(
                                onTap: () async {
                                  Uri phoneno = Uri.parse('tel:7428926802');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                child: Text(
                                  "7428926802",
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "E-MAIL ADDRESS",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xFF0b0c5b),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("OFFICERS' SERVICE PENSION"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text("dav.officers@gov.in"),
                            GestureDetector(
                                onTap: () async {
                                  String email = Uri.encodeComponent(
                                      "dav.officers@gov.in");

                                  Uri mail = Uri.parse("mailto:$email?");
                                  if (await launchUrl(mail)) {
                                    //email app opened
                                  } else {
                                    //email app is not opened
                                  }
                                },
                                child: Text(
                                  "dav.officers@gov.in",
                                  style: TextStyle(color: Colors.blue),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("OFFICERS' FAMILY PENSION"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text(" dav.fp.officers@gov.in"),
                            GestureDetector(
                                onTap: () async {
                                  String email = Uri.encodeComponent(
                                      " dav.fp.officers@gov.in");

                                  Uri mail = Uri.parse("mailto:$email?");
                                  if (await launchUrl(mail)) {
                                    //email app opened
                                  } else {
                                    //email app is not opened
                                  }
                                },
                                child: Text(
                                  "dav.fp.officers@gov.in",
                                  style: TextStyle(color: Colors.blue),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("OFFICERS' DISABLITY PENSION"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text("dav.dp.officers@gov.in"),
                            GestureDetector(
                                onTap: () async {
                                  String email = Uri.encodeComponent(
                                      "dav.dp.officers@gov.in");

                                  Uri mail = Uri.parse("mailto:$email?");
                                  if (await launchUrl(mail)) {
                                    //email app opened
                                  } else {
                                    //email app is not opened
                                  }
                                },
                                child: Text(
                                  "dav.dp.officers@gov.in",
                                  style: TextStyle(color: Colors.blue),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("AIRMEN"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text("dav.airmen@gov.in"),
                            GestureDetector(
                                onTap: () async {
                                  String email =
                                      Uri.encodeComponent("dav.airmen@gov.in");

                                  Uri mail = Uri.parse("mailto:$email?");
                                  if (await launchUrl(mail)) {
                                    //email app opened
                                  } else {
                                    //email app is not opened
                                  }
                                },
                                child: Text(
                                  "dav.airmen@gov.in",
                                  style: TextStyle(color: Colors.blue),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("NCs(E)"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text("dirav.nce@gov.in"),
                            GestureDetector(
                                onTap: () async {
                                  String email =
                                      Uri.encodeComponent("dirav.nce@gov.in");

                                  Uri mail = Uri.parse("mailto:$email?");
                                  if (await launchUrl(mail)) {
                                    //email app opened
                                  } else {
                                    //email app is not opened
                                  }
                                },
                                child: Text(
                                  "dirav.nce@gov.in",
                                  style: TextStyle(color: Colors.blue),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " WAC Exchange No.",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0b0c5b),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text("011-25687194"),
                            GestureDetector(
                                onTap: () async {
                                  Uri phoneno = Uri.parse('tel:011-25687194');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                child: Text(
                                  "011-25687194",
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Toll Free No.",
                        style: TextStyle(
                          color: Color(0xFF0b0c5b),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text(" 1800-11-5800"),
                            GestureDetector(
                                onTap: () async {
                                  Uri phoneno = Uri.parse('tel:1800-11-5800');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                child: Text(
                                  "1800-11-5800",
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
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
    );
  }
}
