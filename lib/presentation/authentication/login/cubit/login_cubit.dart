import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pocket_pokedex/architecture/authentication/authentication_service.dart';
import 'package:pocket_pokedex/core/forms/email_form.dart';
import 'package:pocket_pokedex/core/forms/password_form.dart';
import 'package:pocket_pokedex/core/services/snackbar_service.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationService _authenticationService;
  final SnackbarService _snackbarService;

  LoginCubit(
    this._authenticationService,
    this._snackbarService,
  ) : super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: state.email.pure(value)));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: state.password.pure(value)));
  }

  Future<void> login({required VoidCallback onSuccess}) async {
    final valid = Formz.validate([
      state.email,
      state.password,
    ]);

    if (!valid) {
      emit(state.copyWith(
        email: state.email.dirty(),
        password: state.password.dirty(),
      ));
      return;
    }

    emit(state.copyWith(loading: true));
    final response = await _authenticationService.login(
      state.email.value,
      state.password.value,
    );
    emit(state.copyWith(loading: false));
    response.fold((l) {
      final message = l is FirebaseAuthException
          ? _mapAuthException(l)
          : l.toString();
      _snackbarService.show(SnackbarMessage(message: message));
    }, (_) {
      onSuccess();
    });
  }

  String _mapAuthException(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-email':
        return 'That email address is invalid.';
      case 'user-disabled':
        return 'This account has been disabled.';
      default:
        return exception.message ?? 'Authentication failed. Please try again.';
    }
  }
}
