import 'package:flutter/material.dart';

class LatestDocument extends StatefulWidget {
  @override
  _LatestDocumentState createState() => _LatestDocumentState();
}

class _LatestDocumentState extends State<LatestDocument> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              height: height * 1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0)),
              margin: EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    height: height * 0.10,
                    margin: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(6.0),
//                           margin: EdgeInsets.all(2.0),
                          height: height * 1,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(236, 235, 235, 10),
                              borderRadius: BorderRadius.circular(6.0)),
                          child: IconButton(
                            icon: Icon(
                              Icons.cloud_download,
                            ),
                            iconSize: 40.0,
                            color: Color.fromRGBO(100, 108, 154, 10),
                            splashColor: Colors.purple,
                            onPressed: () {},
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 14.0,
                            ),
                            Text(
                              "A Document with Department",
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 10),
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              padding: EdgeInsets.all(6.0),
                              margin: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(142, 141, 141, 10),
                                  borderRadius: BorderRadius.circular(6.0)),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Center(
                                  child: Text(
                                    "Car Type",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
//                                          fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text("Date"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
