import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:forms_app/presentation/blocs/register/register_cubit.dart";
import "package:forms_app/presentation/widgets/inputs/custom_text_form_field.dart";
import "package:formz/formz.dart";

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    final emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          label: 'Nombre de usuario',
          errorMessage: username.errorMessage(),
          onChanged: registerCubit.usernameChanged,
          // validator: (value) {
          //   if (value == null || value.isEmpty) return 'Campo requerido';
          //   if (value.trim().isEmpty) return 'Campo requerido';
          //   if (value.length < 6) return 'Mas de 6 letras';
          //   return null;
          // },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
            label: 'Correo electronico',
            errorMessage: email.errorMessage(),
            onChanged: (value) {
              registerCubit.emailChanged(value);
            }),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          label: 'Contraseña:',
          errorMessage: password.errorMessage(),
          obscure: true,
          onChanged: (value) => registerCubit.passwordChanged(value),
        ),
        const SizedBox(
          height: 20,
        ),
        FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text(
              'Crear Usuario',
            ))
      ],
    ));
  }
}
