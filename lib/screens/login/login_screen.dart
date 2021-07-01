import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:franchise_dashboard/model/login/api_response.dart';
import 'package:franchise_dashboard/model/login/login_model.dart';
import 'package:franchise_dashboard/screens/dash_board_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//dynamic _response(http.Response response, context) {
//  switch (response.statusCode) {
//    case 200:
//      var responseJson = LoginModel.fromJson(jsonDecode(response.body));
//      print("Latest TOken $responseJson['data']['token']");
//      if (responseJson['data']['token'] != null) {
//        Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) => DashBoard()),
//        );
//      }
//      return responseJson;
//    case 400:
//      throw BadRequestException(response.body.toString());
//    case 401:
//    case 403:
//      throw UnauthorisedException(response.body.toString());
//    case 500:
//    default:
//      throw FetchDataException(
//          'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
//  }
//}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<LoginModel> login(String emailAddress, String password,
      bool isSuperAdmin, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await http.post(
      Uri.parse(
          'https://franchisedashboard.azurewebsites.net/API/V1/Account/Login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
//      "Authorization": 'Bearer $tokenLogin',
      },
      body: jsonEncode(<String, dynamic>{
        'emailAddress': emailAddress,
        'password': password,
        'isSuperAdmin': isSuperAdmin,
      }),
    );
    print("response ${response.statusCode}");
    print("bodyyyyy ${response.body}");

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);

      prefs.setString("token", responseJson['data']['token']);
      print("Latest Token ${responseJson['data']['token']}");
      if (responseJson['data']['token'] != null) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Logged in successfully")));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashBoard()),
        );
      }
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("The username or password was not valid")));
    }
  }

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(245, 245, 245, 10),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: height * 0.5,
                child: Image.asset(
                  'assets/images/bg_login.png',
                  fit: BoxFit.cover,
                ),
              ),
              _buildAssetImage(),
              Padding(
                padding: const EdgeInsets.only(top: 230.0, bottom: 80.0),
                child: Container(
                  height: height * 1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0)),
                  margin: EdgeInsets.all(18.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 25.0),
                            _buildHeadingText(),
                            SizedBox(height: 45.0),
                            _buildEmailTextField(),
                            SizedBox(height: 25.0),
                            _buildPasswordTextField(),
                            SizedBox(height: 30.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildForgotPasswordText(),
                                SizedBox(
                                  width: 35.0,
                                  height: 40.0,
                                ),
                                _buildSignInButton(),
                              ],
                            ),
                            _buildCircularProcessBar(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
        } else if (value.length > 16) {
          return 'Password must be less than 16 charater';
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

  Widget _buildCircularProcessBar() {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container();
  }

  Widget _buildHeadingText() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        "Sign into your Account",
        style: TextStyle(
          color: Color.fromRGBO(103, 102, 110, 10),
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAssetImage() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Image.asset(
          'assets/images/login.png',
          fit: BoxFit.cover,
          height: 70.0,
          width: 220.0,
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () async {
        setState(() {
          login(emailController.text, passwordController.text, false, context);
          isLoading = true;
        });
        if (_formKey.currentState.validate()) {
        } else if (!_formKey.currentState.validate()) {
          return "Please Enter Details";
        } else {
          return null;
        }

//        Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) => DashBoard()),
//        );
      },
      child: Container(
        width: width * 0.25,
        height: height * 0.06,
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
