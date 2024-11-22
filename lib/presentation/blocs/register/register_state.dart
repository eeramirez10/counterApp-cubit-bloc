part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final Email email;
  final Password password;

  const RegisterState( 
      {this.formStatus = FormStatus.invalid,
      this.username = const Username.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure(), this.isValid = false });

  RegisterState copyWith({
    FormStatus? formStatus,
    Username? username,
    Email? email,
    Password? password,
    bool? isValid
  }) =>
      RegisterState(
        formStatus: formStatus ?? this.formStatus,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        isValid: isValid ?? this.isValid
      );

  @override
  List<Object> get props => [
        formStatus,
        username,
        email,
        password,
        isValid
      ];
}
