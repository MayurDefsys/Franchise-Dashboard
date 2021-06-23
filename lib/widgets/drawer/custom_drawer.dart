import 'package:flutter/material.dart';
import 'package:franchise_dashboard/screens/login_screen.dart';
import 'package:franchise_dashboard/screens/news/add_category_tag.dart';
import 'package:franchise_dashboard/screens/news/news_blog_screen.dart';
import 'package:franchise_dashboard/widgets/drawer/custom_sub_model.dart';

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
                accountName: const Text(
                  'User Name',
                  style: TextStyle(fontSize: 16.0),
                ),
                margin: EdgeInsets.all(0.0),
                currentAccountPicture: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                        "https://picsum.photos/seed/picsum/200/300",
                      ),
                    ),
                  ),
                ),
              ),
              height: height * 0.25,
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
                        showGeneralDialog(
                          barrierLabel: "Label",
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: Duration(milliseconds: 700),
                          context: context,
                          pageBuilder: (context, anim1, anim2) {
                            return CustomSubModel(
                              subModule1: "News",
                              subModule2: "Category and Tag",
                              onTapText1: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsBlog()),
                                );
                              },
                              onTapText2: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NewsCategoryAndTag()),
                                );
                              },
                            );
                          },
                          transitionBuilder: (context, anim1, anim2, child) {
                            return SlideTransition(
                              position:
                                  Tween(begin: Offset(0, 1), end: Offset(0, 0))
                                      .animate(anim1),
                              child: child,
                            );
                          },
                        );
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
                        showGeneralDialog(
                          barrierLabel: "Label",
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: Duration(milliseconds: 700),
                          context: context,
                          pageBuilder: (context, anim1, anim2) {
                            return CustomSubModel(
                              subModule1: "Users",
                              subModule2: "User Groups",
                            );
                          },
                          transitionBuilder: (context, anim1, anim2, child) {
                            return SlideTransition(
                              position:
                                  Tween(begin: Offset(0, 1), end: Offset(0, 0))
                                      .animate(anim1),
                              child: child,
                            );
                          },
                        );
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
                        showGeneralDialog(
                          barrierLabel: "Label",
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: Duration(milliseconds: 700),
                          context: context,
                          pageBuilder: (context, anim1, anim2) {
                            return CustomSubModel(
                              subModule1: "System Log",
                              subModule2: "Account Settings",
                            );
                          },
                          transitionBuilder: (context, anim1, anim2, child) {
                            return SlideTransition(
                              position:
                                  Tween(begin: Offset(0, 1), end: Offset(0, 0))
                                      .animate(anim1),
                              child: child,
                            );
                          },
                        );
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
