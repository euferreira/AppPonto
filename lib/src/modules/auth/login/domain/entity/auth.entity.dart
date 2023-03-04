class AuthEntity {
  String? token;

  AuthEntity({this.token});

  bool get isLogged => token != null;
}

class AuthParams {
  final String email;
  final String password;

  AuthParams({required this.email, required this.password});
}
