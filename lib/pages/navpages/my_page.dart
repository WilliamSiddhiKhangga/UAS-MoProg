import 'package:flutter/material.dart';
import 'package:tugasuas/auth/auth_service.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  void logOut() {
    // get auth service
    final auth = AuthService();

    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: logOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
