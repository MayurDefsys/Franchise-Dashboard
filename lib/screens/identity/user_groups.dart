import 'package:flutter/material.dart';

class UserGroups extends StatefulWidget {
  @override
  _UserGroupsState createState() => _UserGroupsState();
}

class _UserGroupsState extends State<UserGroups> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Groups"),
        centerTitle: true,
      ),
    );
  }
}
