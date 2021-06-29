import 'package:flutter/material.dart';

class NewsArticleTab extends StatefulWidget {
  @override
  _NewsArticleTabState createState() => _NewsArticleTabState();
}

class _NewsArticleTabState extends State<NewsArticleTab> {
  int _value1 = 1;
  bool isSwitchedStatus = false;
  bool isSwitched = false;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60.0,
                width: 60.0,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                      "https://picsum.photos/250?image=9",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                controller: emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Title",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              DropdownButtonFormField(
                value: _value1,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(14.0),
                  labelText: 'Category',
                ),
                iconSize: 25.0,
                items: [
                  DropdownMenuItem(
                    child: Text("Test1"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Test2"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("Test3"),
                    value: 3,
                  ),
                ],
                onChanged: (int value) {
                  setState(() {
                    _value1 = value;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                controller: emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Tags",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                maxLines: 3,
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                controller: emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Summary",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Switch(
                    value: isSwitchedStatus,
                    onChanged: (value) {
                      setState(() {
                        isSwitchedStatus = value;
                        print(isSwitchedStatus);
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                  Text("Status"),
                  SizedBox(
                    width: 24.0,
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                  Text("Required Reading")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Save Blog',
                      style: TextStyle(color: Color.fromRGBO(54, 108, 243, 10)),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Color.fromRGBO(253, 57, 122, 10)),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
