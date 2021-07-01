class ApiResponseModel {
  final int code;
  final String message;

  ApiResponseModel({
    this.code,
    this.message,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      code: json['code'],
      message: json['message'],
    );
  }
}
