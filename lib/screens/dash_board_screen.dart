import 'package:flutter/material.dart';
import 'package:franchise_dashboard/screens/connected_apps/connected_apps_screen.dart';
import 'package:franchise_dashboard/screens/news/latest_news_screen.dart';
import 'package:franchise_dashboard/screens/social_wall/social_wall_screen.dart';
import 'package:franchise_dashboard/widgets/drawer/custom_drawer.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            "DashBoard",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blue,
            tabs: [
              Text("Latest News",style: TextStyle(
//                  color: Colors.blue
              ),),
              Text("Social Wall",style: TextStyle(
//                  color: Colors.blue
              ),),
              Text("Connected Apps",style: TextStyle(
//                  color: Colors.blue
              ),),
            ],
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded, color: Colors.blue),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: Icon(
                Icons.notifications,
                color: Colors.black,
                size: 24.0,
              ),
            ),
          ],
        ),
        drawer: CustomDrawer(),
        body: TabBarView(
          children: [
            LatestNews(),
            SocialWall(),
            ConnectedApps(),
          ],
        ),
      ),
    );
  }
}
