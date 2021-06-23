import 'package:flutter/material.dart';

class NewsCategoryAndTag extends StatefulWidget {
  @override
  _NewsCategoryAndTagState createState() => _NewsCategoryAndTagState();
}

class _NewsCategoryAndTagState extends State<NewsCategoryAndTag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Categoty/Tag"),
        centerTitle: true,
      ),
    );
  }
}
