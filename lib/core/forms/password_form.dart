import 'package:formz/formz.dart';

class PasswordForm extends FormzInput<String, String> {
  final bool required;

  const PasswordForm.pure(
    super.value, {
    required this.required,
  }) : super.pure();
  const PasswordForm.dirty(
    super.value, {
    required this.required,
  }) : super.dirty();

  PasswordForm pure([String? value]) =>
      PasswordForm.pure(value ?? this.value, required: required);

  PasswordForm dirty([String? value]) =>
      PasswordForm.dirty(value ?? this.value, required: required);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return "required";
    }
    return null;
  }
}
