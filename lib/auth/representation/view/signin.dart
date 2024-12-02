import 'package:ecommerce_app/auth/representation/view/signup.dart';
import 'package:ecommerce_app/auth/representation/view/widgets/ButtonWidget.dart';
import 'package:ecommerce_app/auth/representation/view/widgets/Text.dart';
import 'package:ecommerce_app/auth/representation/view/widgets/columnwidget.dart';
import 'package:ecommerce_app/auth/representation/view/widgets/customtextfield.dart';
import 'package:ecommerce_app/auth/representation/view/widgets/passwordfield.dart';
import 'package:ecommerce_app/auth/representation/viewmodel/cubit/signin_cubit/signin_cubit.dart';
import 'package:ecommerce_app/auth/representation/viewmodel/cubit/signin_cubit/signin_state.dart';
import 'package:ecommerce_app/home/representation/view/home.dart';
import 'package:ecommerce_app/home/representation/view/widgets/bottomnav.dart';
import 'package:ecommerce_app/home/representation/viewmodel/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signin extends StatelessWidget {
  Signin({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SuccessState) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => FixedBottomNavExample(),
              ),
            );
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Sign-in failed. Please try again.'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: "Hello"),
                  SizedBox(height: 3),
                  TextWidget(text: "Sign in!"),
                  CustomTextField(
                    obsecureText: false,
                    controller: email,
                    icon: Icon(Icons.email),
                    text: "E-mail",
                  ),
                  PasswordField(controller: password, labelText: "Password"),
                  SizedBox(height: 60),
                  Button.signIn(
                    text: "SIGN IN",
                    email: email,
                    password: password,
                  ),
                  SizedBox(height: 30),
                  ColumnWidget(
                      text: "Sign up",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
