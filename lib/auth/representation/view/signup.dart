import 'package:ecommerce_app/auth/representation/view/signin.dart';
import 'package:ecommerce_app/auth/representation/view/widgets/ButtonWidget.dart';
import 'package:ecommerce_app/auth/representation/view/widgets/Text.dart';

import 'package:ecommerce_app/auth/representation/view/widgets/columnwidget.dart';
import 'package:ecommerce_app/auth/representation/view/widgets/customtextfield.dart';
import 'package:ecommerce_app/auth/representation/view/widgets/passwordfield.dart';
import 'package:ecommerce_app/auth/representation/viewmodel/cubit/signin_cubit/signin_cubit.dart';
import 'package:ecommerce_app/auth/representation/viewmodel/cubit/signup_cubit/signup_cubit.dart';
import 'package:ecommerce_app/auth/representation/viewmodel/cubit/signup_cubit/signup_state.dart';
import 'package:ecommerce_app/home/representation/view/home.dart';
import 'package:ecommerce_app/home/representation/view/widgets/bottomnav.dart';
import 'package:ecommerce_app/home/representation/viewmodel/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (_) => HomeCubit(),
                  child: FixedBottomNavExample(),
                ),
              ),
            );
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Sign-up failed. Please try again.'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  TextWidget(text: "Create Your"),
                  SizedBox(height: 3),
                  TextWidget(text: "Account"),
                  SizedBox(height: 20),
                  CustomTextField(
                    obsecureText: false,
                    controller: username,
                    icon: Icon(Icons.person),
                    text: "UserName",
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    obsecureText: false,
                    controller: email,
                    icon: Icon(Icons.email),
                    text: "E-mail",
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    obsecureText: false,
                    controller: phone,
                    icon: Icon(Icons.phone),
                    text: "Phone Number",
                  ),
                  SizedBox(height: 20),
                  PasswordField(controller: password, labelText: "Password"),
                  SizedBox(height: 20),
                  PasswordField(
                      controller: confirmpassword,
                      labelText: "Confirm Password"),
                  SizedBox(height: 40),
                  Button.signUp(
                    text: "SIGN UP",
                    password: password,
                    confirmpassword: confirmpassword,
                    phone: phone,
                    username: username,
                    email: email,
                  ),
                  SizedBox(height: 10),
                  ColumnWidget(
                      text: "Sign in",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signin(),
                          ),
                        );
                      }),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
