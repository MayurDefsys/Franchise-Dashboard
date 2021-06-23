import 'package:flutter/material.dart';
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
          title: Text("DashBoard"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Text("Latest News"),
              Text("Social Wall"),
              Text("Connected Apps"),
            ],
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 24.0,
              ),
            ),
          ],
        ),
        drawer: CustomDrawer(),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
