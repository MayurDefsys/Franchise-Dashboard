import 'package:flutter/material.dart';

class LatestNews extends StatefulWidget {
  @override
  _LatestNewsState createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
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
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              height: height * 1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0)),
              margin: EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, index) {
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: width * 0.42,
                              height: height * 0.2,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://picsum.photos/250?image=9"),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Add extra kick to your meal- Introducing new Tabasco® sauce range! ",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(89, 93, 110, 10)),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Rashays Admin",
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              100, 108, 154, 10)),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      " 15-09-2020",
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              100, 108, 154, 10)),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Rashays Wagyu comes from the Darling Downs, QLD. It has been grain-fed for 450 Days,  of sauce.",
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              116, 120, 141, 10)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.red,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
