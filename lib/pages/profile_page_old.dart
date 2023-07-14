import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:bootcamp_app1/pages/edit_profile_page.dart';
import 'package:bootcamp_app1/utils/user_preferences.dart';
import 'package:bootcamp_app1/widgets/appbar_widget.dart';
import 'package:bootcamp_app1/widgets/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../widgets/button_widget.dart';
import '../widgets/numbers_widget.dart';

class profilePageOld extends StatefulWidget {
  const profilePageOld({super.key});

  @override
  State<profilePageOld> createState() => _profilePageOldState();
}

class _profilePageOldState extends State<profilePageOld> {
  final icon = CupertinoIcons.moon_stars;

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
            appBar: buildAppBar(context),
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.imagePath,
                  onClicked: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => EditProfilePage()),
                    );
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                buildName(user),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    //Kullancı login ise gözüksün yaparız
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditProfilePage()));
                    },
                    child: Text("Profili Düzenle"),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12)),
                  ),
                ),
                //Center(child: buildUpgradeButton()),
                const SizedBox(height: 24),
                NumbersWidget(),
                const SizedBox(height: 48),
                buildAbout(user),
                /* ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const profileEditPage()));
                  },
                  child: Icon(Icons.alarm)), */
              ],
            )),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  // Widget buildUpgradeButton() => ButtonWidget( //navigator context hatası verdi kullanım dışı yaptık
  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
