abstract class AuthEvent {}

class AuthGoogleSignin extends AuthEvent {}

class AuthNaverSignin extends AuthEvent {}

class AuthKakaoSignin extends AuthEvent {}

class AuthSignout extends AuthEvent {}
