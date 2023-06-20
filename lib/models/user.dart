import 'package:flutter/material.dart';

class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
  });

  User copy({
    String? imagePath,
    String? name,
    String? email,
    String? password,
    String? about,
    bool? isDarkTheme,
  }) =>
      User(
        //eskiyi yeninin üstüne yazma eğer değişmezse aynısı kalsın
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        about: about ?? this.about,
        isDarkMode: isDarkTheme ?? this.isDarkMode,
      );

  static User fromJson(Map<String, dynamic> json) => User(
         imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        about: json['about'],
        isDarkMode: json['isDarkMode'],
  );

  Map<String, dynamic> toJson() => {
        "imagePath": imagePath,
        "name": name,
        "email": email,
        "about": about,
        "isDarkMode": isDarkMode,
      };
}
