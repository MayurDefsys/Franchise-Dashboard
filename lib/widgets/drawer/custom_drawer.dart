import 'package:flutter/material.dart';
import 'package:franchise_dashboard/screens/admin/account_setting_screen.dart';
import 'package:franchise_dashboard/screens/identity/identity_users.dart';
import 'package:franchise_dashboard/screens/identity/user_groups.dart';
import 'package:franchise_dashboard/screens/login/login_screen.dart';
import 'package:franchise_dashboard/screens/news/add_category_tag.dart';
import 'package:franchise_dashboard/screens/news/news_blog_screen.dart';
import 'package:franchise_dashboard/screens/admin/system_log_screen.dart';
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
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: new ExpansionTile(
                      title: const Text('News'),
                      children: <Widget>[
                        CustomSubModel(
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
                                  builder: (context) => NewsCategoryAndTag()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: new ExpansionTile(
                      title: const Text('Identity'),
                      children: <Widget>[
                        CustomSubModel(
                          subModule1: "Users",
                          subModule2: "User Groups",
                          onTapText1: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IdentityUsers()),
                            );
                          },
                          onTapText2: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserGroups()),
                            );
                          },
                        ),
                      ],
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
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: new ExpansionTile(
                      title: const Text('Admin'),
                      children: <Widget>[
                        CustomSubModel(
                          subModule1: "System Log",
                          subModule2: "Account Settings",
                          onTapText1: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SystemLogScreen()),
                            );
                          },
                          onTapText2: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccountSettings()),
                            );
                          },
                        ),
                      ],
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
