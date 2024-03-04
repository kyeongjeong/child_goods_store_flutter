abstract class AuthEvent {}

class AuthGoogleSignin extends AuthEvent {}

class AuthNaverSignin extends AuthEvent {}

class AuthKakaoSignin extends AuthEvent {}

class AuthSignout extends AuthEvent {}

class Auth3C1SSignin extends AuthEvent {
  final String? email;
  final String? password;

  Auth3C1SSignin({
    this.email,
    this.password,
  });
}

class AuthGetUser extends AuthEvent {}
