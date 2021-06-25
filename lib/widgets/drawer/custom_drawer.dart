import 'package:flutter/material.dart';
import 'package:franchise_dashboard/screens/admin/account_setting_screen.dart';
import 'package:franchise_dashboard/screens/admin/system_log_screen.dart';
import 'package:franchise_dashboard/screens/identity/identity_users.dart';
import 'package:franchise_dashboard/screens/identity/user_groups.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 25.0,
                    width: 25.0,
                    color: Color.fromRGBO(232, 232, 242, 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
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
                      title: const Text('Locations & stores'),
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
      ),
    );
  }
}
