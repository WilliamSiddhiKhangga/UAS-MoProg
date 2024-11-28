import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugasuas/pages/login_page.dart';
import 'package:tugasuas/pages/navpages/main_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is login
          if (snapshot.hasData) {
            return const MainPage();
          } else {
            // user is not login
            return Login();
          }
        },
      ),
    );
  }
}
