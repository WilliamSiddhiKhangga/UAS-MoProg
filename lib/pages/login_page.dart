// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tugasuas/auth/auth_service.dart';
import 'package:tugasuas/pages/navpages/main_page.dart';

class SignIn extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignIn({super.key});

  void login(BuildContext context) async {
    // auth
    final auth = AuthService();

    // try login
    try {
      await auth.signInWithEmailAndPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: Text(e.toString()),
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
                "Hello Again",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Welcome back you've\nbeen missed",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black38,
                  height: 1.2,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              inputField(
                "Username",
                Colors.white,
                _emailController,
              ),
              inputField(
                "Password",
                Colors.black26,
                _passwordController,
                isPassword: true,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Change Password            ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black45,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => MainPage(),
                    //   ),
                    // );
                    login(context);
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
                        "Sign In",
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
                    text: "Doesn't Have Account? ",
                    style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    children: const [
                      TextSpan(
                        text: "Register Now",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
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
