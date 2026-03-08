part of 'login_cubit.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required bool loading,
    required EmailForm email,
    required PasswordForm password,
  }) = _LoginState;

  factory LoginState.initial() => LoginState(
        loading: false,
        email: EmailForm.pure('', required: true),
        password: PasswordForm.pure('', required: true),
      );
}
