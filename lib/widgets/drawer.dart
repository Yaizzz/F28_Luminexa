import 'package:bootcamp_app1/pages/home_page.dart';
import 'package:bootcamp_app1/pages/profile_page_old.dart';
import 'package:bootcamp_app1/widgets/my_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer(
      {super.key,
      required this.onProfileTap,
      required this.onSignOut,
      required this.onEtkinlikSayfasi});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  final void Function()? onEtkinlikSayfasi;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        children: [
          //header
          DrawerHeader(
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 64,
            ),
          ),
          //home list tile
          MyListTile(
            icon: Icons.home,
            text: "A N A   S A Y F A",
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          //profile list tile
          MyListTile(
            icon: Icons.home,
            text: "P R O F İ L ",
            onTap: onProfileTap,
          ),
          //logout tile
          MyListTile(
            icon: Icons.home,
            text: "Ç I K I Ş   Y A P",
            onTap: onSignOut,
          ),
          MyListTile(
            icon: Icons.local_activity,
            text: "E T K İ N L İ K   K A Y I T",
            onTap: onEtkinlikSayfasi,
          ),
        ],
      ),
    );
  }
}
