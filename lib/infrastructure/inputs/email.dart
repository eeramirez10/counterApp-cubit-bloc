import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, length, invalid }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty({String value = ''}) : super.dirty(value);

  String? errorMessage() {

    if (isValid || isPure) return null;
    if (displayError == EmailError.empty) return 'Campo vacio';
    if (displayError == EmailError.length) return 'Minima longitud de 6 caracteres';
    if (displayError == EmailError.invalid) return 'No es un correo valido';
    
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    final emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if (value.length < 6) return EmailError.length;
    if(!emailRegExp.hasMatch(value)) return EmailError.invalid;
    return null;
  }
}
