import 'package:flutter/material.dart';

class IdentityUsers extends StatefulWidget {
  @override
  _IdentityUsersState createState() => _IdentityUsersState();
}

class _IdentityUsersState extends State<IdentityUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        centerTitle: true,
      ),
    );
  }
}
