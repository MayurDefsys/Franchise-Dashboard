class LoginModel {
  final int id;
  final String emailAddress;
  final String password;
  final bool isSuperAdmin;

  LoginModel({
    this.id,
    this.emailAddress,
    this.password,
    this.isSuperAdmin,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      emailAddress: json['emailAddress'],
      password: json['password'],
      isSuperAdmin: json['isSuperAdmin'],
    );
  }
}
