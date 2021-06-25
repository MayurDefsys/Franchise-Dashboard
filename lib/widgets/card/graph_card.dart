import 'package:flutter/material.dart';

class CustomGraphCard extends StatefulWidget {
  @override
  _CustomGraphCardState createState() => _CustomGraphCardState();
}

class _CustomGraphCardState extends State<CustomGraphCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        height: height * 0.3,
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * 1,
              height: height * 0.09,
              color: Color.fromRGBO(216, 27, 96, 10),
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Text(
                    "Sales",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sum",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Text(
                  "160,368.55",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: width * 0.5,
                    height: height * 0.06,
                    color: Color.fromRGBO(
                        85, 85, 85, 10),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Report',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: width * 0.5,
                    height: height * 0.06,
                    color: Color.fromRGBO(
                        76, 76, 76, 10),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Rankings ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
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
      ),
    );
  }
}
