import 'package:franchise_dashboard/model/login/login_model.dart';

class AuthResponse {
  final String token;
  final LoginModel user;

  AuthResponse({
    this.token,
    this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      user: json['user'],
    );
  }
}
