import 'package:animated_theme_switcher/animated_theme_switcher.dart';
//import 'package:bootcamp_app1/pages/edit_profile_page.dart';
import 'package:bootcamp_app1/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import 'pages/profile_page.dart';
//import 'package:flutter/services.dart';
import 'themes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeProvider(
      //dark theme
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme, //theme themeDate primary açık renk seçilirse appbar iconları siyah koyu renk seçilirse iconlar beyaz oluyor
          title: "Kullanıcı Profili",
          home: profilePage(),
        ),
      ),
    );
  }
}