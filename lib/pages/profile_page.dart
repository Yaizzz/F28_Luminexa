import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:bootcamp_app1/widgets/appbar_widget.dart';
import 'package:bootcamp_app1/widgets/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;
  //edit field
  Future<void> editField(String field) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: buildAppBar(context),
      appBar: AppBar(
        title: Text("Profil Sayfası"),
        backgroundColor: Colors.deepPurple[400],
      ),
      body: ListView(
        children: [
          //profile picture
          const SizedBox(
            height: 50,
          ),
          const Icon(
            Icons.person,
            size: 72,
          ),
          //user name
          // const SizedBox(height: 10),
          // Text("user name"),
          //user email
          const SizedBox(
            height: 10,
          ),
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),

          //details
          MyTextBox(
            sectionName: "Hakkında",
            text: "Hi",
            onPressed: () => editField("details"),
          ),
          const SizedBox(height: 10),
          MyTextBox(
            sectionName: "Katıldığı Etkinlikler",
            text: "Etkinlikler burada gözükebilir",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
