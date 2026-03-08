import 'package:formz/formz.dart';

class EmailForm extends FormzInput<String, String> {
  final bool required;

  const EmailForm.pure(
    super.value, {
    required this.required,
  }) : super.pure();
  const EmailForm.dirty(
    super.value, {
    required this.required,
  }) : super.dirty();

  EmailForm pure([String? value]) =>
      EmailForm.pure(value ?? this.value, required: required);

  EmailForm dirty([String? value]) =>
      EmailForm.dirty(value ?? this.value, required: required);

  @override
  String? validator(String value) {
    if (value.isEmpty && required) {
      return "required";
    }
    return null;
  }
}
