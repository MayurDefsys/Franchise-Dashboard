import 'package:flutter/material.dart';

class CustomSubModel extends StatefulWidget {
  final String subModule1;
  final String subModule2;

  const CustomSubModel({
    Key key,
    this.subModule1,
    this.subModule2,
  }) : super(key: key);

  _CustomSubModelState createState() => _CustomSubModelState();
}

class _CustomSubModelState extends State<CustomSubModel> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: height * 0.2,
        width: width * 0.7,
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 3.0,
                    backgroundColor: Colors.blueGrey,
                  ),
                  SizedBox(
                    width: 14.0,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      widget.subModule1,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 3.0,
                    backgroundColor: Colors.blueGrey,
                  ),
                  SizedBox(
                    width: 14.0,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      widget.subModule2,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
