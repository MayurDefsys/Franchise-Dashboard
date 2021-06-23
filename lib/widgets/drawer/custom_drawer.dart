import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.8,
      child: Drawer(
        child: new Column(
          children: <Widget>[
            new Container(
              child: UserAccountsDrawerHeader(
                accountName: const Text('Test Widget'),
                accountEmail: const Text('test.widget@example.com'),
                margin: EdgeInsets.all(0.0),
              ),
              height: height * 0.2,
            ),
            new Expanded(
              child: new ListView(
                padding: const EdgeInsets.only(top: 8.0),
                children: <Widget>[
                  new ListTile(
                    title: new Text('Dashboard'),
                  ),
                  new ListTile(
                    title: const Text('News'),
                    trailing: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text('Dialog Title'),
                                  content: Text('This is my content'),
                                ));
                      },
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        size: 35.0,
                      ),
                    ),
                  ),
                  new ListTile(
                    title: const Text('Identity'),
                    trailing: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text('Dialog Title'),
                                  content: Text('This is my content'),
                                ));
                      },
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        size: 35.0,
                      ),
                    ),
                  ),
                  new ListTile(
                    title: const Text('Locatins & stores'),
                  ),
                  new ListTile(
                    title: const Text('Documentation'),
                  ),
                  new ListTile(
                    title: const Text('Reports'),
                  ),
                  new ListTile(
                    title: const Text('Apps'),
                  ),
                  new ListTile(
                    title: const Text('Admin'),
                    trailing: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text('Dialog Title'),
                                  content: Text('This is my content'),
                                ));
                      },
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        size: 35.0,
                      ),
                    ),
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
