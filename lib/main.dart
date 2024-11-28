import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugasuas/firebase_options.dart';
import 'package:tugasuas/pages/detail_page.dart';
import 'package:tugasuas/pages/welcome_page.dart';
import 'package:tugasuas/pages/navpages/home_page.dart'; 
import 'package:tugasuas/pages/navpages/logo_page.dart'; 
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DetailPage(),
      // home: const LogoPage(), // Mengatur halaman awal
    );
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  bool? _hasSeenWelcomePage;

  @override
  void initState() {
    super.initState();
    _checkWelcomeStatus();
  }

  /// Mengecek status apakah Welcome Page sudah pernah dilihat
  Future<void> _checkWelcomeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenWelcome = prefs.getBool('hasSeenWelcomePage') ?? false;
    setState(() {
      _hasSeenWelcomePage = hasSeenWelcome;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Menampilkan LogoPage sementara menunggu status diperiksa
    if (_hasSeenWelcomePage == null) {
      return const LogoPage();
    } else if (_hasSeenWelcomePage == true) {
      return const HomePage(); // Halaman utama setelah login
    } else {
      return const WelcomePage(); // Halaman selamat datang
    }
  }
}
