import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => CounterScreen()));
            });
          } else if (state is LoginFailedState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                  state.msg,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            const CircularProgressIndicator();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              title: const Text("hack-talk"),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 10.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(child: Text("login")),
                        const Text("welcomeBack"),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: ' email ',
                              hintText: "Enter Your Email"),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "email must not be empty";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 22),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: ' password ',
                              hintText: "Enter Your password"),
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "password must not be empty";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 22),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context).login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          child: const Text("login"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
