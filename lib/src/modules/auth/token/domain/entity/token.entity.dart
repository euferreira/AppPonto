class TokenEntity {
  String? token;
  String? user;

  TokenEntity({this.token, this.user});

  bool get isLogged => token != null;
}

class TokenParams {
  final String token;

  TokenParams({required this.token});
}
