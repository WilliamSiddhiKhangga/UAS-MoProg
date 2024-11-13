// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tugasuas/auth/auth_service.dart';
import 'package:tugasuas/pages/login_page.dart';
import 'package:tugasuas/pages/navpages/main_page.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  RegisterPage({super.key});

  void register(BuildContext context) async {
    // auth service
    final auth = AuthService();

    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        await auth.signUpWithEmailAndPassword(
            _emailController.text, _passwordController.text);

        // navigasi ke halaman utama jika berhasil register
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Text(e.toString()),
              )),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: ((context) => const AlertDialog(
              title: Text("Password don't match"),
            )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(),
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                "Welcome to Travoy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              inputField(
                "email",
                Colors.white,
                _emailController,
              ),
              inputField(
                "Password",
                Colors.black26,
                _passwordController,
                isPassword: true,
              ),
              inputField(
                "Confirm Password",
                Colors.black26,
                _confirmPasswordController,
                isPassword: true,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: () {
                    register(context);
                  },
                  child: Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: size.width * 0.2,
                    color: Colors.black12,
                  ),
                  Text(
                    "    Or Continue With    ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: 2,
                    width: size.width * 0.2,
                    color: Colors.black12,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  socialMediaLogin("img/google.png"),
                  socialMediaLogin("img/apple.png"),
                ],
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Already Have Account? ",
                    style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: "Login Now",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignIn(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container socialMediaLogin(String ref) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black26,
          width: 2,
        ),
      ),
      child: Image.asset(
        ref,
        height: 30,
      ),
    );
  }

  Container inputField(
      String hint, Color color, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 22,
          ),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.black45,
            fontSize: 19,
          ),
          suffixIcon: Icon(
            Icons.visibility_off_outlined,
            color: isPassword ? Colors.black26 : Colors.black26,
          ),
        ),
      ),
    );
  }
}
