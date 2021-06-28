import 'package:flutter/material.dart';
import 'package:franchise_dashboard/widgets/drawer/custom_drawer.dart';

class NewsCategory extends StatefulWidget {
  @override
  _NewsCategoryState createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Container(
                    height: height * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        image: new DecorationImage(
                          image: new AssetImage('assets/images/news.png'),
                          fit: BoxFit.fill,
                        )),
                    margin: EdgeInsets.all(12.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "News Category",
                          style: TextStyle(
                              color: Color.fromRGBO(51, 51, 51, 10),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          "by Rashays Admin",
                          style: TextStyle(
                              color: Color.fromRGBO(100, 108, 154, 10),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          "Category 1",
                          style: TextStyle(
                              color: Color.fromRGBO(100, 108, 154, 10),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(3.0),
                          color: Color.fromRGBO(220, 220, 220, 10),
                          child: Text(
                            "Tabasco",
                            style: TextStyle(
                                color: Color.fromRGBO(128, 128, 128, 10),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Text(
                          "Hello There",
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 10),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
