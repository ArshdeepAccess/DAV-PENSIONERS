// import 'dart:ui';
// import 'package:carousel_slider/carousel_options.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// import 'package:url_launcher/url_launcher.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//
//
//   @override
//
//   Widget build(BuildContext context) {
//
//     Size   size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
//                     child: Container(
//                       color: Colors.grey.withOpacity(0.1),
//
//                     ),
//                   ),
//                   // width: MediaQuery.of(context).size.width*1.5,
//                   // height: MediaQuery.of(context).size.height*0.43,
//                   // height: 350,
//                   // width: 400,
//                   height : size.height*0.43,
//                   width : size.width*1.5,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(image:  AssetImage("assets/images/flag2.jpg",
//
//                     ),
//                       fit: BoxFit.fill,
//
//                     ),
//                   ),
//
//                 ),
//                 Container(
//
//                   child: Image(image: AssetImage("assets/images/img1.png",)),
//                   height : size.height*0.40,
//                   width : size.width*1.5,
//                   // height: 350,
//                   // width: 400,
//                   // width: MediaQuery.of(context).size.width*1.5 ,
//                   // height: MediaQuery.of(context).size.height*0.43,
//                   // padding: EdgeInsets.fromLTRB(20,60,30,20),
//                   padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/30,vertical:MediaQuery.of(context).size.width/10, ),
//                 ),
//               ],
//             ),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   height : size.height*0.09,
//                   width : size.width*0.20,
//                   // height: 70,
//                   // width:90,
//                   // margin: EdgeInsets.only(top:15),
//                   // padding: EdgeInsets.only(top: 10),
//                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/30),
//                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/20),
//                   decoration:BoxDecoration(
//                     color: Color(0xFFfca33f),
//                     border: Border.all(width:0.3,color: Colors.grey),
//                     borderRadius:BorderRadius.circular(8),
//
//                   ),
//
//                   child:
//                   // Link(
//                   //                 target:LinkTarget.self,
//                   //                 uri:Uri.parse("https://iafpensioners.gov.in/ords/dav_portal/r/dte_av/login"),
//                   //                 builder:(context,followLink) =>
//                   InkWell(
//
//                     onTap: ()=> launchUrl(Uri.parse('https://iafpensioners.gov.in/ords/dav_portal/r/dte_av/login')),
//                     child: Column(
//                       children: [
//                         Container(
//
//                           // height: 30
//                           // ,width: 50,
//                             height : size.height*0.04,
//                             width : size.width*0.15,
//                             child: Image(image: AssetImage("assets/images/User1.png"))),
//                         // Icon(Icons.contact_page,
//                         //   size: size.height*0.04,
//                         //   // size: 35,
//                         // ),
//                         // Container(height: 30,width: 50,
//                         //     child: Image(image: AssetImage("assets/images/login.jpg",))),
//
//                         Padding(
//                           padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/30),
//                           child: Text("VETERANS  LOGIN",style: TextStyle(color:Color(0xFF2c444d),fontSize:9,fontWeight: FontWeight.bold),),
//                         ),
//                       ],
//                     ),
//
//
//                   ),
//                   // ),
//                 ),
//                 Container(
//                   height : size.height*0.09,
//                   width : size.width*0.20,
//                   // height: 70,
//                   // width:90,
//                   // margin: EdgeInsets.only(top:15),
//                   // padding: EdgeInsets.only(top: 10),
//                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/30),
//                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/20),
//                   decoration:BoxDecoration(
//                     color: Color(0xFFfca33f),
//                     border: Border.all(width:0.3,color: Colors.grey),
//                     borderRadius:BorderRadius.circular(8),
//
//                   ),
//
//                   child: InkWell(
//
//                     onTap: () => launchUrl(Uri.parse('https://iafpensioners.gov.in/ords/dav_portal/r/dte_av/nok-login')),
//                     child: Column(
//                       children: [
//                         Container(
//
//                           // height: 30
//                           // ,width: 50,
//                             height : size.height*0.04,
//                             width : size.width*0.15,
//                             child: Image(image: AssetImage("assets/images/User1.png"))),
//                         // Icon(Icons.contact_page,
//                         //   size: size.height*0.04,
//                         //   // size: 35,
//                         // ),
//                         // Container(height: 30,width: 50,
//                         //     child: Image(image: AssetImage("assets/images/login.jpg",))),
//                         Padding(
//
//                           padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/30),
//                           child: Text("NOK/WIDOW LOGIN",style: TextStyle(color:Color(0xFF2c444d),fontSize:9,fontWeight: FontWeight.bold),),
//                         ),
//                       ],
//                     ),
//
//
//                   ),
//                 ),
//                 Container(
//                   height : size.height*0.09,
//                   width : size.width*0.20,
//                   // height: 70,
//                   // width:90,
//                   // margin: EdgeInsets.only(top:15),
//                   // padding: EdgeInsets.only(top: 10),
//                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/30),
//                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/20),
//                   decoration:BoxDecoration(
//                     color: Color(0xFFfca33f),
//                     border: Border.all(width:0.3,color: Colors.grey),
//                     borderRadius:BorderRadius.circular(8),
//
//                   ),
//
//                   child: InkWell(
//
//                     onTap: () =>launchUrl(Uri.parse('https://www.iafpc.co.in/'),
//
//                     ),
//
//                     child: Column(
//                       children: [
//                         Container(
//
//                           // height: 30
//                           // ,width: 50,
//                             height : size.height*0.04,
//                             width : size.width*0.15,
//                             child: Image(image: AssetImage("assets/images/User1.png"))),
//                         // Icon(Icons.contact_page,
//                         //   size: size.height*0.04,
//                         //   // size: 35,
//                         // ),
//                         // Container(height: 30,width: 50,
//                         //     child: Image(image: AssetImage("assets/images/login.jpg",))),
//                         Padding(
//
//                           padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/30),
//                           child: Text("PLACEMENT CELL",style: TextStyle(color:Color(0xFF2c444d),fontSize:9,fontWeight: FontWeight.bold),),
//                         ),
//                       ],
//                     ),
//
//
//                   ),
//                 ),
//
//               ],
//             ),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   height : size.height*0.09,
//                   width : size.width*0.20,
//                   // height: 70,
//                   // width:90,
//                   // margin: EdgeInsets.only(top:15),
//                   // padding: EdgeInsets.only(top: 10),
//                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/30),
//                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/20),
//                   decoration:BoxDecoration(
//                     color: Color(0xFFfec579),
//                     border: Border.all(width:0.3,color: Colors.grey),
//                     borderRadius:BorderRadius.circular(8),
//
//                   ),
//
//                   child: GestureDetector(
//
//                     onTap: () =>launchUrl(Uri.parse('https://iafpensioners.gov.in/ords/dav_portal/r/dte_av/pensionregulations?p0_title=Updates&p0_hsd_type=EXP&p0_hsd_sub_type=UPD&p0_heading=Updates&p0_heading_top=Dte%20of%20Air%20Veterans%20-%20Updates')),
//                     child: Column(
//                       children: [
//                         Container(
//
//                           // height: 30
//                           // ,width: 50,
//                             height : size.height*0.04,
//                             width : size.width*0.15,
//                             child: Image(image: AssetImage("assets/images/update.png"))),
//                         // Icon(Icons.contact_page,
//                         //   size: size.height*0.04,
//                         //   // size: 35,
//                         // ),
//                         // Container(height: 30,width: 50,
//                         //     child: Image(image: AssetImage("assets/images/login.jpg",))),
//                         Padding(
//
//                           padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/30,vertical:MediaQuery.of(context).size.width/50, ),
//                           child: Text("UPDATES",style: TextStyle(color:Color(0xFF2c444d),fontSize:9,fontWeight: FontWeight.bold),),
//                         ),
//                       ],
//                     ),
//
//
//                   ),
//                 ),
//                 Container(
//                   height : size.height*0.09,
//                   width : size.width*0.20,
//                   // height: 70,
//                   // width:90,
//                   // margin: EdgeInsets.only(top:15),
//                   // padding: EdgeInsets.only(top: 10),
//                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/30),
//                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/20),
//                   decoration:BoxDecoration(
//                     color: Color(0xFFfec579),
//                     border: Border.all(width:0.3,color: Colors.grey),
//                     borderRadius:BorderRadius.circular(8),
//
//                   ),
//
//                   child: GestureDetector(
//
//                     onTap: () {  }, child: Column(
//                     children: [
//                       Container(
//
//                         // height: 30
//                         // ,width: 50,
//                           height : size.height*0.04,
//                           width : size.width*0.10,
//                           child: Image(image: AssetImage("assets/images/bell.png"))),
//                       // Icon(Icons.contact_page,
//                       //   size: size.height*0.04,
//                       //   // size: 35,
//                       // ),
//                       // Container(height: 30,width: 50,
//                       //     child: Image(image: AssetImage("assets/images/login.jpg",))),
//                       Padding(
//
//                         padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/100),
//                         child: Text("NOTIFICATION",style: TextStyle(color:Color(0xFF2c444d),fontSize:9,fontWeight: FontWeight.bold),),
//                       ),
//                     ],
//                   ),
//
//
//                   ),
//                 ),
//                 Container(
//                   height : size.height*0.09,
//                   width : size.width*0.20,
//                   // height: 70,
//                   // width:90,
//                   // margin: EdgeInsets.only(top:15),
//                   // padding: EdgeInsets.only(top: 10),
//                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/30),
//                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/20),
//                   decoration:BoxDecoration(
//                     color: Color(0xFFfec579),
//                     border: Border.all(width:0.3,color: Colors.grey),
//                     borderRadius:BorderRadius.circular(8),
//
//                   ),
//
//                   child: GestureDetector(
//
//                     onTap: () {  }, child: Column(
//                     children: [
//                       Container(
//
//                         // height: 30
//                         // ,width: 50,
//                           height : size.height*0.04,
//                           width : size.width*0.15,
//                           child: Image(image: AssetImage("assets/images/video.png"))),
//                       // Icon(Icons.contact_page,
//                       //   size: size.height*0.04,
//                       //   // size: 35,
//                       // ),
//                       // Container(height: 30,width: 50,
//                       //     child: Image(image: AssetImage("assets/images/login.jpg",))),
//                       Padding(
//
//                         padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/60),
//                         child: Text("INFORMATION VIDEO",style: TextStyle(color:Color(0xFF2c444d),fontSize:9,fontWeight: FontWeight.bold),),
//                       ),
//                     ],
//                   ),
//
//
//                   ),
//                 ),
//
//
//               ],
//             ),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   height : size.height*0.09,
//                   width : size.width*0.20,
//                   // height: 70,
//                   // width:90,
//                   // margin: EdgeInsets.only(top:15),
//                   // padding: EdgeInsets.only(top: 10),
//                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/30),
//                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/20),
//                   decoration:BoxDecoration(
//                     color: Color(0xFFfec579),
//                     border: Border.all(width:0.3,color: Colors.grey),
//                     borderRadius:BorderRadius.circular(8),
//
//                   ),
//
//                   child: GestureDetector(
//
//                     onTap: () =>launchUrl(Uri.parse('https://iafpensioners.gov.in/ords/dav_portal/r/dte_av/pensionregulations?p0_title=Notifications%20%26%20Circulars&p0_hsd_type=NAC&p0_hsd_sub_type=FMP&p0_heading=Family%20Pension&p0_heading_top=Dte%20of%20Air%20Veterans%20-%20Family%20Pension')),
//                     child: Column(
//                       children: [
//                         Container(
//
//                           // height: 30
//                           // ,width: 50,
//                             height : size.height*0.04,
//                             width : size.width*0.15,
//                             child: Image(image: AssetImage("assets/images/familyp.png"))),
//                         // Icon(Icons.contact_page,
//                         //   size: size.height*0.04,
//                         //   // size: 35,
//                         // ),
//                         // Container(height: 30,width: 50,
//                         //     child: Image(image: AssetImage("assets/images/login.jpg",))),
//                         Padding(
//
//                           padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/30),
//                           child: Text("FAMILY PENSION",style: TextStyle(color:Color(0xFF2c444d),fontSize:9,fontWeight: FontWeight.bold),),
//                         ),
//                       ],
//                     ),
//
//
//                   ),
//                 ),
//                 Container(
//                   height : size.height*0.09,
//                   width : size.width*0.20,
//                   // height: 70,
//                   // width:90,
//                   // margin: EdgeInsets.only(top:15),
//                   // padding: EdgeInsets.only(top: 10),
//                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/30),
//                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/20),
//                   decoration:BoxDecoration(
//                     color: Color(0xFFfec579),
//                     border: Border.all(width:0.3,color: Colors.grey),
//                     borderRadius:BorderRadius.circular(8),
//
//                   ),
//
//                   child: GestureDetector(
//
//                     onTap: () =>launchUrl(Uri.parse('https://iafpensioners.gov.in/ords/dav_portal/r/dte_av/pensionregulations?p0_title=Notifications%20%26%20Circulars&p0_hsd_type=NAC&p0_hsd_sub_type=SVP&p0_heading=Service%20Pension&p0_heading_top=Dte%20of%20Air%20Veterans%20-%20Service%20Pension')),
//                     child: Column(
//                       children: [
//                         Container(
//
//                           // height: 30
//                           // ,width: 50,
//                             height : size.height*0.04,
//                             width : size.width*0.15,
//                             child: Image(image: AssetImage("assets/images/servicep.png"))),
//                         // Icon(Icons.contact_page,
//                         //   size: size.height*0.04,
//                         //   // size: 35,
//                         // ),
//                         // Container(height: 30,width: 50,
//                         //     child: Image(image: AssetImage("assets/images/login.jpg",))),
//                         Padding(
//
//                           padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/30),
//                           child: Text("SERVICE PENSION",style: TextStyle(color:Color(0xFF2c444d),fontSize:9,fontWeight: FontWeight.bold),),
//                         ),
//                       ],
//                     ),
//
//
//                   ),
//                 ),
//                 Container(
//                   height : size.height*0.09,
//                   width : size.width*0.20,
//                   // height: 70,
//                   // width:90,
//                   // margin: EdgeInsets.only(top:15),
//                   // padding: EdgeInsets.only(top: 10),
//                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/30),
//                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/20),
//                   decoration:BoxDecoration(
//                     color: Color(0xFFfec579),
//                     border: Border.all(width:0.3,color: Colors.grey),
//                     borderRadius:BorderRadius.circular(8),
//
//                   ),
//
//                   child: GestureDetector(
//
//                     onTap: () =>launchUrl(Uri.parse('https://iafpensioners.gov.in/ords/dav_portal/r/dte_av/pensionregulations?p0_title=Notifications%20%26%20Circulars&p0_hsd_type=NAC&p0_hsd_sub_type=DSP&p0_heading=Disability%20Pension&p0_heading_top=Dte%20of%20Air%20Veterans%20-%20Disability%20Pension')),
//                     child: Column(
//                       children: [
//                         Container(
//                           //
//                           // height: 30
//                           // ,width: 50,
//                             height : size.height*0.04,
//                             width : size.width*0.15,
//                             child: Image(image: AssetImage("assets/images/disabilityp.png"))),
//                         // Icon(Icons.contact_page,
//                         //   size: size.height*0.04,
//                         //   // size: 35,
//                         // ),
//                         // Container(height: 30,width: 50,
//                         //     child: Image(image: AssetImage("assets/images/login.jpg",))),
//                         Padding(
//
//                           padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/30),
//                           child: Text("DISABILITY PENSION",style: TextStyle(color:Color(0xFF2c444d),fontSize:9,fontWeight: FontWeight.bold),),
//                         ),
//                       ],
//                     ),
//
//
//                   ),
//                 ),
//
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   height : size.height*0.09,
//                   width : size.width*0.20,
//                   // height: 70,
//                   // width:90,
//                   // margin: EdgeInsets.only(top:15),
//                   // padding: EdgeInsets.only(top: 10),
//                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/30),
//                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/20),
//                   decoration:BoxDecoration(
//                     color: Color(0xFFfec579),
//                     border: Border.all(width:0.3,color: Colors.grey),
//                     borderRadius:BorderRadius.circular(8),
//
//                   ),
//
//                   child: GestureDetector(
//
//                     onTap: ()  =>launchUrl(Uri.parse('https://iafpensioners.gov.in/ords/dav_portal/r/dte_av/pensionregulations?p0_title=Notifications%20%26%20Circulars&p0_hsd_type=NAC&p0_hsd_sub_type=EAW&p0_heading=ECHS%20%26%20Welfare&p0_heading_top=%0ADte%20of%20Air%20Veterans%20-%20ECHS%20%26%20Welfare')),
//                     child: Column(
//                       children: [
//                         Container(
//
//                           // height: 30
//                           // ,width: 50,
//                             height : size.height*0.04,
//                             width : size.width*0.15,
//                             child: Image(image: AssetImage("assets/images/welfare.png"))),
//                         // Icon(Icons.contact_page,
//                         //   size: size.height*0.04,
//                         //   // size: 35,
//                         // ),
//                         // Container(height: 30,width: 50,
//                         //     child: Image(image: AssetImage("assets/images/login.jpg",))),
//                         Padding(
//
//                           padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/40),
//                           child: Text("ECHS & WELFARE ISSUES",style: TextStyle(color:Color(0xFF2c444d),fontSize:7,fontWeight: FontWeight.bold),),
//                         ),
//                       ],
//                     ),
//
//
//                   ),
//                 ),
//                 Container(
//                   height : size.height*0.09,
//                   width : size.width*0.20,
//                   // height: 70,
//                   // width:90,
//                   // margin: EdgeInsets.only(top:15),
//                   // padding: EdgeInsets.only(top: 10),
//                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/30),
//                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/20),
//                   decoration:BoxDecoration(
//                     color: Color(0xFFfec579),
//                     border: Border.all(width:0.3,color: Colors.grey),
//                     borderRadius:BorderRadius.circular(8),
//
//                   ),
//
//                   child: GestureDetector(
//
//                     onTap: () =>launchUrl(Uri.parse('https://iafpensioners.gov.in/ords/dav_portal/r/dte_av/resetlement?p0_title=Notifications%20%26%20Circulars&p0_hsd_type=NAC&p0_hsd_sub_type=RES&p0_heading=Resettlement&p0_heading_top=Dte%20of%20Air%20Veterans%20-%20Resettlement')),
//                     child: Column(
//                       children: [
//                         Container(
//
//                           // height: 30
//                           // ,width: 50,
//                             height : size.height*0.04,
//                             width : size.width*0.15,
//                             child: Image(image: AssetImage("assets/images/resettlement.png"))),
//                         // Icon(Icons.contact_page,
//                         //   size: size.height*0.04,
//                         //   // size: 35,
//                         // ),
//                         // Container(height: 30,width: 50,
//                         //     child: Image(image: AssetImage("assets/images/login.jpg",))),
//                         Padding(
//
//                           padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/80),
//                           child: Text("RESETTLEMENT",style: TextStyle(color:Color(0xFF2c444d),fontSize:8,fontWeight: FontWeight.bold),),
//                         ),
//                       ],
//                     ),
//
//
//                   ),
//                 ),
//                 Container(
//                   height : size.height*0.09,
//                   width : size.width*0.20,
//                   // height: 70,
//                   // width:90,
//                   // margin: EdgeInsets.only(top:15),
//                   // padding: EdgeInsets.only(top: 10),
//                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/30),
//                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/20),
//                   decoration:BoxDecoration(
//                     color: Color(0xFFfec579),
//                     border: Border.all(width:0.3,color: Colors.grey),
//                     borderRadius:BorderRadius.circular(8),
//
//                   ),
//
//                   child: GestureDetector(
//
//                     onTap: () =>launchUrl(Uri.parse('https://iafpensioners.gov.in/ords/dav_portal/r/dte_av/faq-home?p0_title=Notifications%20%26%20Circulars')),
//                     child: Column(
//                       children: [
//                         Container(
//                           //
//                           // height: 30
//                           // ,width: 50,
//                             height : size.height*0.04,
//                             width : size.width*0.15,
//                             child: Image(image: AssetImage("assets/images/faq.png"))),
//                         // Icon(Icons.contact_page,
//                         //   size: size.height*0.04,
//                         //   // size: 35,
//                         // ),
//                         // Container(height: 30,width: 50,
//                         //     child: Image(image: AssetImage("assets/images/login.jpg",))),
//                         Padding(
//
//                           padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/30,vertical:MediaQuery.of(context).size.width/50, ),
//                           child: Text("FAQs",style: TextStyle(color:Color(0xFF2c444d),fontSize:9,fontWeight: FontWeight.bold),),
//                         ),
//                       ],
//                     ),
//
//
//                   ),
//                 ),
//               ],
//             ),
//
//             Container(
//               // margin: EdgeInsets.only(top: 30.0),
//
//               margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/20),
//               // height: 65,
//               height: size.height*0.09,
//               decoration: BoxDecoration(
//
//                   borderRadius:BorderRadius.circular(8),
//                   gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       stops: [0.3, 1],
//                       colors: [Color(0xFFfea030),Color(0xFF9bde3e)])
//
//               ),
//               child: CarouselSlider(items: [
//
//                 Padding(
//                   padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width/400),
//                   child: GestureDetector(
//                     onTap: () =>launchUrl(Uri.parse('  http://www.ksb.gov.in/')),
//                     child: Container(
//                       // height: 30,
//                       // width: 150,
//                       height : size.height*0.09,
//                       width : size.width*0.25,
//                       decoration: BoxDecoration(
//
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/Img1.1.png"),
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 Padding(
//                   padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width/300),
//                   child: GestureDetector(
//                     onTap: () =>launchUrl(Uri.parse('https://www.india.gov.in/')),
//                     child: Container(
//                       // height: 30,
//                       // width: 150,
//                       height : size.height*0.09,
//                       width : size.width*0.25,
//                       decoration: BoxDecoration(
//
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/Img2.png"),
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10.0),
//                   child: GestureDetector(
//                     onTap: () =>launchUrl(Uri.parse('https://indianairforce.nic.in/')),
//                     child: Container(
//                       // height:30,
//                       // width: 150,
//                       height : size.height*0.09,
//                       width : size.width*0.25,
//                       decoration: BoxDecoration(
//
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/Img3.png"),
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 Padding(
//                   padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width/300),
//                   child: GestureDetector(
//                     onTap: () =>launchUrl(Uri.parse('https://joinindianarmy.nic.in/default.aspx')),
//                     child: Container(
//                       // height: 30,
//                       // width: 150,
//                       height : size.height*0.09,
//                       width : size.width*0.25,
//                       decoration: BoxDecoration(
//
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/Img4.jpg"),
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10.0),
//                   child: GestureDetector(
//                     onTap: () =>launchUrl(Uri.parse('https://www.joinindiannavy.gov.in/')),
//                     child: Container(
//                       // height: 30,
//                       // width: 150,
//                       height : size.height*0.09,
//                       width : size.width*0.25,
//                       decoration: BoxDecoration(
//
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/Img5.png"),
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 Padding(
//                   padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width/300),
//                   child: GestureDetector(
//                     onTap: () =>launchUrl(Uri.parse('https://iafpensioners.gov.in/ords/dav_portal/r/afgis/home')),
//                     child: Container(
//                       // height: 30,
//                       // width: 150,
//                       height : size.height*0.09,
//                       width : size.width*0.25,
//                       decoration: BoxDecoration(
//
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/Img6.png"),
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 Padding(
//                   padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width/300),
//                   child: GestureDetector(
//                     onTap: () =>launchUrl(Uri.parse('https://iafpensioners.gov.in/ords/dav_portal/r/dte_av/useful-links?p0_title=OTHER%20LINKS')),
//                     child: Container(
//                       // height: 30,
//                       // width: 150,
//                       height : size.height*0.09,
//                       width : size.width*0.25,
//                       decoration: BoxDecoration(
//
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/Img7.png"),
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 Padding(
//                   padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width/300),
//                   child: GestureDetector(
//                     onTap: () =>launchUrl(Uri.parse('https://www.mygov.in/')),
//                     child: Container(
//                       // height: 30,
//                       // width: 150,
//                       height : size.height*0.09,
//                       width : size.width*0.25,
//                       decoration: BoxDecoration(
//
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/Img8.jpg"),
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 Padding(
//                   padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width/300),
//                   child: GestureDetector(
//                     onTap: () =>launchUrl(Uri.parse('https://www.desw.gov.in/')),
//                     child: Container(
//                       // height: 30,
//                       // width: 150,
//                       height : size.height*0.09,
//                       width : size.width*0.25,
//                       decoration: BoxDecoration(
//
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/Img9.png"),
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//
//
//                     ),
//                   ),
//                 ),
//
//
//               ], options: CarouselOptions(
//                 height : size.height*0.07,
//                 enlargeCenterPage: false,
//                 autoPlay: true,
//                 aspectRatio: 16 / 9,
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 enableInfiniteScroll: true,
//                 autoPlayAnimationDuration: Duration(milliseconds: 5),
//                 viewportFraction: 0.3,
//               ),
//
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
// // orange bg with icons code;
//
//
//
//
//
//