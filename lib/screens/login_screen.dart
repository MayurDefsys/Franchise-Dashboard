import 'package:flutter/material.dart';
import 'package:franchise_dashboard/screens/dash_board_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
            ),
          ),
        ));
  }

  Widget _buildEmailTextField() {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return TextFormField(
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      controller: emailController,
      validator: (value) {
        if (value.isEmpty) {
          return "Please Enter Email";
        } else if (!(regex.hasMatch(value))) {
          return "Please Enter Valid Email";
        }
        return null;
      },
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
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Password';
        } else if (value.length < 3) {
          return 'Password must be more than 2 charater';
        } else if (value.length > 8) {
          return 'Password must be less than 8 charater';
        }
        return null;
      },
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
    return GestureDetector(
      onTap: () async {
//        if (_formKey.currentState.validate()) {
//          ScaffoldMessenger.of(context)
//              .showSnackBar(SnackBar(content: Text('Processing')));
//        } else if (!_formKey.currentState.validate()) {
//          return "Please Enter Details";
//        } else {
//          return null;
//        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashBoard()),
        );
      },
      child: Center(
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
      ),
    );
  }
}
