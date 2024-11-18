import 'package:flutter/material.dart';
import 'package:tugasuas/auth/auth_service.dart';
import 'package:tugasuas/pages/welcome_page.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  void logOut(BuildContext context) async {
    // get auth service
    final auth = AuthService();
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => logOut(context),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
