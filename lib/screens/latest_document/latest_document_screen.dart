import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:franchise_dashboard/model/latest_document/latest_document_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class LatestDocument extends StatefulWidget {
  @override
  _LatestDocumentState createState() => _LatestDocumentState();
}

class _LatestDocumentState extends State<LatestDocument> {
  List<LatestDocumentModel> list;

  Future<List<LatestDocumentModel>> getLatestDocument() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    print("dfkndnfnnfngnfn $token");

    final response = await http.get(
      Uri.parse(
          'https://franchisedashboard.azurewebsites.net/API/V1/Document/List'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print("responseListToken $token");
    print("latestNewsListBody ${response.body}");
    print("statusCodeNewsList ${response.statusCode}");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print("dataaaa $data");
      var rest = data["data"]["list"] as List;
      print("rest$rest");
      list = rest
          .map<LatestDocumentModel>(
              (json) => LatestDocumentModel.fromJson(json))
          .toList();
      return list;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 10),
      body: Stack(
        children: [
          Container(
            height: height * 0.4,
            child: Image.asset(
              'assets/images/bg_image.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DashBoard",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Welcome to the Rashays Dashboard",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ],
            ),
          ),
          FutureBuilder<List<LatestDocumentModel>>(
            future: getLatestDocument(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                print("SnapshotData ${snapShot.hasData}");
                return latestDocumentListWidget(snapShot.data);
              } else if (snapShot.hasError) {
                print("SnapshotError ${snapShot.hasError}");
                return Center(child: Text("Error"));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

  Widget latestDocumentListWidget(List<LatestDocumentModel> item) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Container(
        height: height * 1,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        margin: EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: item.length,
          itemBuilder: (BuildContext context, index) {
            DateTime parseDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
                .parse(item[index].updatedDate);
            var inputDate = DateTime.parse(parseDate.toString());
            var outputFormat = DateFormat('dd-MM-yyyy');
            var outputDate = outputFormat.format(inputDate);
            return Container(
              height: height * 0.12,
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(6.0),
//                           margin: EdgeInsets.all(2.0),
                    height: height * 1,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(236, 235, 235, 10),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: IconButton(
                      icon: Icon(
                        Icons.cloud_download,
                      ),
                      iconSize: 40.0,
                      color: Color.fromRGBO(100, 108, 154, 10),
                      splashColor: Colors.purple,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        item[index].documentName,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 10),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(6.0),
                        margin: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(142, 141, 141, 10),
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Center(
                          child: Text(
                            item[index].docTypeName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
//                                          fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        outputDate,
                        style: TextStyle(
                            color: Color.fromRGBO(128, 128, 128, 10),
                            fontSize: 12.0,),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
