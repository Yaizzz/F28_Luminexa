import 'package:bootcamp_app1/pages/profile_page.dart';
import 'package:bootcamp_app1/widgets/login_button.dart';
import 'package:bootcamp_app1/widgets/login_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/drawer.dart';

class EtkinlikSayfasi extends StatefulWidget {
  EtkinlikSayfasi({super.key});

  @override
  State<EtkinlikSayfasi> createState() => _EtkinlikSayfasiState();
}

final etkinlikAdiController = TextEditingController();
final etkinlikTarihiController = TextEditingController();
final etkinlikAciklamasiController = TextEditingController();

class _EtkinlikSayfasiState extends State<EtkinlikSayfasi> {
  @override
  void dispose() {
    etkinlikAciklamasiController.dispose();
    etkinlikAdiController.dispose();
    etkinlikTarihiController.dispose();
    super.dispose();
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
          //actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],
          ),
      body: Center(
        child: Column(
          children: [
            LoginTextfield(
              controller: etkinlikAdiController,
              hintText: "Etkinlik Adı",
              obscureText: false,
            ),
            LoginTextfield(
              controller: etkinlikTarihiController,
              hintText: "Etkinlik Tarihi",
              obscureText: false,
            ),
            LoginTextfield(
              controller: etkinlikAciklamasiController,
              hintText: "Etkinlik Adı",
              obscureText: false,
            ),
            SizedBox(height: 24),
            LoginButton(
                onTap: () {
                  final etkinlik_adi = etkinlikAdiController.text;
                  final etkinlik_tarihi = etkinlikTarihiController.text;
                  final etkinlik_aciklamasi = etkinlikAciklamasiController.text;

                  etkinlikOlustur(
                      etkinlik_adi: etkinlik_adi,
                      etkinlik_tarihi: etkinlik_tarihi,
                      etkinlik_aciklamasi: etkinlik_aciklamasi);
                },
                text: "Etkinliği Oluştur"),
          ],
        ),
      ),
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  Future etkinlikOlustur(
      {required String etkinlik_adi,
      required etkinlik_tarihi,
      required etkinlik_aciklamasi}) async {
    final docUser = FirebaseFirestore.instance.collection('etkinlikler').doc();

    final json = {
      'etkinlik_adi': etkinlik_adi,
      'etkinlik_tarihi': etkinlik_tarihi,
      'etkinlik_aciklamasi': etkinlik_aciklamasi,
    };
    await docUser.set(json);
  }
}
