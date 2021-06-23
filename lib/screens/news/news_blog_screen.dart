import 'package:flutter/material.dart';

class NewsBlog extends StatefulWidget {
  @override
  _NewsBlogState createState() => _NewsBlogState();
}

class _NewsBlogState extends State<NewsBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Blog"),
        centerTitle: true,
      ),
    );
  }
}
