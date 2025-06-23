import 'package:clean_code/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/cubit/login_cubit.dart';
import '../controller/cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //create: (context) => AuthCubit(LoginUseCase(AuthRepositoryImpl(AuthRemoteDataSourceImpl())),),
      create: (_) => sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            print("Login successful: ${state.user.name}");
          } else if (state is AuthFailure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text("Login")),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: "Email"),
                      validator: (value) => value!.isEmpty ? "Enter email" : null,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(labelText: "Password"),
                      validator: (value) => value!.isEmpty ? "Enter password" : null,
                    ),
                    const SizedBox(height: 20),
                    if (state is AuthLoading)
                      CircularProgressIndicator()
                    else
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().login(
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        },
                        child: Text("Login"),
                      )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
