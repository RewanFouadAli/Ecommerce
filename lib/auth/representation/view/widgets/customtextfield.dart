import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.icon,
      required this.text,
      required this.controller,
      required this.obsecureText})
      : super(key: key);

  final String text;
  final Icon icon;
  final TextEditingController controller;
  final bool obsecureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: Icon(
          icon.icon,
          color: Color(0xFF5C6BC0),
        ),
        label: Text(
          text,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
