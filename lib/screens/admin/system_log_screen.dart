import 'package:flutter/material.dart';

class SystemLogScreen extends StatefulWidget {
  @override
  _SystemLogScreenState createState() => _SystemLogScreenState();
}

class _SystemLogScreenState extends State<SystemLogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("System Log"),
        centerTitle: true,
      ),
    );
  }
}
