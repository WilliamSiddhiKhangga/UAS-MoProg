import 'package:flutter/material.dart';
import 'package:tugasuas/pages/welcome_page.dart'; // Ganti dengan halaman tujuan setelah LogoPage

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    // Menunda perpindahan ke halaman berikutnya selama 3 detik
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomePage(), // Halaman tujuan
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'img/logo.png', // Path logo aplikasi Anda
          width: 300,
          height: 200,
        ),
      ),
    );
  }
}
