import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:franchise_dashboard/model/news/news_model.dart';
import 'package:franchise_dashboard/screens/news/news_category_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LatestNews extends StatefulWidget {
  @override
  _LatestNewsState createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  List<NewsModel> list;

  Future<List<NewsModel>> fetchAlbum() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    print("dfkndnfnnfngnfn $token");

    final response = await http.get(
      Uri.parse(
          'https://franchisedashboard.azurewebsites.net/API/V1/News/LatestNews'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer$token',
      },
    );

    print("responseListToken $token");
    print("responseListData ${response.body}");
    print("statusCodeList ${response.statusCode}");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print("dataaaa $data");
      var rest = data["data"] as List;
      print("rest$rest");
      list = rest.map<NewsModel>((json) => NewsModel.fromJson(json)).toList();
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
          listDetailsWidget(),
//          FutureBuilder<List<NewsModel>>(
//            future: fetchAlbum(),
//            builder: (context, snapShot) {
//              if (snapShot.hasData) {
//                print("SnapshotData ${snapShot.hasData}");
//                return listDetailsWidget(snapShot.data);
//              } else if (snapShot.hasError) {
//                print("SnapshotError ${snapShot.hasError}");
//                return Center(child: Text("Error"));
//              }
//              return Center(child: CircularProgressIndicator());
//            },
//          ),
        ],
      ),
    );
  }

  Widget listDetailsWidget(//      List<NewsModel> item
      ) {
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
          itemCount: 6,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsCategory()),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      width: width * 1,
                      height: height * 0.2,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              NetworkImage("https://picsum.photos/250?image=9"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 34.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "News Category ",
                          style:
                              TextStyle(color: Color.fromRGBO(89, 93, 110, 10)),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          " Rashays Admin",
                          style: TextStyle(
                              color: Color.fromRGBO(100, 108, 154, 10)),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "05-02-2021",
                          style: TextStyle(
                              color: Color.fromRGBO(100, 108, 154, 10)),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "If you’re looking to add a flavour twist to your already delicious RASHAYS meals, we have NEW Tabasco® sauces available on every table at our restaurants located across Sydney, ACT, Wollongong and the Central Coast!",
                          style: TextStyle(
                              color: Color.fromRGBO(116, 120, 141, 10)),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.red,
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
