import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:franchise_dashboard/model/social_wall/social_wall_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class SocialWall extends StatefulWidget {
  @override
  _SocialWallState createState() => _SocialWallState();
}

class _SocialWallState extends State<SocialWall> {
  List<SocialWallModel> list;

  Future<List<SocialWallModel>> fetchAlbum() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    print("dfkndnfnnfngnfn $token");

    final response = await http.get(
      Uri.parse(
          'https://franchisedashboard.azurewebsites.net/API/V1/SocialMedia/SocialWallData'),
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
      var rest = data["data"] as List;
      print("rest$rest");
      list = rest
          .map<SocialWallModel>((json) => SocialWallModel.fromJson(json))
          .toList();
      return list;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
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
          FutureBuilder<List<SocialWallModel>>(
            future: fetchAlbum(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                print("SnapshotData ${snapShot.hasData}");
                return listDetailsWidget(snapShot.data);
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

  Widget listDetailsWidget(List<SocialWallModel> item) {
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
//            DateTime parseDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss")
//                .parse(item[index].postedDate);
//            var inputDate = DateTime.parse(parseDate.toString());
//            print("dateeee $inputDate");
//            var outputFormat = DateFormat('dd-MM-yyyy');
//            var outputDate = outputFormat.format(inputDate);
//            final _bd = DateTime.parse(item[index].postedDate);
//            final _date = DateTime.now();
//            final dateeee = _date.difference(_bd).inDays;
            var months = Jiffy(DateTime.now())
                .diff(Jiffy(item[index].postedDate), Units.MONTH);
            return Container(
              height: height * 0.23,
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
              child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      item[index].description,
                      style: TextStyle(
                          color: Color.fromRGBO(51, 51, 51, 10),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Image(
                            height: 40.0,
                            width: 40.0,
                            image: AssetImage(
                              item[index].applicationType == "Twitter"
                                  ? 'assets/images/twitter.png'
                                  : Container(),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item[index].author,
                              style: TextStyle(
                                color: Color.fromRGBO(100, 108, 154, 10),
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "$months Months ago",
                              style: TextStyle(
                                color: Color.fromRGBO(100, 108, 154, 10),
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 90.0,
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5.0),
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                              item[index].userImageUrl,
                            ),
                          ),
                        ),
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
