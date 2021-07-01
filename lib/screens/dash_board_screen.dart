import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:franchise_dashboard/screens/connected_apps/connected_apps_screen.dart';
import 'package:franchise_dashboard/screens/graph/graph_screen.dart';
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
    return WillPopScope(
      child: DefaultTabController(
        length: 4,
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
                Text(
                  "Latest News",
                  style: TextStyle(
//                  color: Colors.blue
                      ),
                ),
                Text(
                  "Social Wall",
                  style: TextStyle(
//                  color: Colors.blue
                      ),
                ),
                Text(
                  "Connected Apps",
                  style: TextStyle(
//                  color: Colors.blue
                      ),
                ),
                Text(
                  "Graph",
                  style: TextStyle(
//                  color: Colors.blue
                      ),
                ),
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
                padding: const EdgeInsets.only(right: 22.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 24.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ],
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
              GraphScreen(),
            ],
          ),
        ),
      ),
      onWillPop: _onWillPop,
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Confirm Exit?',
                style: new TextStyle(color: Colors.black, fontSize: 20.0)),
            content: new Text(
                'Are you sure you want to exit the app?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: new Text('Yes', style: new TextStyle(fontSize: 18.0)),
              ),
              new FlatButton(
                onPressed: () => Navigator.pop(context),
                child: new Text('No', style: new TextStyle(fontSize: 18.0)),
              )
            ],
          ),
        ) ??
        false;
  }
}
