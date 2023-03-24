import 'dart:convert';
import 'package:dav2/Models/EppoModel.dart';
import 'package:dav2/screens/pdf.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'constant.dart';

class Eppo extends StatefulWidget {
  const Eppo({Key? key}) : super(key: key);

  @override
  State<Eppo> createState() => _EppoState();
}

class _EppoState extends State<Eppo> {
  List<EppoModel> data = [];

  @override
  void initState() {
    super.initState();
    getData();
    checkInternetConnection();
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var serviceNumber = prefs.getString('ServiceNumber') ?? "";
    final response = await http.get(
        Uri.parse("${baseURL}/EPPODOWNLOAD/EPPODOWNLOAD/${serviceNumber}"));
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      data = (responseBody["items"] as List)
          .map((data) => EppoModel.fromJson(data))
          .toList();
      setState(() {});
    } else {
      throw Exception('Failed to load album');
    }
  }
  bool isLoading = true;
  bool isInternetConnection = true;
  void checkInternetConnection()async{
    bool internetConnection = await InternetConnectionChecker().hasConnection;
    if(internetConnection == true)
    {
      getData();
    }
    else
    {
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

  Future<void> saveFile(url) async {
    var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      String saveName = url.split('/').last;
      String savePath = "${dir.path}/$saveName";

      Fluttertoast.showToast(
          msg: "Downloading Start",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      try {
        await Dio().download(url, savePath,
            onReceiveProgress: (received, total) {
              if (total != -1) {
                print("${(received / total * 100).toStringAsFixed(0)}%");
              }
            });
        Fluttertoast.showToast(
            msg: "File is saved to download folder.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } on DioError catch (e) {
        Fluttertoast.showToast(
            msg: e.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text('VAYU-SAMPARC'))
            ],
          ),
        ),
        body: ListView.separated(
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
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 20,
                        vertical: MediaQuery.of(context).size.width / 20,
                      ),
                      child: Text(
                        "EPPO",
                        style: TextStyle(
                          color: Color(0xFF394361),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Container(
                        color: Colors.white,
                        // color: Color(0xFFe7f2f9),
                        child: ListView.separated(
                            primary: false,
                            itemCount: data.length,
                            separatorBuilder: (context, position) => SizedBox(
                                  height: 0,
                                ),
                            shrinkWrap: true,
                            itemBuilder: (context, position) {
                              return Container(
                                child: Table(
                                  columnWidths: const {
                                    0: FlexColumnWidth(),
                                    1: FixedColumnWidth(50),
                                    2: FixedColumnWidth(50),
                                  },
                                  border: TableBorder.all(
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TableRow(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  40),
                                          child: Text(data[position].name),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  70),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        pdf(data[position]
                                                            .download),
                                                  ));
                                            },
                                            child: Icon(
                                              Icons.picture_as_pdf,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                  .size
                                                  .width /
                                                  50),
                                          child: GestureDetector(
                                            onTap: () {
                                              saveFile(data[position]
                                                  .download);
                                            },
                                            child: Icon(
                                              Icons.download,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            })),
                  )
                ],
              );
            }));
  }
}
