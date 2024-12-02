import 'package:ecommerce_app/auth/representation/viewmodel/cubit/signin_cubit/signin_cubit.dart';
import 'package:ecommerce_app/auth/representation/viewmodel/cubit/signin_cubit/signin_state.dart';
import 'package:ecommerce_app/auth/representation/viewmodel/cubit/signup_cubit/signup_cubit.dart';
import 'package:ecommerce_app/auth/representation/viewmodel/cubit/signup_cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Button extends StatelessWidget {
  final String text;
  final TextEditingController? email;
  final TextEditingController? password;
  final TextEditingController? username;
  final TextEditingController? phone;
  final TextEditingController? confirmpassword;
  final bool isSignUp;

  Button.signUp({
    Key? key,
    required this.text,
    required this.email,
    required this.password,
    required this.confirmpassword,
    required this.phone,
    required this.username,
  })  : isSignUp = true,
        super(key: key);

  Button.signIn({
    Key? key,
    required this.text,
    required this.email,
    required this.password,
  })  : isSignUp = false,
        username = null,
        phone = null,
        confirmpassword = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSignUp
        ? BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
            return GestureDetector(
              onTap: () {
                if (password?.text != confirmpassword?.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Passwords do not match!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else if ((password?.text.isEmpty ?? true) ||
                    (confirmpassword?.text.isEmpty ?? true)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Password fields cannot be empty!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  context.read<SignUpCubit>().signUp(
                        username: username?.text ?? '',
                        email: email?.text ?? '',
                        password: password?.text ?? '',
                        phone: phone?.text ?? '',
                        confirmpassword: confirmpassword?.text ?? '',
                      );
                }
              },
              child: Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(colors: [
                    Color(0xFF5C6BC0),
                    Color(0xFF64B5F6),
                  ]),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            );
          })
        : BlocBuilder<SignInCubit, SignInState>(builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<SignInCubit>().signIn(
                      email: email?.text ?? '',
                      password: password?.text ?? '',
                    );
              },
              child: Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(colors: [
                    Color(0xFF5C6BC0),
                    Color(0xFF64B5F6),
                  ]),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            );
          });
  }
}
