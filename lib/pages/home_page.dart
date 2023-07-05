import 'package:bootcamp_app1/pages/profile_page.dart';
import 'package:bootcamp_app1/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const profilePage()));
        },
        onSignOut: () {
          signUserOut();
        },
      ),
      appBar: AppBar(
        actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],
      ),
      body: Center(
        child: Text("Welcome"),
        //child: Text("Logged İn as " + user.email!),
      ),
    );
  }
}
