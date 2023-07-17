import 'package:bootcamp_app1/widgets/login_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Aşağıdaki alana e-postanızı yazınız",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 15),
          LoginTextfield(
              controller: emailController,
              hintText: "E-Posta",
              obscureText: false),
          MaterialButton(
            onPressed: () {
              passwordReset();
              Navigator.pop(context);
            },
            child: Text("Şifre sıfırla"),
          )
        ],
      ),
    );
  }
}
