import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildAssetImage(),
            SizedBox(height: 25.0),
            _buildHeadingText(),
            SizedBox(height: 45.0),
            _buildEmailTextField(),
            SizedBox(height: 25.0),
            _buildPasswordTextField(),
            SizedBox(height: 20.0),
            _buildForgotPasswordText(),
            SizedBox(height: 35.0),
            _buildSignInButton(),
          ],
        ),
      ),
    ));
  }

  Widget _buildEmailTextField() {
    return TextField(
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        filled: true,
        fillColor: Color.fromRGBO(240, 240, 240, 10),
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
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      obscureText: true,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        filled: true,
        fillColor: Color.fromRGBO(240, 240, 240, 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0),
              topRight: Radius.circular(5.0),
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0)),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordText() {
    return GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot Password",
        style:
            TextStyle(fontSize: 16.0, color: Color.fromRGBO(116, 120, 141, 10)),
      ),
    );
  }

  Widget _buildHeadingText() {
    return Text(
      "Sign into your Account",
      style: TextStyle(
        color: Color.fromRGBO(103, 102, 110, 10),
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAssetImage() {
    return Image.asset(
      'assets/images/login.png',
      fit: BoxFit.cover,
      height: 70.0,
      width: 220.0,
    );
  }

  Widget _buildSignInButton() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: width * 0.3,
        height: height * 0.07,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Center(
            child: Text(
          "Sign In",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }
}
