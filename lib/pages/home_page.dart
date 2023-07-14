import 'package:bootcamp_app1/pages/etkinlik_kayit.dart';
import 'package:bootcamp_app1/pages/login_page.dart';
import 'package:bootcamp_app1/pages/profile_page.dart';
import 'package:bootcamp_app1/pages/profile_page_old.dart';
import 'package:bootcamp_app1/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;
  //sign user our metodu
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        onProfileTap: () {
          Navigator.pop(context); //başka sayfaya giderken drawerı kapatır
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfilePage()));
        },
        onSignOut: () {
          Navigator.pop(context);
          signUserOut();
        },
        onEtkinlikSayfasi: () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EtkinlikSayfasi()));
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.cover),
        ),
        child: const Center(
          child: Text("Welcome"),
          //child: Text("Logged İn as " + user.email!),
        ),
      ),
    );
  }
}
