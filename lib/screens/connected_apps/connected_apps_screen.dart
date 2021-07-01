import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:franchise_dashboard/model/connected_apps/connected_apps_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ConnectedApps extends StatefulWidget {
  @override
  _ConnectedAppsState createState() => _ConnectedAppsState();
}

class _ConnectedAppsState extends State<ConnectedApps> {
  List<ConnectedAppsModel> list;

  Future<List<ConnectedAppsModel>> fetchAlbum() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    print("dfkndnfnnfngnfn $token");

    final response = await http.get(
      Uri.parse(
          'https://franchisedashboard.azurewebsites.net/api/v1/integration/Integrations'),
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
          .map<ConnectedAppsModel>((json) => ConnectedAppsModel.fromJson(json))
          .toList();
      return list;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
          FutureBuilder<List<ConnectedAppsModel>>(
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

  Widget listDetailsWidget(List<ConnectedAppsModel> item) {
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
            return GestureDetector(
              onTap: () async {
                var url = item[index].redirectUrl ?? "";
                if (await canLaunch(url) != null)
                  await launch(url);
                else
                  // can't launch url, there is some error
                  throw "Could not launch $url";
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
                          fit: BoxFit.contain,
                          image: NetworkImage(item[index].imageLink),
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
                          item[index].name,
                          style:
                              TextStyle(color: Color.fromRGBO(89, 93, 110, 10)),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          item[index].description,
                          style: TextStyle(
                              color: Color.fromRGBO(100, 108, 154, 10)),
                        ),
                        SizedBox(
                          height: 10.0,
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
