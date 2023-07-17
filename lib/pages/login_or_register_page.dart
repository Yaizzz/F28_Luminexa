import 'package:bootcamp_app1/pages/login_page.dart';
import 'package:bootcamp_app1/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //initially show login page
  bool showLoginPage = true;

  //toogle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) { //bool true ise loginpage dönüyoruz
      return LoginPage(onTap: togglePages); //tapleyince true false oluyor
    } else {
      return RegisterPage( //false ise registerpage açılıyor
        onTap: togglePages,
      );
    }
  }
}
