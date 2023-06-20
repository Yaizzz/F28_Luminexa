import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:bootcamp_app1/widgets/appbar_widget.dart';
import 'package:bootcamp_app1/widgets/button_widget.dart';
import 'package:bootcamp_app1/widgets/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../utils/user_preferences.dart';
import '../widgets/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;
  final icon = CupertinoIcons.moon_stars;

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   leading: const BackButton(
          //     color: Colors.black,
          //   ),
          //   elevation: 0,
          //   actions: [
          //     IconButton(
          //       onPressed: () {},
          //       icon: Icon(icon),
          //       color: Colors.black,
          //     )
          //   ],
          // ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 32),
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                  imagePath: user.imagePath,
                  onClicked: () async {},
                  isEdit: true),
              const SizedBox(height: 24),
              TextFieldWidget(
                  label: "Adınız ve Soyadınız",
                  text: user.name,
                  onChanged: (name) => user = user.copy(name: name)),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: "E-Postanız",
                text: user.email,
                onChanged: (email) => user = user.copy(email: email),
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: "Hakkında",
                text: user.about,
                maxLines: 10,
                onChanged: (about) => user = user.copy(about: about),
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                text: "Kaydet",
                onClicked: () {
                  UserPreferences.setUser(user);
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
