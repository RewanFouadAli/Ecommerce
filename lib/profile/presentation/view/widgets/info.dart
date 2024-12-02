import 'package:ecommerce_app/profile/presentation/view/widgets/listtile.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final List<Map<String, dynamic>> users;
  const Info({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return Center(child: Text('No data available.'));
    }

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Column(
          children: [
            CustomListTile(
              icon: Icons.person_outline,
              title: user['username'] ?? 'No username',
            ),
            CustomListTile(
              icon: Icons.email_outlined,
              title: user['email'] ?? 'No email',
            ),
            CustomListTile(
              icon: Icons.phone,
              title: user['phone'] ?? 'No phone',
            ),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
