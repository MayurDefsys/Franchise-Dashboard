import 'package:flutter/material.dart';

class ReadHistoryTab extends StatefulWidget {
  @override
  _ReadHistoryTabState createState() => _ReadHistoryTabState();
}

class _ReadHistoryTabState extends State<ReadHistoryTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "James Gilbert",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.87), fontSize: 14.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "james@defsys.com.au	",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.87), fontSize: 14.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "UNREAD",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 0, 0, 10), fontSize: 14.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Divider(
                  height: 1.0,
                  color: Color.fromRGBO(0, 0, 0, 0.87),
                )
              ],
            ),
          );
        });
  }
}
