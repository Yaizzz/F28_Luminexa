import 'package:bootcamp_app1/services/auth_service.dart';
import 'package:bootcamp_app1/widgets/kare_icon.dart';
import 'package:bootcamp_app1/widgets/login_button.dart';
import 'package:bootcamp_app1/widgets/login_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final icon = CupertinoIcons.arrow_merge;

  //text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //signUserUp metodu
  void signUserUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    //try creating user
    if (confirmPasswordController.text == passwordController.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      //Textfield controller ile alınan değerler firebase e gönderilip kontrol edilir
      //Navigator.pop(context);
    } else {
      Navigator.pop(context);
      //show error massage
      showErrorMessage("Parolalar birbirinden farklı");
      Navigator.pop(context);
    }

    try {
      if (confirmPasswordController.text == passwordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        //Textfield controller ile alınan değerler firebase e gönderilip kontrol edilir
      } else {
        //show error massage
        showErrorMessage("Parolalar birbirinden farklı");
      }
      //pop the loading screen
      //Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading screen
      //Navigator.pop(context);
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
                const SizedBox(height: 25),

                // logo
                const Icon(
                  Icons.lock,
                  size: 50,
                ),

                const SizedBox(height: 25),

                // üye ol karşılama yazısı!
                Text(
                  'Etkinliklere Katılmanın Yeni Yolu \n                   Bize Katıl!!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // email textfield
                LoginTextfield(
                  controller: emailController,
                  hintText: 'E-Posta',
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

                // confirm password textfield
                LoginTextfield(
                  controller: confirmPasswordController,
                  hintText: 'Şifreyi Doğrula',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                // sign in button
                LoginButton(
                  onTap: signUserUp,
                  text: "Üye Ol",
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
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    KareIcon(imagePath: 'images/google.png',onTap: () => AuthService().signInWithGoogle()),

                    SizedBox(width: 25),

                    // apple button
                    KareIcon(imagePath: 'images/apple.png',onTap: () {
                      
                    },)
                  ],
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Zaten üye misin?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Giriş yap',
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
