import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({Key? key, required this.icon, required this.title})
      : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          icon,
          color: Color(0xFF5C6BC0),
        ),
      ),
    );
  }
}
