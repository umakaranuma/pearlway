class LoginResponse {
  final bool isSuccess;
  final String message;
  final Result result;
  final String? systemCode;

  LoginResponse({
    required this.isSuccess,
    required this.message,
    required this.result,
    this.systemCode,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      isSuccess: json['is_success'],
      message: json['message'],
      result: Result.fromJson(json['result']),
      systemCode: json['system_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_success': isSuccess,
      'message': message,
      'result': result.toJson(),
      'system_code': systemCode,
    };
  }
}

class Result {
  final User user;
  final String token;

  Result({
    required this.user,
    required this.token,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'token': token,
    };
  }
}

class User {
  final String name;
  final String? email;
  final int id;

  User({
    required this.name,
    this.email,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
    };
  }
}
