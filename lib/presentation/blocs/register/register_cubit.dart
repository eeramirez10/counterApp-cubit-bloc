import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/index.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void onSubmit() {
    print('Submit: $state');
    emit(state.copyWith(
        formStatus: FormStatus.validating,
        username: Username.dirty(value: state.username.value),
        password: Password.dirty(value: state.password.value),
        email: Email.dirty(value: state.email.value),
        isValid:
            Formz.validate([state.username, state.email, state.password])));
  }

  void usernameChanged(String value) {
    final username = Username.dirty(value: value);
    emit(state.copyWith(
        username: username,
        isValid: Formz.validate([username, state.password])));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value: value);
    emit(state.copyWith(
        email: email,
        isValid:
            Formz.validate([state.username, state.email, state.password])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value: value);
    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username])));
  }

  bool getValidStatus() => state.isValid;
}
