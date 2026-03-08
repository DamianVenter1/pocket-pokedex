import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final String token;
  final String refreshToken;
  final AuthenticationStatus _status;

  Authentication.authenticated({
    required this.token,
    required this.refreshToken,
  }) : _status = AuthenticationStatus.authenticated;

  Authentication.unauthenticated()
      : token = "",
        refreshToken = "",
        _status = AuthenticationStatus.unauthenticated;

  Authentication.determining()
      : token = "",
        refreshToken = "",
        _status = AuthenticationStatus.determining;

  bool get isAuthenticated => _status == AuthenticationStatus.authenticated;
  bool get isUnauthenticated => _status == AuthenticationStatus.unauthenticated;
  bool get isDetermining => _status == AuthenticationStatus.determining;

  factory Authentication.fromFirebaseUser(User? user) {
    if (user == null) {
      return Authentication.unauthenticated();
    }
    return Authentication.authenticated(
      token: user.uid,
      refreshToken: user.refreshToken ?? "",
    );
  }

  factory Authentication.fromJson(Map<String, dynamic> json) {
    final status = AuthenticationStatus.values
        .where((e) => e.name == json['status'])
        .firstOrNull;
    if (status != null) {
      switch (status) {
        case AuthenticationStatus.authenticated:
          return Authentication.authenticated(
            token: json['token'],
            refreshToken: json['refreshToken'],
          );
        case AuthenticationStatus.unauthenticated:
          return Authentication.unauthenticated();
        case AuthenticationStatus.determining:
          return Authentication.determining();
      }
    } else {
      return Authentication.unauthenticated();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "refreshToken": refreshToken,
      "status": _status.name,
    };
  }
}

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  determining,
}
