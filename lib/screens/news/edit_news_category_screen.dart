import 'package:flutter/material.dart';
import 'package:franchise_dashboard/screens/news/news_article_tab.dart';
import 'package:franchise_dashboard/screens/news/read_history_tab.dart';
import 'package:franchise_dashboard/widgets/drawer/custom_drawer.dart';

class EditNewsCategory extends StatefulWidget {
  @override
  _EditNewsCategoryState createState() => _EditNewsCategoryState();
}

class _EditNewsCategoryState extends State<EditNewsCategory>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  // @override
  // void initState() {
  //   _tabController = TabController(length: 2, vsync: this);
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   _tabController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2, // Added
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 245, 10),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            "DashBoard",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
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
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Edit News Blog",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    "Edit details of the blog",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Back',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Add Category / Tag',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(253, 57, 122, 10)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140.0),
              child: Container(
                height: height * 1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0)),
                margin: EdgeInsets.all(12.0),
                child: DefaultTabController(
                    length: 2, // length of tabs
                    initialIndex: 0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            child: TabBar(
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              tabs: [
                                Tab(text: 'News Article'),
                                Tab(text: 'Read History'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                                width: 120.0,
                                height: height * 1,
                                // padding: EdgeInsets.only(top: 100.0),
                                child: TabBarView(children: <Widget>[
                                  NewsArticleTab(),
                                  ReadHistoryTab(),
                                ])),
                          )
                        ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
