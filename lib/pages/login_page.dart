import 'package:bootcamp_app1/pages/home_page.dart';
import 'package:bootcamp_app1/services/auth_service.dart';
import 'package:bootcamp_app1/widgets/kare_icon.dart';
import 'package:bootcamp_app1/widgets/login_button.dart';
import 'package:bootcamp_app1/widgets/login_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'forgot_password_page.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final icon = CupertinoIcons.arrow_merge;

  //text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //signUserIn metodu
  void signUserIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      //Textfield controller ile alınan değerler firebase e gönderilip kontrol edilir

      //pop the loading screen
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading screen
      Navigator.pop(context);
      //yanlış email
      if (e.code == "user-not-found") {
        //kullanıcıya hatayı göster
        showErrorMessage("Kullanıcı bulunamadı");

        //yanlış şifre
      } else if (e.code == "wrong-password") {
        //kullanıcıya hatayı göster
        showErrorMessage("Hatalı şifre girdiniz");
      }
    }
  }

  //error massage to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.purple,
          title: Center(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Etkinliklere Katılmanın Yeni Yolu!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // email textfield
                LoginTextfield(
                  controller: emailController,
                  hintText: "E-Posta",
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                LoginTextfield(
                  controller: passwordController,
                  hintText: 'Şifre',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //misafir girişi için kullanılam buton
                      TextButton(
                        onPressed: () async {
                          final result = await AuthService().signInAnonymous();
                          if (result != null) {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          } else {
                            print("Hata ile karşılaşıldı");
                          }
                        },
                        child: Text("Misafir Girişi"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage()));
                        },
                        child: Text(
                          'Şifremi Unuttum',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                LoginButton(
                  color: Colors.black,
                  onTap: signUserIn,
                  text: "Giriş Yap",
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'veya',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // google button
                      KareIcon(
                          imagePath: 'images/google.png',
                          onTap: () => AuthService().signInWithGoogle()),

                      const SizedBox(width: 25),

                      // apple button
                      // KareIcon(
                      //   imagePath: 'images/apple.png',
                      //   onTap: () {
                      //     AuthService().signInWithGoogle()
                      //   },
                      // )
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Üye değil misin?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Üye Ol',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
